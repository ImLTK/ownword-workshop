---
title: "Tuần 12: Rà soát triển khai và kiểm tra hạ tầng"
date: 2026-11-13
weight: 12
chapter: false
pre: " <b>1.12.</b> "
---

**30/11–06/12/2026**

*Kế hoạch dự kiến*

## Mục tiêu tuần 12

- Xác minh tài nguyên đang dùng và vai trò của từng dịch vụ.
- Chuẩn bị phần hướng dẫn triển khai có bằng chứng cho các bước chính.

---

## Công việc trong tuần

| Ngày | Công việc | Dự kiến bắt đầu | Dự kiến hoàn thành | Tài liệu và minh chứng |
| --- | --- | --- | --- | --- |
| 1–2 | Ghi lại địa chỉ tĩnh, cấu hình Ubuntu và các dịch vụ Docker Compose của ownword-pilot tại Singapore. Liệt kê Caddy, Next.js và PostgreSQL. Kiểm tra tên máy và snapshot trong console. | 30/11/2026 | 01/12/2026 | [Pilot deployment](../../5-workshop/5.4-deploy/) |
| 3 | Rà soát Cognito và nhà cung cấp Google tại Ohio, Lambda Pre Sign-up liên kết tài khoản và URL callback; lưu bằng chứng đã che thông tin. | 02/12/2026 | 02/12/2026 | [Cognito and Google sign-in](../../5-workshop/5.5-auth/) |
| 4 | Kiểm tra đích sao lưu S3 riêng tư, metric CloudWatch BackupFresh, alarm ownword-pilot-backup-stale và thông báo SNS cho người vận hành. | 03/12/2026 | 03/12/2026 | [Backups and monitoring](../../5-workshop/5.6-operations/) |
| 5 | Nếu cần minh họa cách triển khai từ đầu, thử trong môi trường tạm. Ghi tên máy, ngày làm và kết quả thực tế. | 04/12/2026 | 04/12/2026 | [Pilot deployment](../../5-workshop/5.4-deploy/) |

---

## Kết quả dự kiến

- Kiểm tra danh sách tài nguyên của ownword-pilot, rồi mô tả đường đi của yêu cầu, đăng nhập, dữ liệu, bản sao lưu và cảnh báo.
