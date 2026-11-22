---
title: "EC2, Lightsail Hay Lambda: Đâu Là Lựa Chọn Phù Hợp Cho Dự Án Nhỏ? ☁️"
menuTitle: "Chọn EC2, Lightsail hay Lambda"
weight: 2
chapter: false
pre: " <b>3.2.</b> "
---

| Thông tin bài đăng | Nội dung |
| --- | --- |
| Ngày đăng | 16/11/2026 |
| Liên kết bài đăng | [Bài viết gốc trên Facebook](https://www.facebook.com/share/p/1AyGgM759M/) |
| Chủ đề bài đăng | Chọn Amazon EC2, Amazon Lightsail hoặc AWS Lambda cho dự án nhỏ |

Một trang portfolio và một tác vụ gửi email xác nhận đơn hàng cần những thứ khác nhau. Mình dùng hai ví dụ đó để so sánh ba dịch vụ. EC2 cho phép tùy chỉnh máy chủ và mạng, còn nhóm phải lo cập nhật, bảo mật và giám sát. Lightsail có gói dễ triển khai cho portfolio hoặc trang giới thiệu cửa hàng. Lambda có thể gửi xác nhận ngay khi có đơn.

Khi lượng truy cập tăng, hệ thống trên EC2 có thể thêm bộ cân bằng tải và Auto Scaling. Lambda giới hạn thời gian của mỗi lần gọi. Nếu dùng Lambda để chạy API, hãy tính luôn chi phí của những dịch vụ đi kèm như API Gateway hoặc cơ sở dữ liệu. Mình cũng sẽ cân nhắc thời gian phải bỏ ra để vận hành.

{{< figure src="/images/blogs/blog2.png" alt="Biểu tượng của Amazon EC2, Amazon Lightsail và AWS Lambda" caption="Hình 3.2. Ảnh bìa so sánh EC2, Lightsail và Lambda dùng trong bài đăng Facebook." >}}
