---
title: "Tuần 8: Xây dựng và triển khai bản thử nghiệm Ownword"
date: 2026-11-13
weight: 8
chapter: false
pre: " <b>1.8.</b> "
---

**02/11-08/11/2026**

*Mốc tiến độ dự án*

## Mục tiêu tuần 8

- Đưa Ownword lên môi trường thử nghiệm AWS và ghi lại cấu hình vận hành.
- Kiểm chứng khả năng sao lưu, khôi phục và cải thiện luồng thêm từ thủ công.

## Công việc trong tuần

Nếu ghi chép chỉ có ngày hoàn thành hoặc ngày ghi nhận, ngày bắt đầu là ước tính.

| Ngày | Công việc | Bắt đầu | Hoàn thành / ghi nhận | Tài liệu và minh chứng |
| --- | --- | --- | --- | --- |
| 1-2 | Chuẩn bị bàn giao mã nguồn. Ghi chú phát hành nêu việc chuyển nhanh từ câu trả lời đúng sang đặt câu, thêm nghĩa tiếng Việt vào kết quả khám phá và giảm dữ liệu gửi khi chấm bằng mô hình. | 02/11/2026 | 03/11/2026 | |
| 3-4 | Đưa bản thử nghiệm ownword-pilot lên Lightsail. Caddy xử lý HTTPS, còn Next.js và PostgreSQL chạy trên mạng Docker riêng. Cognito phụ trách đăng nhập và OpenRouter hỗ trợ phần từ vựng. | 04/11/2026 | 05/11/2026 | [Triển khai bản thử nghiệm](../../5-workshop/5.4-deploy/) · [Ảnh Lightsail](#pilot-lightsail) |
| 4 | Lấy bản dump từ S3, khôi phục vào PostgreSQL tạm rồi chạy truy vấn. Thử alarm CloudWatch và email SNS cho trường hợp bản sao quá cũ hoặc bị thiếu. | 05/11/2026 | 05/11/2026 | [Sao lưu và giám sát](../../5-workshop/5.6-operations/) · [Ảnh CloudWatch](#pilot-cloudwatch) |
| 5-7 | Cải thiện luồng thêm từ thủ công: lưu từ ngay trong khi phần bổ sung thông tin chạy nền. Điều chỉnh chấm bài để người học có thể đặt câu theo chủ đề tự chọn. | 06/11/2026 | 08/11/2026 | |

## Kết quả tuần 8

- Bản thử nghiệm đã chạy trên AWS. Nhóm lấy bản sao từ S3 để thử khôi phục và kiểm tra cảnh báo. Đây là dịp áp dụng những gì đã học về lưu trữ và giám sát vào Ownword.

### Bản thử nghiệm trên Lightsail {#pilot-lightsail}

{{< worklog-image file="ownword_lightsail.png" caption="Máy Ubuntu ownword-pilot đang chạy tại Singapore và vượt qua cả hai kiểm tra trạng thái của Lightsail vào ngày 13/11/2026." >}}

### Giám sát sao lưu bằng CloudWatch {#pilot-cloudwatch}

{{< worklog-image file="ownword_cloudwatch.png" caption="CloudWatch tại Singapore hiển thị cảnh báo ownword-pilot-backup-stale ở trạng thái OK và biểu đồ BackupFresh vào ngày 13/11/2026." >}}
