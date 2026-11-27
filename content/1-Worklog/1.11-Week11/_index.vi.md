---
title: "Tuần 11: Chuẩn bị workshop và kiến trúc"
date: 2026-11-13
weight: 11
chapter: false
pre: " <b>1.11.</b> "
---

**23/11-29/11/2026**

*Mốc tiến độ dự án*

## Mục tiêu tuần 11

- Chuyển kiến trúc và quy trình vận hành thành một workshop có thể làm lại.
- So sánh chi phí bản thử nghiệm và kiểm chứng liên kết tài khoản Google.

## Công việc trong tuần

| Ngày | Công việc | Bắt đầu | Hoàn thành / ghi nhận | Tài liệu và minh chứng |
| --- | --- | --- | --- | --- |
| 2 | Ghi lại luồng yêu cầu trên AWS, cách triển khai, cấu hình đăng nhập và quy trình sao lưu cho workshop. | 24/11/2026 | 24/11/2026 | [Kiến trúc Ownword](../../5-workshop/5.3-architecture/) · [Vận hành](../../5-workshop/5.6-operations/) |
| 2 | Lập dự toán cho 10 và 100 người học. Kiểm thử cục bộ việc lưu từ `lantern` và xác nhận dữ liệu sai kiểu không tạo thêm dòng trong PostgreSQL. | 24/11/2026 | 24/11/2026 | [Kiểm chứng và chi phí](../../5-workshop/5.7-verification/) |
| 3 | Kiểm chứng liên kết tài khoản Google bằng cách dùng cùng địa chỉ email đã xác minh để đăng nhập Google lần đầu. CloudWatch tại Singapore ghi nhận liên kết thành công với tài khoản Cognito hiện có. | 25/11/2026 | 25/11/2026 | [Minh chứng CloudWatch](../../5-workshop/5.7-verification/) |
| 4 | Đối chiếu sơ đồ AWS với hệ thống đang chạy, lần theo luồng CloudFront/WAF qua Caddy trên Lightsail tới ứng dụng và RDS. Rà soát cấu hình Cognito và Lambda tại Singapore, các tuyến gọi mô hình, đồng thời kiểm tra tên, biểu tượng và mũi tên trên sơ đồ. | 26/11/2026 | 26/11/2026 | [Kiến trúc Ownword](../../5-workshop/5.3-architecture/) |
| 5 | Rà soát hướng dẫn từ triển khai đến vận hành, gồm điều kiện đầu vào, lệnh triển khai, quyền IAM, RDS TLS, sao lưu S3, cảnh báo CloudWatch/SNS và dọn tài nguyên. Đối chiếu kết quả kiểm thử với minh chứng tương ứng. | 27/11/2026 | 27/11/2026 | [Triển khai](../../5-workshop/5.4-deploy/) · [Vận hành](../../5-workshop/5.6-operations/) |
| 6 | Đọc song song hai bản báo cáo tiếng Anh và tiếng Việt để đối chiếu kiến trúc, số liệu, giả định và cách tối ưu chi phí. Kiểm tra liên kết demo, tài liệu triển khai và thông tin định danh trong ảnh hoặc log. | 28/11/2026 | 28/11/2026 | [Workshop](../../5-workshop/) · [Kiểm chứng và chi phí](../../5-workshop/5.7-verification/) |
| 7 | Đối chiếu báo cáo với yêu cầu OJT, gồm nhật ký, tự đánh giá, phản hồi, ba bài AWS Study Group, ba báo cáo sự kiện có ảnh check-in và lịch sử điểm danh. Rà soát demo, phần chi phí của bài trình bày và các tài liệu cần có trong gói nộp nhóm. | 29/11/2026 | 29/11/2026 | [Bài chia sẻ](../../3-blogsposted/) · [Sự kiện](../../4-eventparticipated/) |

## Kết quả tuần 11

- Mình thấy sơ đồ dễ giải thích hơn khi lần theo một yêu cầu của người học. Tên miền công khai đi qua CloudFront và WAF. CloudFront kết nối đến Caddy trên Lightsail, rồi Caddy chuyển yêu cầu cho Next.js. Khi người học lưu từ, Next.js dùng một kết nối riêng đến RDS. Với phần đăng nhập, người làm lab cần cấu hình đúng tên miền công khai để Cognito đưa trình duyệt trở lại ứng dụng. [Kiến trúc và luồng dữ liệu](../../5-workshop/5.3-architecture/)
- Khi so sánh chi phí, có thể bắt đầu với số tiền hằng tháng cho gói Lightsail và RDS. Trong tháng có nhiều người dùng hơn, cần tính lại số lượt gọi mô hình, số yêu cầu và dung lượng lưu bản sao. Nhờ vậy, người làm workshop có thể thấy khoản nào sẽ tăng ngoài chi phí máy chủ và cơ sở dữ liệu. [Bảng dự toán workshop](../../5-workshop/5.7-verification/)
