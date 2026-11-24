---
title: "Tuần 11: Chuẩn bị workshop và kiến trúc"
date: 2026-11-13
weight: 11
chapter: false
pre: " <b>1.11.</b> "
---

**23/11–29/11/2026**

*Mốc tiến độ dự án*

## Mục tiêu tuần 11

- Chuyển kiến trúc và quy trình vận hành thành một workshop có thể làm lại.
- Chuẩn bị giả định chi phí và thống nhất luồng trình bày.

---

## Công việc trong tuần

Các mốc theo từng công việc là ước tính dựa trên nhật ký trước đó.

| Thứ | Công việc | Bắt đầu | Hoàn thành / ghi nhận | Tài liệu và minh chứng |
| --- | --- | --- | --- | --- |
| Thứ hai đến Thứ ba | **Tài nguyên AWS và phần trình bày.** Cùng nhóm rà soát các tài nguyên AWS của Ownword và trao đổi về phần trình bày của từng người. | 23/11/2026 | 24/11/2026 | [Ownword architecture](../../5-workshop/5.3-architecture/) |
| Thứ tư | **Sơ đồ kiến trúc.** Cập nhật sơ đồ kiến trúc để mô tả cách ứng dụng, đăng nhập, sao lưu, cảnh báo và các nhà cung cấp mô hình kết nối với nhau. | 25/11/2026 | 25/11/2026 | [Ownword architecture](../../5-workshop/5.3-architecture/) |
| Thứ năm | **Hướng dẫn workshop.** Soạn các bước triển khai, phần giải thích quyền IAM và quy trình sao lưu. Chuẩn bị ảnh minh họa cho phần hướng dẫn. | 26/11/2026 | 26/11/2026 | [Pilot deployment](../../5-workshop/5.4-deploy/) |
| Thứ sáu | **Giả định chi phí.** Xem xét các giả định chi phí cho bản thử nghiệm nhỏ và cho một tháng có nhiều lượt sử dụng hơn. | 27/11/2026 | 27/11/2026 | - |

---

## Kết quả tuần 11

- Mình thấy sơ đồ dễ giải thích hơn khi lần theo một yêu cầu của người học. Tên miền công khai đi qua CloudFront và WAF. CloudFront kết nối đến Caddy trên Lightsail, rồi Caddy chuyển yêu cầu cho Next.js. Khi người học lưu từ, Next.js dùng một kết nối riêng đến RDS. Với phần đăng nhập, người làm lab cần cấu hình đúng tên miền công khai để Cognito đưa trình duyệt trở lại ứng dụng. [Kiến trúc và luồng dữ liệu](../../5-workshop/5.3-architecture/)
- Khi so sánh chi phí, có thể bắt đầu với số tiền hằng tháng cho gói Lightsail và RDS. Trong tháng có nhiều người dùng hơn, cần tính lại số lượt gọi mô hình, số yêu cầu và dung lượng lưu bản sao. Nhờ vậy, người làm workshop có thể thấy khoản nào sẽ tăng ngoài chi phí máy chủ và cơ sở dữ liệu. [Bảng dự toán workshop](../../5-workshop/5.7-verification/)
