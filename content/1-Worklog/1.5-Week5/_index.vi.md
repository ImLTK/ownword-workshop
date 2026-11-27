---
title: "Tuần 5: CloudWatch và DNS lai"
date: 2026-11-13
weight: 5
chapter: false
pre: " <b>1.5.</b> "
---

12/10-18/10/2026

## Mục tiêu tuần 5

- Dùng metric, log và alarm để hiểu trạng thái triển khai.
- Theo dõi truy vấn DNS giữa VPC và một môi trường khác.
- Thực hành mã hóa dữ liệu lưu trữ với AWS KMS và lọc lưu lượng truy cập bằng AWS WAF.
- Phác thảo các luồng truy cập dữ liệu và ranh giới API phía máy chủ cho Ownword trước khi làm bản mẫu ở Tuần 6.

## Công việc trong tuần

Nếu ghi chép chỉ có ngày hoàn thành hoặc ngày ghi nhận, ngày bắt đầu là ước tính.

| Ngày | Công việc | Bắt đầu | Hoàn thành / ghi nhận | Tài liệu và minh chứng |
| --- | --- | --- | --- | --- |
| 1-3 | Tìm hiểu CloudWatch metrics, logs, metric filter, alarm và dashboard. Xem CPU EC2, EBS write bytes, biểu thức tìm kiếm/tính toán, log, cảnh báo lỗi và dashboard. Ảnh alarm thể hiện trạng thái chưa đủ dữ liệu tại thời điểm chụp; ảnh dashboard cho thấy thay đổi chưa được lưu. | 12/10/2026 | 14/10/2026 | [Cloud Journey / workshop](https://000008.awsstudygroup.com/1-introduction/) · [Ảnh lab](#lab-evidence-1) |
| 4 | Tìm hiểu mô hình DNS lai với Route 53 Resolver inbound endpoint, outbound endpoint và quy tắc chuyển tiếp. Xem cách phân giải truy vấn DNS giữa môi trường tại chỗ và tài nguyên AWS. | 15/10/2026 | 15/10/2026 | [Cloud Journey / workshop](https://000010.awsstudygroup.com/) · [Ảnh lab](#lab-evidence-2) |
| 5 | Thực hành bài Cloud Journey về mã hóa dữ liệu lưu trữ với AWS KMS: tạo IAM policy, role và user theo phạm vi, tạo khóa KMS do khách hàng quản lý, bật mã hóa cho S3, xem nhật ký CloudTrail bằng Athena, kiểm thử quyền truy cập tệp S3 đã mã hóa rồi dọn tài nguyên. | 16/10/2026 | 16/10/2026 | [Cloud Journey / workshop](https://000033.awsfcaj.com/) |
| 6 | Thực hành bài Cloud Journey về AWS WAF: triển khai ứng dụng mẫu, tạo WAF web ACL với AWS Managed Rules, thêm các quy tắc tùy chỉnh và quy tắc nâng cao, kiểm thử các yêu cầu bị chặn và được cho qua, xem nhật ký yêu cầu rồi dọn môi trường lab. | 17/10/2026 | 17/10/2026 | [Cloud Journey / workshop](https://000026.awsfcaj.com/) |
| 7 | Phác thảo các luồng truy cập dữ liệu và ranh giới API phía máy chủ cho Ownword trước khi bước vào Tuần 6: lưu từ, lọc trạng thái trên WordBoard, ghi kết quả nhớ từ và đặt câu, giữ khóa mô hình ở máy chủ kèm kiểm tra cấu trúc phản hồi, đồng thời lên sẵn dữ liệu demo để nhóm có thể thử mà không cần khóa thật. | 18/10/2026 | 18/10/2026 | [Đề xuất dự án](../../2-proposal/) · [Tuần 6](../1.6-week6/) |

## Kết quả tuần 5

- Alarm CloudWatch lúc đó báo chưa đủ dữ liệu. Khi làm phần giám sát sao lưu cho Ownword, nhóm xem tín hiệu bị thiếu hay bản sao quá cũ là lý do để kiểm tra. Bài DNS lai cũng giúp mình lần theo bước phân giải tên miền riêng với phần định tuyến của ứng dụng.
- Bài KMS giúp mình phân biệt quyền quản lý khóa với quyền dùng khóa trên dữ liệu mã hóa, còn bài WAF cho mình thử trực tiếp cách quy tắc quản lý sẵn và quy tắc tùy chỉnh xử lý yêu cầu thật.
- Ghi lại các thao tác đọc, ghi và bước kiểm tra phía máy chủ ở Ngày 7 giúp nhóm chốt danh sách tuyến API cần dựng trước ở [Tuần 6](../1.6-week6/).

### Đọc metric, log và trạng thái cảnh báo {#lab-evidence-1}

{{< worklog-image file="cloudwatch_stack.png" caption="Sự kiện CloudFormation của bài CloudWatch" >}}

{{< worklog-image file="cloud_watch_metrics_ebs_write_bytes.png" caption="Metric EC2 và EBS trên CloudWatch" >}}

{{< worklog-image file="search_expression_cloud_watch.png" caption="Biểu thức tìm kiếm metric CloudWatch" >}}

{{< worklog-image file="cloud_watch_math_expression.png" caption="Biểu thức tính toán metric CloudWatch" >}}

{{< worklog-image file="cloudwatch_ec2_log_messages.png" caption="Thông điệp log EC2 trên CloudWatch" >}}

{{< worklog-image file="cloudwatch_alarm.png" caption="Trạng thái alarm CloudWatch tại thời điểm chụp" >}}

{{< worklog-image file="cloudwatch_dashboard.png" caption="Dashboard CloudWatch với thay đổi chưa lưu" >}}

### Theo dõi truy vấn DNS giữa hai môi trường {#lab-evidence-2}

{{< worklog-image file="on_premise_dns.png" caption="Đầu ra CloudFormation trong bài DNS lai" >}}
