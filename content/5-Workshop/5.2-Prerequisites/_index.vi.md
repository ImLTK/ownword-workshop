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
| Singapore `ap-southeast-1` | Lightsail và kết nối peering với VPC mặc định, RDS PostgreSQL riêng tư, Cognito và Lambda liên kết tài khoản, các bucket S3 riêng tư, CloudWatch, SNS và KMS |
| Bắc Virginia `us-east-1` | Chứng chỉ ACM cho người dùng (nếu dùng tên miền riêng), WAF phạm vi CloudFront và vùng gửi yêu cầu cho Bedrock U.S. inference profile |
| Toàn cầu | IAM, CloudFront distribution và DNS cho tên miền lab (hoặc máy chủ gốc `sslip.io` cùng tên miền HTTPS mặc định của CloudFront cho lab tạm) |

Dùng gói và tài khoản AWS hỗ trợ các dịch vụ trên. Đọc [phần dự toán](../5.7-verification/) trước khi tạo tài nguyên. [CloudShell](https://docs.aws.amazon.com/cloudshell/latest/userguide/welcome.html) · [Kiểm tra danh tính STS](https://docs.aws.amazon.com/cli/latest/reference/sts/get-caller-identity.html) · [Yêu cầu default VPC của Lightsail](https://docs.aws.amazon.com/lightsail/latest/userguide/lightsail-how-to-set-up-vpc-peering-with-aws-resources.html)

Trước khi tạo máy Lightsail hoặc RDS, xác minh checksum ở mục 2, quyền chỉnh bản ghi DNS (nếu dùng tên miền riêng), quyền tạo OAuth client trong dự án Google, hai khóa OpenRouter giới hạn chi tiêu và hộp thư nhận xác nhận SNS. Tại Singapore, ghi lại VPC mặc định và trạng thái peering hiện tại để tránh gỡ cấu hình có sẵn khi dọn lab.

## 2. Lấy mã nguồn và chuẩn bị công cụ

Xin tệp `ownword-lab-source-c8a903e.tar.gz` từ người phụ trách qua kênh chia sẻ mã nguồn của dự án. Gói lab dựa trên commit `c8a903e` của nhánh `release/lightsail`. Trong tệp có cấu hình Compose ghi đè cho RDS, bảy migration PostgreSQL đến tính năng Writing Focus, phần gọi Bedrock, tuyến đánh giá bài viết và script triển khai, sao lưu RDS. Trên máy cá nhân, dùng Bash hoặc Git Bash có `ssh`, `scp`, `tar`, `sha256sum` và `curl`. Giữ khóa SSH bí mật của Lightsail trên máy này.

Mở terminal ở thư mục chứa tệp.

```bash
printf '%s  %s\n' 'cedab64087823fb158e4deb9873a1923fb0e4bed32af83be900d2a33930fa9cd' \
  'ownword-lab-source-c8a903e.tar.gz' | sha256sum -c -
tar -tzf ownword-lab-source-c8a903e.tar.gz | head -30
```

## 3. Ghi các thông tin của lab

Ghi lại tên và ID để khi dọn lab bạn tìm đúng tài nguyên đã tạo. Cất riêng thông tin xác thực.

| Thông tin | Ví dụ hoặc giá trị cần ghi |
| --- | --- |
| Tên miền công khai | `app-lab.example.com` trong vùng DNS bạn quản lý, hoặc tên miền mặc định `*.cloudfront.net` của CloudFront nếu không dùng tên miền riêng |
| Tên miền máy chủ gốc | `origin-lab.example.com` trong vùng DNS của bạn, hoặc `origin-lab.<A-B-C-D>.sslip.io` với IPv4 tĩnh của Lightsail thay dấu chấm bằng dấu gạch nối |
| Lightsail và IP tĩnh | `ownword-lab` và `ownword-lab-ip`. Ghi cả IPv4 công khai và riêng. |
| RDS | Tên instance, endpoint, DB subnet group, security group RDS, kết nối peering và `DbiResourceId` |
| Cognito và Google | Pool ID, public client ID, tên miền prefix, tên Lambda, execution role và Google OAuth client |
| Tầng phân phối và mô hình | ID và tên miền CloudFront, WAF web ACL, ARN ACM, ARN Bedrock inference profile và IAM user riêng |
| Sao lưu và cảnh báo | Tên bucket S3, IAM user sao lưu, dimension của custom metric, alarm CloudWatch, SNS topic và alias KMS |

**Điểm kiểm tra.** Xác nhận bạn đang ở đúng tài khoản AWS, tệp mã nguồn đã qua kiểm tra checksum và bạn có quyền chỉnh DNS (nếu dùng tên miền riêng). Bạn không cần thuê tên miền để làm bài lab này: có thể kết hợp máy chủ gốc `sslip.io` với tên miền HTTPS mặc định `*.cloudfront.net` của CloudFront. Khi đã ghi các thông tin ban đầu, mở [sơ đồ kiến trúc](../5.3-architecture/).
