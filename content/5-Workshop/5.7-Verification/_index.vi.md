---
title: "Kiểm chứng, ước tính chi phí và dọn tài nguyên"
date: 2026-11-20
weight: 7
chapter: false
pre: " <b>5.7.</b> "
---

## 1. Chạy các bước kiểm tra của lab

Mở tên miền công khai của lab trong hai hồ sơ trình duyệt khác nhau, mỗi hồ sơ dùng một tài khoản thử. Dùng bài viết giả lập khi kiểm tra tính năng Viết. Khi làm từng bước, ghi ngày, kết quả thực tế và che thông tin riêng trong minh chứng lưu lại.

| Kiểm tra | Cách thực hiện | Kết quả mong đợi |
| --- | --- | --- |
| HTTPS công khai và máy chủ gốc | Mở URL công khai, xem header phản hồi và thử chuyển hướng HTTP. So sánh tên miền và tên trên chứng chỉ của CloudFront và máy chủ gốc. | HTTPS công khai trả 200 qua CloudFront, HTTP chuyển sang HTTPS. Chứng chỉ máy chủ gốc khớp tên miền origin. |
| WAF và chuyển tiếp yêu cầu | Thử đăng nhập, callback Google, tra từ và gửi bài Viết. Trong WAF, xem yêu cầu mẫu của các quy tắc đã bật. | Tham số OAuth và cookie phiên đến được ứng dụng. Yêu cầu ghi hợp lệ hoạt động và bạn xem được các quy tắc đã khớp trước khi đổi sang chế độ chặn. |
| Tài khoản Cognito | Đăng ký và xác nhận tài khoản A, đăng nhập bằng email/mật khẩu, đăng xuất rồi thử khôi phục mật khẩu. Dùng cùng email đã xác minh để đăng nhập Google lần đầu vào pool. | Có thể khôi phục mật khẩu và Google đã liên kết mở lại WordBoard của tài khoản A. |
| WordBoard, luyện tập và chuỗi ngày | Tra và lưu từ, tải lại WordBoard, hoàn thành bài luyện và thử phát âm. Với tài khoản lab mới, lưu thêm từ thứ hai cùng ngày rồi mở lại trạng thái chuỗi ngày học. | Từ và kết quả luyện tập còn sau khi tải lại. Trình duyệt có giọng phù hợp phát âm được. Lần lưu thứ hai không cộng thêm một ngày học. |
| Tách dữ liệu tài khoản | Trong hồ sơ trình duyệt khác, đăng nhập tài khoản B. Mở WordBoard và thử URL chi tiết từ của A nếu đã ghi lại. | B chỉ thấy dữ liệu của mình và không đọc được chi tiết từ của A. |
| Hai tuyến mô hình | Tra theo khái niệm rồi xem metric gọi Bedrock tại Bắc Virginia. Gửi bài giả lập và bản chỉnh sửa trong mục **Viết**, sau đó mở lại phản hồi đã lưu. | Tra cứu mới gọi Bedrock. Tuyến Viết qua OpenRouter trả và lưu phản hồi. |
| RDS riêng tư và sao lưu | Ghi kết quả `pg_stat_ssl` và số dòng migration từ chương 5.6. Kiểm tra S3 rồi khôi phục bản sao vào container tạm. | Kết nối RDS dùng TLS. Bản cục bộ khớp bản S3 và có thể truy vấn sau khi khôi phục. |
| Cảnh báo sao lưu | Xác nhận `BackupFresh=1` và alarm đang OK. Chạy chuyển trạng thái thử ở chương 5.6 rồi kiểm tra lịch sử và email SNS. | Chuyển trạng thái thử gửi email. Alarm tiếp tục đánh giá metric thật. |
| Tự động phát hành, nếu đã bật | Push một thay đổi lab vào `release/lightsail`. Đối chiếu tag theo commit trên GitHub, digest trên ECR và log triển khai trên VM. Mở trang công khai đã thay đổi. | GitHub Actions thành công, VM chạy đúng digest đã phát hành và trang công khai hiển thị thay đổi. |

