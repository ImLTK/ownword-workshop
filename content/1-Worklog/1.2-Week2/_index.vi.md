---
title: "Tuần 2: Kiến thức nền AWS, EC2, IAM và S3"
date: 2026-11-13
weight: 2
chapter: false
pre: " <b>1.2.</b> "
---

21/09-27/09/2026

## Mục tiêu tuần 2

- Hiểu tác động của ngân sách, phân quyền và quy tắc mạng đến việc triển khai.
- Khởi tạo EC2, triển khai một ứng dụng đơn giản và thao tác với đối tượng trên S3.

## Công việc trong tuần

Nếu ghi chép chỉ có ngày hoàn thành hoặc ngày ghi nhận, ngày bắt đầu là ước tính.

| Ngày | Công việc | Bắt đầu | Hoàn thành / ghi nhận | Tài liệu và minh chứng |
| --- | --- | --- | --- | --- |
| 1-7 | Tìm hiểu các loại AWS Budgets, lợi ích và cách cấu hình, rồi thực hành tạo ngân sách. Tìm hiểu các gói AWS Support và quy trình tạo yêu cầu hỗ trợ. Ôn IAM users, groups, roles và chuyển role; tìm hiểu VPC, subnet, Availability Zone, network ACL và security group. Ghi chép tuần này cũng có phần tạo các EC2 đầu tiên, kết nối SSH và tạo NAT Gateway. | 21/09/2026 | 21-27/09/2026 | [Cloud Journey / workshop](https://cloudjourney.awsfcaj.com/1-explore/) |
| 2 | Tìm hiểu cách AWS Site-to-Site VPN kết nối VPC với mạng tại chỗ bằng IPsec, cùng vai trò của Virtual Private Gateway, Customer Gateway và định tuyến. | 22/09/2026 | 22/09/2026 | [Cloud Journey / workshop](https://cloudjourney.awsfcaj.com/1-explore/) |
| 3 | Tìm hiểu các đặc tính điện toán, bộ nhớ, lưu trữ và mạng của loại máy EC2. Thực hành khởi tạo và kết nối máy Windows Server 2025 và Linux. | 23/09/2026 | 23/09/2026 | [Cloud Journey / workshop](https://cloudjourney.awsfcaj.com/1-explore/) |
| 3-4 | Thực hành thay đổi loại máy EC2, tìm hiểu snapshot của máy và ổ đĩa, khởi tạo máy từ AMI. Kết nối Ubuntu, triển khai ứng dụng Node.js đầu tiên trên EC2 Windows và ôn cách gán chính sách theo phạm vi cho IAM user và group. | 23/09/2026 | 24/09/2026 | [Cloud Journey / workshop](https://cloudjourney.awsfcaj.com/1-explore/) |
| 5 | So sánh cách ứng dụng truy cập AWS bằng access key và IAM role; thực hành tạo bucket S3 và tải tệp từ EC2 Linux. Sử dụng CloudShell, các lệnh shell cơ bản và AWS CLI để liệt kê EC2 và S3. | 25/09/2026 | 25/09/2026 | [Cloud Journey / workshop](https://000048.awsstudygroup.com/) |
| 6-7 | Tạo website tĩnh trên S3 và tìm hiểu phân phối bằng CloudFront, versioning, di chuyển đối tượng giữa bucket và replication liên vùng. Ảnh chỉ chụp quá trình di chuyển đối tượng và kết quả hoàn tất, không gồm các bước còn lại. | 26/09/2026 | 27/09/2026 | [Cloud Journey / workshop](https://000057.awsstudygroup.com/) · [Ảnh lab](#lab-evidence-6) |

## Kết quả tuần 2

- Bài Node.js giúp mình phân biệt vấn đề ở máy chủ, ứng dụng hay quy tắc mạng. Đến Tuần 8, nhóm dùng lại kiến thức về lưu trữ đối tượng và quản lý phiên bản trên S3 khi làm phần sao lưu Ownword.

### Lưu trữ website, quản lý phiên bản và di chuyển đối tượng {#lab-evidence-6}

{{< worklog-image file="moving_objects.png" caption="Đang di chuyển đối tượng S3" >}}

{{< worklog-image file="moved.png" caption="S3 báo hoàn tất di chuyển đối tượng" >}}
