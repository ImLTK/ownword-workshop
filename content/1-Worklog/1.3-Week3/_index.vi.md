---
title: "Tuần 3: Thực hành RDS và Lightsail"
date: 2026-11-13
weight: 3
chapter: false
pre: " <b>1.3.</b> "
---

28/09-04/10/2026

## Mục tiêu tuần 3

- Kết nối ứng dụng web với cơ sở dữ liệu được quản lý.
- Thực hành cấu hình và xử lý lỗi ứng dụng đóng gói trên Lightsail.
- Thực hành kết nối riêng giữa hai VPC bằng VPC peering và ghi nhận bài học vận hành từ các sự kiện cộng đồng AWS trong tuần.
- Tìm hiểu khoảng cách giữa từ vựng thụ động và chủ động để xác định bài toán học tập cho Ownword.

## Công việc trong tuần

Nếu ghi chép chỉ có ngày hoàn thành hoặc ngày ghi nhận, ngày bắt đầu là ước tính.

| Ngày | Công việc | Bắt đầu | Hoàn thành / ghi nhận | Tài liệu và minh chứng |
| --- | --- | --- | --- | --- |
| 1 | Chuẩn bị mạng cho bài thực hành RDS: VPC, security group và database subnet group. Tạo cơ sở dữ liệu RDS, kết nối MySQL từ EC2, mở ứng dụng quản lý mẫu, tìm hiểu snapshot và khôi phục. Ứng dụng mẫu thuộc bài lab, không phải cơ sở dữ liệu production của Ownword. | 28/09/2026 | 28/09/2026 | [Cloud Journey / workshop](https://000005.awsstudygroup.com/) · [Ảnh lab](#lab-evidence-1) |
| 2 | Tham dự buổi theo dõi trực tiếp AWS Cloud and AI Day Hanoi 2026 tại TP. Hồ Chí Minh. Ghi chú cách lần theo sự cố đăng nhập qua nhiều dịch vụ (GoTymeX), kiểm tra định danh IAM mà ứng dụng thực sự đang dùng và tính đến vận hành sau bản demo. | 29/09/2026 | 29/09/2026 | [Báo cáo sự kiện](../../4-eventparticipated/4.1-event1/) |
| 2-4 | Tìm hiểu Lightsail instance và cơ sở dữ liệu MySQL được quản lý; kết nối Ubuntu bằng SSH và thực hành WordPress, PrestaShop, Akaunting. Ảnh cho thấy tên các instance thực hành là `Workshop-WordPress` và `Workshop-PrestaShop`. Xử lý quyền bị thiếu, đường dẫn quản trị PrestaShop khác hướng dẫn, và cài thêm PHP/Apache còn thiếu cho bài Akaunting. Tìm hiểu hạn chế cổng truy cập, snapshot thủ công/tự động, tạo máy cấu hình lớn hơn từ snapshot và cảnh báo CPU burst. Ảnh PrestaShop thể hiện lỗi khởi tạo; ảnh Akaunting hiển thị ứng dụng cùng các thông báo còn tồn tại. | 29/09/2026 | 01/10/2026 | [Cloud Journey / workshop](https://000045.awsstudygroup.com/1-database/) · [Ảnh lab](#lab-evidence-2) |
| 5 | Tham dự buổi Fireside Chat của First Cloud AI Journey với Tiến sĩ Werner Vogels tại TP. Hồ Chí Minh. Ghi lại các điểm về việc bắt đầu thiết kế cơ sở dữ liệu từ luồng đọc/ghi thường gặp, theo dõi độ trễ ở nhóm yêu cầu chậm, diễn tập khôi phục sự cố và cân đối chi phí cho bản thử nghiệm nhỏ. | 02/10/2026 | 02/10/2026 | [Báo cáo sự kiện](../../4-eventparticipated/4.3-event3/) |
| 6 | Thực hành bài Cloud Journey về VPC peering: cấu hình security group và network ACL, tạo và chấp nhận kết nối peering giữa hai VPC, cập nhật route table ở cả hai phía, bật phân giải DNS qua peering, kiểm tra kết nối riêng rồi dọn tài nguyên. | 03/10/2026 | 03/10/2026 | [Cloud Journey / workshop](https://000019.awsfcaj.com/) |
| 6-7 | Tìm hiểu vì sao người học nhận ra nhiều từ khi đọc nhưng khó dùng lại khi viết. So sánh các công cụ học từ và hỗ trợ viết phổ biến (Duolingo, Anki, Quizlet, Grammarly) để định hình hướng đi cho Ownword: nối từ vừa tìm được trong lúc viết sang bước luyện nhớ lại sau đó. | 03/10/2026 | 04/10/2026 | [Đề xuất dự án](../../2-proposal/) |

## Kết quả tuần 3

- Kết nối MySQL từ EC2 giúp kiểm tra đường tới cơ sở dữ liệu, còn mở ứng dụng trên trình duyệt kiểm tra lớp ứng dụng web. Khi bài Lightsail có chỗ khác hướng dẫn, mình xem lại quyền, phần mềm cần cài và log để khoanh vùng lỗi.
- Trong bài VPC peering, lưu lượng chỉ đi qua khi route table hai phía, security group và DNS khớp nhau. Nhờ vậy, lúc sau nhóm nối máy Lightsail của Ownword với RDS riêng tư đỡ mất thời gian hơn.
- So sánh Duolingo, Anki, Quizlet và Grammarly cùng ghi chú từ hai sự kiện giúp nhóm thu gọn hướng làm Ownword: bắt đầu từ bản nháp của người học và xây dựng cách lưu dữ liệu cùng các bước kiểm tra quanh những thao tác chính.

### Kết nối ứng dụng mẫu với RDS {#lab-evidence-1}

{{< worklog-image file="connected_ec2_rds.png" caption="Phiên SSH vào EC2 của bài lab" >}}

{{< worklog-image file="connected_ec2_to_rds.png" caption="Kết nối MySQL từ EC2 trong bài lab" >}}

{{< worklog-image file="opened_my_app_rds.png" caption="Ứng dụng quản lý mẫu mở trên trình duyệt" >}}

### Vận hành và xử lý lỗi ứng dụng trên Lightsail {#lab-evidence-2}

{{< worklog-image file="ubuntu_ssh.png" caption="Phiên SSH trình duyệt vào Ubuntu trên Lightsail" >}}

{{< worklog-image file="wordpress_site.png" caption="Trang quản trị WordPress trong bài Lightsail" >}}

{{< worklog-image file="prestashop.png" caption="Terminal PrestaShop hiển thị lỗi khởi tạo cần xử lý" >}}

{{< worklog-image file="akounting.png" caption="Màn hình Akaunting với các thông báo còn tồn tại" >}}
