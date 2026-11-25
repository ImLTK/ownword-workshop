---
title: "Tuần 4: Container và EC2 Auto Scaling"
date: 2026-11-13
weight: 4
chapter: false
pre: " <b>1.4.</b> "
---

05/10-11/10/2026

## Mục tiêu tuần 4

- So sánh dịch vụ container có quản lý với ứng dụng chạy trên nhiều máy chủ.
- Đọc tín hiệu mở rộng cùng kết quả thử tải.

## Công việc trong tuần

Nếu ghi chép chỉ có ngày hoàn thành hoặc ngày ghi nhận, ngày bắt đầu là ước tính.

| Ngày | Công việc | Bắt đầu | Hoàn thành / ghi nhận | Tài liệu và minh chứng |
| --- | --- | --- | --- | --- |
| 1 | Tìm hiểu Amazon Lightsail Containers và triển khai dịch vụ container NGINX tại Singapore. Bài tập giới thiệu một lựa chọn triển khai container có quản lý trước khi so sánh với máy chủ Ownword sau này. | 05/10/2026 | 05/10/2026 | [Cloud Journey / workshop](https://000046.awsstudygroup.com/) |
| 2-4 | Triển khai ứng dụng quản lý mẫu FCAJ bằng EC2 Auto Scaling, load balancer và cơ sở dữ liệu. Thực hành mở rộng theo lịch và theo tải, thay thế instance và kiểm thử tải. Ảnh cho thấy launch template, kết nối cơ sở dữ liệu, biểu đồ CloudWatch và kết quả tải; bảng kết quả có lỗi nên cần đọc cùng điều kiện thử, không coi là bài kiểm tra đạt hoàn toàn. | 06/10/2026 | 08/10/2026 | [Cloud Journey / workshop](https://000006.awsstudygroup.com/) · [Ảnh lab](#lab-evidence-2) |

## Kết quả tuần 4

- Bài Auto Scaling giúp mình hình dung khi nào thêm máy có ích và khi nào cần tìm nguyên nhân trước. Mình có thể đối chiếu lỗi thử tải với metric để xem chuyện gì đã xảy ra. Ownword bắt đầu với một VM Lightsail cho nhóm nhỏ, nên bài lab cho mình một cấu hình khác để so sánh.

### Mở rộng và thử tải ứng dụng nhiều máy chủ {#lab-evidence-2}

{{< worklog-image file="launch_template_auto_scaling.png" caption="Launch template EC2 cho bài mở rộng" >}}

{{< worklog-image file="auto-scale_db.png" caption="Kết nối cơ sở dữ liệu trong bài Auto Scaling" >}}

{{< worklog-image file="cloud_watch_auto_scaling.png" caption="Metric CloudWatch của bài mở rộng" >}}

{{< worklog-image file="load_test.png" caption="Bảng kiểm thử tải, bao gồm các lỗi ghi nhận" >}}
