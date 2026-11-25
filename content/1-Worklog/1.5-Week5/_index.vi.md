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

## Công việc trong tuần

Nếu ghi chép chỉ có ngày hoàn thành hoặc ngày ghi nhận, ngày bắt đầu là ước tính.

| Ngày | Công việc | Bắt đầu | Hoàn thành / ghi nhận | Tài liệu và minh chứng |
| --- | --- | --- | --- | --- |
| 1-3 | Tìm hiểu CloudWatch metrics, logs, metric filter, alarm và dashboard. Xem CPU EC2, EBS write bytes, biểu thức tìm kiếm/tính toán, log, cảnh báo lỗi và dashboard. Ảnh alarm thể hiện trạng thái chưa đủ dữ liệu tại thời điểm chụp; ảnh dashboard cho thấy thay đổi chưa được lưu. | 12/10/2026 | 14/10/2026 | [Cloud Journey / workshop](https://000008.awsstudygroup.com/1-introduction/) · [Ảnh lab](#lab-evidence-1) |
| 4 | Tìm hiểu mô hình DNS lai với Route 53 Resolver inbound endpoint, outbound endpoint và quy tắc chuyển tiếp. Xem cách phân giải truy vấn DNS giữa môi trường tại chỗ và tài nguyên AWS. | 15/10/2026 | 15/10/2026 | [Cloud Journey / workshop](https://000010.awsstudygroup.com/) · [Ảnh lab](#lab-evidence-2) |

## Kết quả tuần 5

- Alarm CloudWatch lúc đó báo chưa đủ dữ liệu. Khi làm phần giám sát sao lưu cho Ownword, nhóm xem tín hiệu bị thiếu hay bản sao quá cũ là lý do để kiểm tra. Bài DNS lai cũng giúp mình lần theo bước phân giải tên miền riêng với phần định tuyến của ứng dụng.

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
