---
title: "Kiến trúc và luồng dữ liệu"
date: 2026-11-20
weight: 3
chapter: false
pre: " <b>5.3.</b> "
---

## Luồng yêu cầu trên hệ thống đang vận hành

{{< ownword-architecture alt="Luồng yêu cầu qua CloudFront, Lightsail và RDS, cùng các luồng đăng nhập Cognito, gọi mô hình và sao lưu. GitHub Actions phát hành image lên ECR riêng tư tại Singapore để Lightsail tải về." caption="Kiến trúc Ownword và luồng tự động phát hành ngày 20/11/2026. Chọn sơ đồ để xem ở kích thước đầy đủ." >}}

| Bước | Luồng xử lý |
|---|---|
| **1–3. HTTPS công khai và máy chủ gốc** | Trình duyệt kết nối tới `app.ownword.co` qua CloudFront, với chứng chỉ ACM và web ACL của AWS WAF. CloudFront kết nối TLS tới Caddy tại `origin.ownword.co`. Caddy chuyển yêu cầu đến Next.js qua cổng 3000 trong mạng Docker Compose riêng. |
| **4. Cơ sở dữ liệu** | Next.js đọc và ghi dữ liệu vào Amazon RDS for PostgreSQL riêng tư tại Singapore qua kết nối VPC peering của Lightsail. Kết nối cơ sở dữ liệu dùng TLS và cổng 5432 chỉ cho phép địa chỉ riêng của máy Lightsail truy cập. |
| **5–8. Đăng nhập** | Next.js gọi Amazon Cognito tại Ohio để đăng nhập bằng mật khẩu và đổi mã OAuth. Khi đăng nhập bằng Google, trình duyệt đi qua luồng OAuth của Cognito rồi quay về `/auth/callback` để Next.js đổi mã bằng PKCE. Lần đầu đăng nhập theo cách này, Cognito có thể gọi Pre sign-up Lambda để liên kết danh tính Google đã xác minh với tài khoản đủ điều kiện. |
| **9–10. Gọi mô hình** | Tính năng tra cứu theo khái niệm gọi Amazon Bedrock qua endpoint Bắc Virginia và dùng cấu hình suy luận tại Mỹ của Kimi K3.1 Pro. Đánh giá bài viết gọi GPT-6.1 Terra Low qua OpenRouter. Cả hai lượt gọi đều xuất phát từ máy chủ. |
| **11–14. Sao lưu và cảnh báo** | Tác vụ trên Lightsail đọc dữ liệu RDS với quyền riêng, xuất bản sao PostgreSQL hằng ngày và tải lên S3 riêng tư. Tác vụ kiểm tra hằng giờ gửi `BackupFresh`. Khi bản sao quá hạn hoặc thiếu tín hiệu, CloudWatch gửi thông báo qua SNS được mã hóa bằng khóa KMS do nhóm quản lý. |

## Luồng phát hành

Khi có bản push vào `release/lightsail`, GitHub Actions kiểm tra mã nguồn, tạo Docker image rồi dùng thông tin xác thực AWS ngắn hạn qua GitHub OIDC để đẩy image lên Amazon ECR riêng tư ở Singapore. Lightsail kiểm tra ECR hai phút một lần. Khi có image mới, máy tải đúng phiên bản theo digest, chạy migration trên RDS và kiểm tra trang chủ cùng trang đăng nhập sau khi khởi động lại ứng dụng. Nếu bản mới không khởi động được, máy khôi phục image ứng dụng trước đó. Thực hành ở [phần mở rộng về phát hành](../5.6-operations/5.6.1-releases/).

## Cấu hình thực hành

Trước hết, bạn sẽ tạo Lightsail và RDS riêng tư cho lab. Có hai tên miền cần phân biệt. Cognito đưa người dùng về tên miền công khai sau khi đăng nhập, còn Caddy phục vụ tên miền máy chủ gốc. Tác vụ sao lưu đọc dữ liệu bằng một role PostgreSQL riêng. Ở phần sau, bạn sẽ thử khôi phục trong container PostgreSQL cô lập.

**Điểm kiểm tra.** Lần theo một yêu cầu đến RDS, một cảnh báo sao lưu đến hộp thư người vận hành và một image phát hành từ GitHub đến Lightsail.

[Tiếp theo: Chuẩn bị Lightsail và RDS riêng tư](../5.4-deploy/)
