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
- Thực hành đóng gói và triển khai ứng dụng bằng Docker cùng IAM role và RDS.
- Cùng nhóm phác thảo vòng lặp học tập của Ownword và so sánh các phương án chạy bản thử nghiệm theo chi phí và công vận hành.

## Công việc trong tuần

Nếu ghi chép chỉ có ngày hoàn thành hoặc ngày ghi nhận, ngày bắt đầu là ước tính.

| Ngày | Công việc | Bắt đầu | Hoàn thành / ghi nhận | Tài liệu và minh chứng |
| --- | --- | --- | --- | --- |
| 1 | Tìm hiểu Amazon Lightsail Containers và triển khai dịch vụ container NGINX tại Singapore. Bài tập giới thiệu một lựa chọn triển khai container có quản lý trước khi so sánh với máy chủ Ownword sau này. | 05/10/2026 | 05/10/2026 | [Cloud Journey / workshop](https://000046.awsstudygroup.com/) |
| 2-4 | Triển khai ứng dụng quản lý mẫu FCAJ bằng EC2 Auto Scaling, load balancer và cơ sở dữ liệu. Thực hành mở rộng theo lịch và theo tải, thay thế instance và kiểm thử tải. Ảnh cho thấy launch template, kết nối cơ sở dữ liệu, biểu đồ CloudWatch và kết quả tải; bảng kết quả có lỗi nên cần đọc cùng điều kiện thử, không coi là bài kiểm tra đạt hoàn toàn. | 06/10/2026 | 08/10/2026 | [Cloud Journey / workshop](https://000006.awsstudygroup.com/) · [Ảnh lab](#lab-evidence-2) |
| 5 | Thực hành bài Cloud Journey triển khai ứng dụng bằng Docker: chạy ứng dụng mẫu cục bộ trên Docker, tạo VPC và security group, cấu hình IAM role để truy cập ECR, tạo database subnet group cùng RDS và triển khai ứng dụng từ container image. | 09/10/2026 | 09/10/2026 | [Cloud Journey / workshop](https://000015.awsfcaj.com/) |
| 6 | Cùng nhóm phác thảo vòng lặp sáu bước cho từ vựng (viết, khám phá bằng cách diễn đạt ý bằng tiếng Anh hoặc tiếng Việt, chọn từ, luyện tập, truy hồi và vận dụng), các trạng thái WordBoard (New, Practicing, Active) và luồng sửa bài riêng cho phần Viết để thống nhất phần cần làm trước. | 10/10/2026 | 10/10/2026 | [Đề xuất dự án](../../2-proposal/) · [Tổng quan workshop](../../5-workshop/5.1-overview/) |
| 7 | Cùng nhóm so sánh các phương án triển khai thử nghiệm ban đầu gồm EC2 Auto Scaling, Lightsail Containers và một VM Lightsail chạy Docker. Phản xạ ban đầu của mình sau mấy bài lab trong tuần là muốn thử ngay Auto Scaling hoặc container có quản lý, nhưng các bạn chỉ ra chi phí và công cấu hình sẽ dư so với một bản thử nghiệm nhỏ. Nhóm thống nhất làm nhanh bản mẫu với Next.js và D1 trước rồi mới chốt cấu hình AWS. | 11/10/2026 | 11/10/2026 | [Kiến trúc Ownword](../../5-workshop/5.3-architecture/) |

## Kết quả tuần 4

- Bài Auto Scaling giúp mình hình dung khi nào thêm máy có ích và khi nào cần tìm nguyên nhân trước. Mình có thể đối chiếu lỗi thử tải với metric để xem chuyện gì đã xảy ra. Ownword bắt đầu với một VM Lightsail cho nhóm nhỏ, nên bài lab cho mình một cấu hình khác để so sánh.
- Bài Docker giúp mình nối được bước chạy container ở máy cá nhân với quyền IAM lấy image từ ECR và kết nối RDS, nhờ đó hình dung rõ hơn quy trình triển khai bằng container.
- Trao đổi về chi phí với nhóm giúp mình tránh dựng nhiều dịch vụ AWS hơn mức một bản thử nghiệm nhỏ cần. Làm bản mẫu Next.js và D1 trước cho phép nhóm thử vòng lặp học sáu bước trước khi tốn tiền thuê thêm máy chủ.

### Mở rộng và thử tải ứng dụng nhiều máy chủ {#lab-evidence-2}

{{< worklog-image file="launch_template_auto_scaling.png" caption="Launch template EC2 cho bài mở rộng" >}}

{{< worklog-image file="auto-scale_db.png" caption="Kết nối cơ sở dữ liệu trong bài Auto Scaling" >}}

{{< worklog-image file="cloud_watch_auto_scaling.png" caption="Metric CloudWatch của bài mở rộng" >}}

{{< worklog-image file="load_test.png" caption="Bảng kiểm thử tải, bao gồm các lỗi ghi nhận" >}}
