---
title: "Tổng quan và luồng học từ"
date: 2026-11-20
weight: 1
chapter: false
pre: " <b>5.1.</b> "
---

## Bạn sẽ xây dựng gì

Khi bản Ownword của bạn chạy, hãy đăng nhập và thử dùng như một người học. Tra từ theo khái niệm qua Bedrock, lưu một gợi ý vào WordBoard rồi luyện nhớ lại. Bạn cũng có thể gửi một bài viết giả lập để xem phản hồi. WordBoard theo dõi từ ở các trạng thái New, Practicing và Active. Chuỗi ngày học ghi lại những ngày bạn có hoạt động.

**Tình trạng truy cập mô hình khi hoàn tất báo cáo (24/11/2026).** Nhóm vẫn đang chờ AWS Support xử lý quyền truy cập mô hình. Các yêu cầu gọi GPT-6 Luna trên Amazon Bedrock từ tài khoản AWS Free Tier vẫn trả về `AccessDeniedException` dù nhóm đã chấp nhận thỏa thuận sử dụng mô hình. Nhóm tiếp tục dùng OpenRouter để truy cập GPT-6 Luna phục vụ đánh giá. Sau nhiều đợt thử nghiệm chấm bản nháp và kiểm tra bản chỉnh sửa, nhóm chọn GPT-6.1 Terra với mức suy luận thấp qua OpenRouter cho tính năng Viết đang vận hành vì mô hình cân bằng tốt nhất giữa chất lượng phản hồi và chi phí với khối lượng sử dụng của Ownword.

## Bạn sẽ thực hành gì

1. Tạo máy Lightsail và RDS PostgreSQL riêng tư tại Singapore. Kết nối qua Lightsail VPC peering và kiểm tra TLS của cơ sở dữ liệu.
2. Cấu hình Cognito tại Singapore, kiểm tra đăng nhập mật khẩu và liên kết Google. Đưa ứng dụng lên CloudFront HTTPS với WAF web ACL.
3. Dùng Bedrock qua Bắc Virginia để tra theo khái niệm và OpenRouter cho từ vựng và đánh giá bài viết.
4. Sao lưu RDS lên S3 riêng tư, khôi phục vào container tạm và kiểm tra CloudWatch gửi email qua SNS có mã hóa.
5. Theo dõi một commit qua GitHub Actions, ECR riêng tư và quá trình cập nhật trên Lightsail. Thử quy trình này trong lab của bạn ở [phần mở rộng về phát hành](../5.6-operations/5.6.1-releases/).
6. Kiểm tra ứng dụng, tính thử chi phí một tháng rồi dọn tài nguyên bạn đã tạo.

[Bắt đầu: Chuẩn bị môi trường lab](../5.2-prerequisites/)
