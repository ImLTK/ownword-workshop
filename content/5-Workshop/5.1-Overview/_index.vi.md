---
title: "Tổng quan và luồng học từ"
date: 2026-11-20
weight: 1
chapter: false
pre: " <b>5.1.</b> "
---

## Bạn sẽ xây dựng gì

Khi bản Ownword của bạn chạy, hãy đăng nhập và thử dùng như một người học. Tra từ theo khái niệm qua Bedrock, lưu một gợi ý vào WordBoard rồi luyện nhớ lại. Bạn cũng có thể gửi một bài viết giả lập để xem phản hồi. WordBoard theo dõi từ ở các trạng thái New, Practicing và Active. Chuỗi ngày học ghi lại những ngày bạn có hoạt động.

## Bạn sẽ thực hành gì

1. Tạo máy Lightsail và RDS PostgreSQL riêng tư tại Singapore. Kết nối qua Lightsail VPC peering và kiểm tra TLS của cơ sở dữ liệu.
2. Cấu hình Cognito tại Ohio, kiểm tra đăng nhập mật khẩu và liên kết Google. Đưa ứng dụng lên CloudFront HTTPS với WAF web ACL.
3. Dùng Bedrock qua Bắc Virginia để tra theo khái niệm và OpenRouter cho từ vựng và đánh giá bài viết.
4. Sao lưu RDS lên S3 riêng tư, khôi phục vào container tạm và kiểm tra CloudWatch gửi email qua SNS có mã hóa.
5. Theo dõi một commit qua GitHub Actions, ECR riêng tư và quá trình cập nhật trên Lightsail. Thử quy trình này trong lab của bạn ở [phần mở rộng về phát hành](../5.6-operations/5.6.1-releases/).
6. Kiểm tra ứng dụng, tính thử chi phí một tháng rồi dọn tài nguyên bạn đã tạo.

[Bắt đầu: Chuẩn bị môi trường lab](../5.2-prerequisites/)
