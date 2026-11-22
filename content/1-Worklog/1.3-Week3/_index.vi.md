---
title: "Tuần 3: Thực hành RDS và Lightsail"
date: 2026-11-13
weight: 3
chapter: false
pre: " <b>1.3.</b> "
---

**28/09–04/10/2026**

## Mục tiêu tuần 3

- Kết nối ứng dụng web với cơ sở dữ liệu được quản lý.
- Thực hành cấu hình và xử lý lỗi ứng dụng đóng gói trên Lightsail.

---

## Công việc trong tuần

Nếu ghi chép chỉ có ngày hoàn thành hoặc ngày ghi nhận, ngày bắt đầu là ước tính.

| Ngày | Công việc | Bắt đầu | Hoàn thành / ghi nhận | Tài liệu và minh chứng |
| --- | --- | --- | --- | --- |
| 1 | **Kết nối ứng dụng mẫu với RDS.** Chuẩn bị mạng cho bài thực hành RDS: VPC, security group và database subnet group. Tạo cơ sở dữ liệu RDS, kết nối MySQL từ EC2, mở ứng dụng quản lý mẫu, tìm hiểu snapshot và khôi phục. Ứng dụng mẫu thuộc bài lab, không phải cơ sở dữ liệu production của Ownword. | 28/09/2026 | 28/09/2026 | [Cloud Journey / workshop](https://000005.awsstudygroup.com/) · [Ảnh lab](#lab-evidence-1) |
| 4 | **Vận hành và xử lý lỗi ứng dụng trên Lightsail.** Tìm hiểu Lightsail instance và cơ sở dữ liệu MySQL được quản lý; kết nối Ubuntu bằng SSH và thực hành WordPress, PrestaShop, Akaunting. Ảnh cho thấy tên các instance thực hành là `Workshop-WordPress` và `Workshop-PrestaShop`. Xử lý quyền bị thiếu, đường dẫn quản trị PrestaShop khác hướng dẫn, và cài thêm PHP/Apache còn thiếu cho bài Akaunting. Tìm hiểu hạn chế cổng truy cập, snapshot thủ công/tự động, tạo máy cấu hình lớn hơn từ snapshot và cảnh báo CPU burst. Ảnh PrestaShop thể hiện lỗi khởi tạo; ảnh Akaunting hiển thị ứng dụng cùng các thông báo còn tồn tại. | 29/09/2026 | 01/10/2026 | [Cloud Journey / workshop](https://000045.awsstudygroup.com/1-database/) · [Ảnh lab](#lab-evidence-2) |

---

## Kết quả tuần 3

- Kết nối MySQL từ EC2 giúp kiểm tra đường tới cơ sở dữ liệu. Mở ứng dụng trên trình duyệt kiểm tra một phần khác của hệ thống. Khi bài Lightsail có chỗ khác hướng dẫn, mình xem lại quyền, phần mềm cần cài và log để khoanh vùng lỗi.

### Kết nối ứng dụng mẫu với RDS {#lab-evidence-1}

{{< worklog-image file="connected_ec2_rds.png" caption="Phiên SSH vào EC2 của bài lab" >}}

{{< worklog-image file="connected_ec2_to_rds.png" caption="Kết nối MySQL từ EC2 trong bài lab" >}}

{{< worklog-image file="opened_my_app_rds.png" caption="Ứng dụng quản lý mẫu mở trên trình duyệt" >}}

### Vận hành và xử lý lỗi ứng dụng trên Lightsail {#lab-evidence-2}

{{< worklog-image file="ubuntu_ssh.png" caption="Phiên SSH trình duyệt vào Ubuntu trên Lightsail" >}}

{{< worklog-image file="wordpress_site.png" caption="Trang quản trị WordPress trong bài Lightsail" >}}

{{< worklog-image file="prestashop.png" caption="Terminal PrestaShop hiển thị lỗi khởi tạo cần xử lý" >}}

{{< worklog-image file="akounting.png" caption="Màn hình Akaunting với các thông báo còn tồn tại" >}}
