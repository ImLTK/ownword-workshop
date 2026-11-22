---
title: "Chuẩn bị môi trường lab"
date: 2026-11-20
weight: 2
chapter: false
pre: " <b>5.2.</b> "
---

## 1. Kiểm tra quyền AWS và điều kiện thực hành

Mở AWS CloudShell và kiểm tra bạn đang ở đúng tài khoản. Bạn cần role có quyền tạo và xóa các tài nguyên bên dưới. Chuẩn bị vài email thử, một dự án Google Cloud cho phép tạo OAuth client và hai khóa OpenRouter có giới hạn chi tiêu, một khóa cho từ vựng và một khóa cho đánh giá bài viết. Chương 5.5 hướng dẫn cách kiểm tra quyền dùng Bedrock.

```bash
aws sts get-caller-identity
```

| Vị trí | Dịch vụ và điều kiện |
| --- | --- |
| Singapore `ap-southeast-1` | Lightsail, default VPC cho peering, RDS PostgreSQL, bucket S3 riêng, CloudWatch, SNS, khóa KMS và ECR riêng tư cho phần mở rộng về phát hành |
| Ohio `us-east-2` | Cognito user pool, app client công khai và Lambda liên kết tài khoản |
| Bắc Virginia `us-east-1` | Chứng chỉ ACM cho người dùng, WAF phạm vi CloudFront và vùng gửi yêu cầu cho Bedrock U.S. inference profile |
| Toàn cầu | IAM, CloudFront distribution và DNS có thẩm quyền cho hai tên miền lab |

Dùng gói và tài khoản AWS hỗ trợ các dịch vụ trên. Đọc [phần dự toán](../5.7-verification/) trước khi tạo tài nguyên. [CloudShell](https://docs.aws.amazon.com/cloudshell/latest/userguide/welcome.html) · [Kiểm tra danh tính STS](https://docs.aws.amazon.com/cli/latest/reference/sts/get-caller-identity.html) · [Yêu cầu default VPC của Lightsail](https://docs.aws.amazon.com/lightsail/latest/userguide/lightsail-how-to-set-up-vpc-peering-with-aws-resources.html)

## 2. Lấy mã nguồn và chuẩn bị công cụ

Xin tệp `ownword-lab-source-2026-11-20.tar.gz` từ người phụ trách qua kênh chia sẻ mã nguồn của dự án. Trong tệp có cấu hình Compose ghi đè cho RDS, sáu migration PostgreSQL đến tính năng chuỗi ngày học, phần gọi Bedrock, tuyến đánh giá bài viết và script triển khai, sao lưu. Trên máy cá nhân, dùng Bash hoặc Git Bash có `ssh`, `scp`, `tar`, `sha256sum` và `curl`. Giữ khóa SSH bí mật của Lightsail trên máy này.

Mở terminal ở thư mục chứa tệp.

```bash
printf '%s  %s\n' '1ce1ecdb25b48e489831c631e611f05f23f1ae449d78f209120066d1946d9357' \
  'ownword-lab-source-2026-11-20.tar.gz' | sha256sum -c -
tar -tzf ownword-lab-source-2026-11-20.tar.gz | head -30
```

## 3. Ghi các thông tin của lab

Ghi lại tên và ID để khi dọn lab bạn tìm đúng tài nguyên đã tạo. Cất riêng thông tin xác thực.

| Thông tin | Ví dụ hoặc giá trị cần ghi |
| --- | --- |
| Tên miền công khai | `app-lab.example.com` trong vùng DNS bạn có quyền chỉnh |
| Tên miền máy chủ gốc | `origin-lab.example.com` trong cùng vùng DNS |
| Lightsail và IP tĩnh | `ownword-lab` và `ownword-lab-ip`. Ghi cả IPv4 công khai và riêng. |
| RDS | Tên instance, endpoint, DB subnet group, security group RDS và kết nối peering |
| Cognito và Google | Pool ID, public client ID, tên miền prefix, tên Lambda, execution role và Google OAuth client |
| Tầng phân phối và mô hình | ID và tên miền CloudFront, WAF web ACL, ARN ACM, ARN Bedrock inference profile và IAM user riêng |
| Sao lưu và cảnh báo | Tên bucket S3, IAM user sao lưu, dimension của custom metric, alarm CloudWatch, SNS topic và alias KMS |
| Tự động phát hành | Kho GitHub riêng tư, nhánh phát hành, URI kho ECR, role GitHub OIDC và AWS profile dùng để tải image trên Lightsail |

**Điểm kiểm tra.** Xác nhận bạn đang ở đúng tài khoản AWS, có quyền chỉnh vùng DNS và tệp mã nguồn đã qua kiểm tra checksum. Khi đã ghi các thông tin ban đầu, mở [sơ đồ kiến trúc](../5.3-architecture/).