Trên máy cá nhân, thay tên miền mẫu bằng tên miền công khai của lab rồi chạy các lệnh bên dưới. Các lệnh này đo thời gian phản hồi của trang chủ. Nếu muốn biết lượt gọi mô hình mất bao lâu, đo riêng sau khi đăng nhập.

```bash
LAB_HOST='app-lab.example.com'
curl -fsS -D - -o /dev/null -w 'HTTPS %{http_code} in %{time_total}s\n' "https://$LAB_HOST/"
curl -sS -D - -o /dev/null "http://$LAB_HOST/"
```

**Minh chứng từ hệ thống đang vận hành.** Ngày 20/11, nhóm kiểm tra RDS qua TLS, đăng nhập Cognito, lưu kết quả WordBoard và luyện tập, hai tuyến mô hình và khôi phục bản sao trong môi trường cô lập. Lần tự động phát hành đầu tiên cũng vượt qua các kiểm tra GitHub, đẩy image lên ECR và đưa hiệu ứng chữ ở cuối trang đăng nhập trở lại. Hãy ghi kết quả thực tế của bạn trong lab. [Lần tự động phát hành đầu tiên](../5.6-operations/5.6.1-releases/)

[Hành vi phản hồi CloudFront](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/RequestAndResponseBehaviorCustomOrigin.html) · [Yêu cầu mẫu trong WAF](https://docs.aws.amazon.com/waf/latest/developerguide/web-acl-testing-view-sample.html) · [Metric Bedrock](https://docs.aws.amazon.com/bedrock/latest/userguide/monitoring-runtime-metrics.html)

## 2. Lập dự toán hằng tháng

Mở [AWS Pricing Calculator](https://calculator.aws/), tạo dự toán và ghi ngày cùng các giả định sử dụng. Nếu công cụ chưa hỗ trợ một dịch vụ hoặc đơn giá, đính kèm trang giá chính thức và cách tính. [Hướng dẫn AWS Pricing Calculator](https://docs.aws.amazon.com/pricing-calculator/latest/userguide/getting-started.html)

| Phạm vi | Thông tin cần ghi |
| --- | --- |
| Điện toán và cơ sở dữ liệu tại Singapore | Gói Lightsail và snapshot. Số giờ RDS Single-AZ, dung lượng gp3 có mã hóa, phần lưu trữ bản sao vượt định mức và lưu lượng tính phí nếu có. |
| Image phát hành | Dung lượng ECR riêng tư dùng để giữ các image. Image đầu tiên của Ownword khoảng 408 MB, tương đương khoảng 0,04 USD cho cả tháng ở mức 0,10 USD mỗi GB-tháng trước khi áp dụng ưu đãi hoặc tín dụng đủ điều kiện. Theo dõi mức sử dụng GitHub Actions riêng với AWS. [Giá Amazon ECR](https://aws.amazon.com/ecr/pricing/) |
| Sao lưu và cảnh báo tại Singapore | Dung lượng bản sao và log S3, thời hạn lưu, số lượt PUT và GET, một custom metric và alarm, thông báo SNS và khóa KMS do bạn quản lý. |
| Đăng nhập tại Ohio | Gói Cognito và số người dùng hoạt động hằng tháng, số lượt gọi Lambda và CloudWatch Logs. |
| Tầng phân phối toàn cầu và Bắc Virginia | Số yêu cầu và lưu lượng CloudFront, web ACL và chi phí yêu cầu WAF, token vào và ra của Bedrock theo inference profile đã chọn. Ghi riêng chi phí tên miền nếu có. |
| Nhà cung cấp mô hình bên ngoài | Tuyến từ vựng và Viết qua OpenRouter, số token dự kiến và giới hạn chi tiêu. Tách tổng này khỏi chi phí AWS. |

Tính hai lần, một lần cho tháng chạy thử với ít người học và một lần cho tháng dùng nhiều hơn. Thay số người học, lượt gọi mô hình và thời gian lưu. Ghi khoản nào tăng và có thể điều chỉnh bằng cách nào, chẳng hạn thời gian lưu S3, giới hạn lượt gọi hay cấu hình máy. Sau buổi lab, xem lại chi phí AWS thực tế.

## 3. Dọn tài nguyên lab

Mở danh sách tài nguyên ở chương 5.2 và kiểm tra tài khoản bằng `aws sts get-caller-identity`. Lưu minh chứng và bản sao cuối nếu cần. Chỉ thực hiện các bước bên dưới với tài nguyên bạn đã tạo cho lab.

1. **Lịch chạy và cảnh báo.** Trên VM lab, bỏ ba lịch lab bằng `crontab -e`. Tại Singapore, xóa alarm CloudWatch và SNS topic. Khi khóa lab không còn được dùng, lên lịch xóa KMS key. [Xóa alarm](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_DeleteAlarms.html) · [Lên lịch xóa khóa KMS](https://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html)
   - **Tự động phát hành, nếu đã bật.** Tắt workflow GitHub của lab và bỏ dòng cron đánh dấu `ownword-registry-release`. Lưu những image còn cần rồi xóa image và kho ECR của lab. Gỡ role đẩy image và policy tải image của VM. Chỉ xóa nhà cung cấp GitHub OIDC nếu nó được tạo riêng cho lab và không còn ai dùng. [Xóa kho ECR](https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-delete.html)
2. **Tầng phân phối.** Xóa bản ghi công khai của lab. Tắt CloudFront distribution, đợi thay đổi sang trạng thái **Deployed** và xóa distribution. Nếu cần tách web ACL trước, thực hiện sau khi đã tắt distribution. Xóa web ACL và chứng chỉ ACM của lab khi đã hết liên kết. Xóa bản ghi xác thực DNS nếu nó chỉ phục vụ chứng chỉ này. [Xóa CloudFront distribution](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/HowToDeleteDistribution.html) · [Xóa chứng chỉ ACM](https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-delete.html)
3. **Đăng nhập.** Tại Ohio, gỡ trigger Pre sign-up khỏi pool lab. Xóa tên miền managed login, tắt bảo vệ xóa nếu đã bật, rồi xóa pool. Xóa Lambda của lab, CloudWatch log group và execution role cùng inline policy. Xóa Google OAuth client riêng của lab. [Xóa tên miền Cognito](https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_DeleteUserPoolDomain.html) · [Xóa pool Cognito](https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_DeleteUserPool.html)
4. **Cơ sở dữ liệu và máy chủ.** Tại Singapore, tắt bảo vệ xóa của RDS lab và đợi thay đổi có hiệu lực. Xóa instance với lựa chọn phù hợp về snapshot cuối và sao lưu tự động giữ lại. Rà soát snapshot và các bản sao còn tốn lưu trữ. Sau khi RDS giải phóng tài nguyên, xóa security group và subnet group dành riêng cho lab. Xóa bản ghi A của máy chủ gốc. Xóa VM Lightsail và snapshot không cần nữa, rồi giải phóng IP tĩnh nếu còn. Chỉ tắt peering nếu bạn bật cho lab và không có hệ thống khác dùng chung. [Xóa RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteInstance.html) · [Dọn Lightsail](https://docs.aws.amazon.com/lightsail/latest/userguide/getting-started.html)
5. **Lưu trữ và thông tin xác thực.** Tắt S3 server access logging ở bucket nguồn nếu đã bật. Làm rỗng các bucket lab, gồm phiên bản đối tượng và delete marker, rồi xóa bucket. Xóa access key, inline policy và IAM user lab cho sao lưu và Bedrock. Thu hồi hai khóa OpenRouter và dọn bản sao thông tin riêng trên máy cá nhân nếu không còn cần. [Làm rỗng bucket S3 có versioning](https://docs.aws.amazon.com/AmazonS3/latest/userguide/empty-bucket.html) · [Xóa IAM user](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_remove.html)

**Điểm kiểm tra.** Dò từng tài nguyên trong danh sách và đối chiếu với console. Ghi lại thứ bạn giữ, chẳng hạn snapshot, hoặc đã lên lịch xóa. Xem lại AWS Billing khi số liệu sử dụng cập nhật.
