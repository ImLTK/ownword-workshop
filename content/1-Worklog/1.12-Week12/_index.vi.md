---
title: "Tuần 12: Rà soát triển khai và kiểm tra hạ tầng"
date: 2026-11-13
weight: 12
chapter: false
pre: " <b>1.12.</b> "
---

**30/11–06/12/2026**

*Mốc tiến độ dự án*

## Mục tiêu tuần 12

- Xác minh tài nguyên đang dùng và vai trò của từng dịch vụ.
- Chuẩn bị phần hướng dẫn triển khai có bằng chứng cho các bước chính.

---

## Công việc trong tuần

Các mốc theo từng công việc là ước tính dựa trên nhật ký trước đó.

| Thứ | Công việc | Bắt đầu | Hoàn thành / ghi nhận | Tài liệu và minh chứng |
| --- | --- | --- | --- | --- |
| Thứ hai đến Thứ ba | **Lightsail và PostgreSQL.** Rà soát cấu hình Lightsail tại Singapore, gồm địa chỉ tĩnh, Ubuntu, snapshot và các dịch vụ chạy trên máy. Kiểm tra cách ứng dụng kết nối với PostgreSQL. | 30/11/2026 | 01/12/2026 | [Pilot deployment](../../5-workshop/5.4-deploy/) |
| Thứ tư | **Cấu hình đăng nhập.** Rà soát cấu hình Cognito tại Singapore, gồm đăng nhập Google, Lambda liên kết tài khoản và các URL callback. | 02/12/2026 | 02/12/2026 | [Cognito and Google sign-in](../../5-workshop/5.5-auth/) |
| Thứ năm | **Cảnh báo sao lưu.** Kiểm tra đích sao lưu S3 riêng tư, chỉ số và cảnh báo sao lưu trên CloudWatch, cùng luồng thông báo qua SNS. | 03/12/2026 | 03/12/2026 | [Backups and monitoring](../../5-workshop/5.6-operations/) |
| Thứ sáu | **Triển khai môi trường lab.** Xem lại các bước để người tham gia có thể triển khai lại trong môi trường lab riêng. | 04/12/2026 | 04/12/2026 | [Pilot deployment](../../5-workshop/5.4-deploy/) |

---

## Kết quả tuần 12

- Các bước phát hành trong workshop giúp đối chiếu commit trên GitHub với image trên ECR, rồi tìm image đang chạy trên Lightsail. Khi image đã có trên ECR, log trên máy chủ cho biết Lightsail đang chạy bản nào. Mở trang chủ và trang đăng nhập công khai để xem người học có truy cập được không. Nếu ứng dụng không khởi động được, script có thể quay về image cũ. Các thay đổi cơ sở dữ liệu đã chạy vẫn giữ nguyên. [Hướng dẫn phát hành](../../5-workshop/5.6-operations/5.6.1-releases/)
- Sự cố cơ sở dữ liệu cần cách kiểm tra khác. Tác vụ sao lưu gửi một bản lên S3 riêng tư, CloudWatch theo dõi độ mới của bản sao và SNS gửi email cho người vận hành khi có cảnh báo. Workshop dùng cơ sở dữ liệu tạm để thử khôi phục. Nhóm có thể kiểm tra xem bản sao có truy vấn được không mà không ảnh hưởng đến dữ liệu người học. [Sao lưu và giám sát](../../5-workshop/5.6-operations/)
