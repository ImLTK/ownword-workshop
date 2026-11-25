---
title: "Điều Gì Xảy Ra Khi Website Của Bạn Đột Ngột Có 10.000 Người Truy Cập? ☁️"
menuTitle: "Xử lý lưu lượng tăng đột biến"
weight: 3
chapter: false
pre: " <b>3.3.</b> "
---

| Thông tin bài đăng | Nội dung |
| --- | --- |
| Ngày đăng | 17/11/2026 |
| Liên kết bài đăng | [Bài viết gốc trên Facebook](https://www.facebook.com/share/p/1F1qCTrZ2E/) |
| Chủ đề bài đăng | Xử lý lưu lượng truy cập tăng đột biến bằng Application Load Balancer, EC2 Auto Scaling và CloudWatch |

Hình dung một cửa hàng trực tuyến đang chạy khuyến mãi 11/11. Nếu nhiều người vào cùng lúc, trang có thể tải chậm và một số yêu cầu có thể lỗi. Mức tải còn tùy vào số người đang hoạt động và việc máy chủ phải làm cho mỗi yêu cầu, chẳng hạn xác thực tài khoản hoặc truy vấn cơ sở dữ liệu.

Application Load Balancer kiểm tra tình trạng máy chủ rồi chuyển yêu cầu đến những máy đang hoạt động tốt. EC2 Auto Scaling thêm hoặc bớt máy dựa trên mức sử dụng CPU hay số yêu cầu trên mỗi máy. CloudWatch cho biết hệ thống đang tải bao nhiêu, phản hồi mất bao lâu và có chỉ số nào vượt ngưỡng không. Máy mới cần thời gian để khởi động, và nếu cơ sở dữ liệu đang quá tải thì thêm máy chủ ứng dụng chưa chắc giải quyết được.

{{< figure src="/images/blogs/blog3.png" alt="Application Load Balancer chuyển yêu cầu đến hai máy EC2 trong nhóm Auto Scaling có kết nối với DynamoDB" caption="Hình 3.3. Sơ đồ xử lý lưu lượng tăng đột biến dùng trong bài đăng Facebook, gồm Application Load Balancer, EC2 Auto Scaling và DynamoDB." >}}
