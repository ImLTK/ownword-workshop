---
title: "Kiểm chứng, ước tính chi phí và dọn tài nguyên"
date: 2026-11-20
weight: 7
chapter: false
pre: " <b>5.7.</b> "
---

## 1. Kiểm thử và xác thực lab {#1-chạy-các-bước-kiểm-tra-của-lab}

Dùng URL công khai của lab do bạn triển khai và một tài khoản thử mới. Với mỗi bước, ghi lại yêu cầu đã gửi, kết quả quan sát và minh chứng.

### Gửi yêu cầu hợp lệ và kiểm tra cơ sở dữ liệu

1. Đăng nhập lab bằng trình duyệt. Trong **WordBoard**, dùng biểu mẫu thêm từ thủ công để lưu một từ như `lantern`. Chọn từ tài khoản thử chưa từng lưu. Tải lại WordBoard và kiểm tra từ vẫn còn.
2. Trong phiên SSH vào Lightsail, kết nối RDS của lab bằng [lệnh psql dùng TLS ở chương 5.6](../5.6-operations/#1-cấp-quyền-đọc-rds-cho-role-sao-lưu). Chạy truy vấn chỉ đọc dưới đây và thay bằng từ bạn đã lưu. Dòng trong `user_word` cho biết từ đã được lưu vào WordBoard.

```sql
SELECT w.word, uw.stage, uw.added_at
FROM public.user_word AS uw
JOIN public.word AS w ON w.id = uw.word_id
WHERE lower(w.word) = 'lantern'
ORDER BY uw.added_at DESC
LIMIT 5;
```

3. Ghi lại từ có còn trên WordBoard sau khi tải lại và RDS có trả về dòng với thời điểm lưu tương ứng hay không.

### Kiểm tra CloudWatch Logs

Đăng xuất khỏi tài khoản thử rồi đăng nhập Google lần đầu bằng cùng email đã xác minh. Kiểm tra WordBoard mở lại và hiển thị từ đã lưu. Trong CloudShell tại Singapore, chạy lệnh sau với tên hàm đã ghi ở [chương 5.5](../5.5-auth/).

```bash
LINKER_FUNCTION='YOUR_LAB_LINKER_FUNCTION'
aws logs tail "/aws/lambda/$LINKER_FUNCTION" --since 15m --region ap-southeast-1
```

Tìm dòng `Linked verified Google identity to existing Cognito account` trong lần gọi gần thời điểm đăng nhập. Có thể cần chờ vài phút để log xuất hiện. Nếu tài khoản đã liên kết, hãy dùng tài khoản mới đã xác minh email để chạy qua trigger.

### Gửi yêu cầu sai định dạng và kiểm tra phản hồi

Giữ phiên đăng nhập trên URL công khai của lab. Mở bảng Console trong công cụ dành cho nhà phát triển của trình duyệt và gửi một yêu cầu có trường `word` là số. Ownword yêu cầu trường này là chuỗi ký tự.

```js
const invalidWord = await fetch('/api/words/manual', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({ word: 42 }),
});
console.log(invalidWord.status, await invalidWord.json());
```

Kết quả mong đợi là **HTTP 400** kèm thông báo lỗi dữ liệu đầu vào. Tải lại WordBoard và kiểm tra danh sách từ giữ nguyên. Để kiểm tra cơ sở dữ liệu, chạy `SELECT count(*) FROM public.user_word;` ngay trước và sau khi gửi yêu cầu. Trong khoảng đó, không thực hiện thao tác ghi khác trên lab.

Lưu mã phản hồi, dòng log CloudWatch và kết quả truy vấn làm minh chứng. Che thông tin định danh tài khoản và dữ liệu riêng trước khi chia sẻ. [Sao lưu, khôi phục và kiểm tra cảnh báo](../5.6-operations/) là các bài kiểm tra bổ sung trong chương vận hành.

**Kiểm thử cục bộ.** Nhóm chạy mã nguồn Workshop với PostgreSQL 16, tài khoản thử và dịch vụ mô hình giả lập. Lưu từ `lantern` trả HTTP 200. WordBoard có từ này và PostgreSQL ghi thêm một dòng `user_word` ở trạng thái `new`. Gửi `{"word":42}` trả HTTP 400 do sai kiểu dữ liệu. Tài khoản thử vẫn có đúng một dòng từ đã lưu.

{{< figure src="/images/workshop/wordboard-lantern.png" alt="WordBoard: lantern" caption="WordBoard cục bộ sau khi kiểm thử. Lantern là từ duy nhất đã lưu. Định nghĩa được thêm sau khi kiểm thử." >}}

**Minh chứng CloudWatch.** Log Lambda tại Singapore ghi nhận hai lượt gọi. Vẫn cần bổ sung dòng log xác nhận một lượt liên kết Google mới thành công.

**Kết quả đã ghi nhận trên production.** Đăng nhập bằng mật khẩu tạo phiên từ pool Cognito tại Singapore, và một người dùng quay lại bằng Google vẫn thấy đủ năm từ đã lưu trong WordBoard. Các lần kiểm tra trước cũng xác nhận RDS dùng TLS, hai tuyến gọi mô hình hoạt động và bản sao đã được khôi phục trong môi trường cô lập.

## 2. Dự toán và tối ưu chi phí hằng tháng {#2-lập-dự-toán-hằng-tháng}

**Dự toán ngày 24/11/2026, tính bằng USD.** Kịch bản 10 người học hoạt động có chi phí **43,24 USD cho AWS** và **0,32 USD cho OpenRouter**, tổng cộng **43,56 USD/tháng**. Với 100 người học, dự toán lần lượt là **57,74 USD cho AWS** và **3,24 USD cho OpenRouter**, tổng cộng **60,98 USD/tháng**. Số lượt dùng và số token là giả định để lập dự toán. Kịch bản có tải cao hơn giữ nguyên cấu hình máy để thể hiện mức tăng do lượng sử dụng.

### Thông số đã nhập vào AWS Pricing Calculator

[AWS Pricing Calculator](https://calculator.aws/) công khai trả về **32,78 USD/tháng** cho hai tài nguyên tại Singapore trong 730 giờ. Kết quả gồm **11,77 USD** cho Lightsail Virtual Servers Linux 2 GB có IPv4 công khai và **21,01 USD** cho PostgreSQL với một máy `db.t4g.micro` Single-AZ theo giá theo nhu cầu, 20 GiB gp3, không dùng RDS Proxy, Database Insights trả phí hoặc Extended Support. Với máy chạy liên tục, bảng dưới dùng **mức trần 12,00 USD/tháng của Lightsail**. Các dòng còn lại tính theo đơn giá công bố của từng dịch vụ trong bảng.

| Khoản chi | Giả định và đơn giá hằng tháng (USD) | Thử nghiệm | Tháng có tải cao hơn |
| --- | --- | ---: | ---: |
| Amazon Lightsail | Máy Linux tại Singapore, 2 vCPU, RAM 2 GB, SSD 60 GB, gắn IPv4 công khai. Dự toán theo mức trần cả tháng. [Giá Lightsail](https://aws.amazon.com/lightsail/pricing/) | 12,00 | 12,00 |
| Amazon RDS for PostgreSQL | `db.t4g.micro` Single-AZ tại Singapore, 730 giờ × 0,025 USD và 20 GiB gp3 × 0,138 USD. Sao lưu tự động nằm trong dung lượng đã bao gồm. [Giá RDS](https://aws.amazon.com/rds/postgresql/pricing/) | 21,01 | 21,01 |
| AWS WAF | Một web ACL CloudFront giá 5 USD, hai nhóm quy tắc do AWS quản lý giá 1 USD mỗi nhóm, cộng 0,60 USD mỗi triệu yêu cầu. Đơn giá áp dụng ngày 24/11/2026. [Giá WAF](https://aws.amazon.com/waf/pricing/) | 7,06 | 7,60 |
| Amazon CloudFront và ACM | 100.000 / 1.000.000 yêu cầu và 10 / 100 GB truyền đến người dùng, trong hạn mức trả theo mức dùng của tài khoản. ACM cấp chứng chỉ công khai không xuất được cho CloudFront. [Giá CloudFront](https://aws.amazon.com/cloudfront/pricing/) · [Giá ACM](https://aws.amazon.com/certificate-manager/pricing/) | 0,00 | 0,00 |
| Amazon Cognito và AWS Lambda | Cognito Essentials tại Singapore với 10 / 100 người dùng hoạt động hằng tháng qua mật khẩu hoặc Google, tối đa 10 / 100 lượt gọi Lambda với 256 MB trong 1 giây mỗi lượt và tối đa 0,1 GB log. Mức dùng nằm trong hạn mức chung áp dụng. [Giá Cognito](https://aws.amazon.com/cognito/pricing/) · [Giá Lambda](https://aws.amazon.com/lambda/pricing/) | 0,00 | 0,00 |
| Amazon S3 | S3 Standard tại Singapore cho bản sao và log truy cập. Dùng 1 / 5 GB với giá 0,025 USD mỗi GB-tháng, 100 / 500 yêu cầu ghi hoặc liệt kê với giá 0,005 USD mỗi 1.000, và 150 / 750 yêu cầu đọc với giá 0,004 USD mỗi 10.000. [Giá S3](https://aws.amazon.com/s3/pricing/) | 0,03 | 0,13 |
| Amazon ECR | Giữ 2 GB image phát hành tại Singapore với giá 0,10 USD mỗi GB-tháng. Image được tải trong cùng Region. [Giá ECR](https://aws.amazon.com/ecr/pricing/) | 0,20 | 0,20 |
| Amazon CloudWatch và SNS | Dự phòng 0,30 USD cho một metric tùy chỉnh và 0,10 USD cho một alarm tiêu chuẩn trước hạn mức CloudWatch. Tối đa 10 / 100 email SNS nằm trong hạn mức hằng tháng. [Giá CloudWatch](https://aws.amazon.com/cloudwatch/pricing/) · [Giá SNS](https://aws.amazon.com/sns/pricing/) | 0,40 | 0,40 |
| AWS KMS | Một khóa SNS do nhóm quản lý, giá 1 USD/tháng. Giả định lượt gọi nằm trong hạn mức chung. RDS dùng khóa do AWS quản lý. [Giá KMS](https://aws.amazon.com/kms/pricing/) | 1,00 | 1,00 |
| Amazon Bedrock | 100 / 1.000 lượt tra theo khái niệm mới qua Kimi K3.1 Pro. Mỗi lượt dự toán 1.000 token đầu vào và 500 token đầu ra. Gói Standard theo hồ sơ suy luận liên vùng tại Mỹ có giá 4,40 và 22,00 USD mỗi triệu token tương ứng. [Giá mô hình](https://docs.aws.amazon.com/bedrock/latest/userguide/model-card-moonshot-ai-kimi-k3-1-highspeed.html#model-card-moonshot-ai-kimi-k3-1-highspeed-pricing) | 1,54 | 15,40 |
| **Tổng AWS** | **Dự toán tháng trước tín dụng tài khoản và thuế** | **43,24** | **57,74** |
| OpenRouter cho tính năng Viết | 20 / 200 lượt gọi GPT-6.1 Terra Low, mỗi lượt dự toán 4.000 token đầu vào và 1.500 token đầu ra. Đơn giá công bố lần lượt là 1 và 5 USD mỗi triệu token. [Giá Terra](https://openrouter.ai/openai/gpt-6.1-terra) | 0,23 | 2,30 |
| OpenRouter cho từ vựng và luyện tập | 50 / 500 lượt gọi theo mô hình mặc định trong lab là Gemini 3.6 Flash, mỗi lượt 1.000 token đầu vào và 300 token đầu ra, với giá 0,75 và 3,75 USD mỗi triệu token tương ứng. [Giá Flash](https://openrouter.ai/google/gemini-3.6-flash) | 0,09 | 0,94 |
| **Tổng OpenRouter** | **Giá suy luận công bố trước phí mua tín dụng** | **0,32** | **3,24** |
| **Tổng chi phí dự toán** | **AWS và lượt gọi OpenRouter phục vụ ứng dụng** | **43,56** | **60,98** |

Dự toán giả định tài khoản còn đủ các hạn mức chung, đường truyền riêng giữa máy ứng dụng và RDS nằm trong cùng Availability Zone, và không phát sinh snapshot Lightsail, dung lượng sao lưu RDS vượt mức hoặc tín dụng CPU vượt mức. Đối chiếu các giả định với AWS Billing của tháng thực tế. Dự toán vận hành chưa tính thuế, phí đăng ký tên miền, GitHub Actions vượt hạn mức gói và lượt gọi GPT-6 Luna dùng riêng cho thử nghiệm. Phí mua tín dụng OpenRouter phụ thuộc vào số tiền nạp. Các dòng được hiển thị đến hai chữ số thập phân và tổng được làm tròn sau khi cộng. [Phí OpenRouter](https://openrouter.ai/docs/faq#pricing-and-fees)

### Cách kiểm soát chi phí

- Dùng lại kết quả tra theo khái niệm đã lưu, giới hạn token đầu ra và đặt hạn mức chi tiêu ở nhà cung cấp. Theo dõi token đầu vào và đầu ra trước khi tăng hạn mức.
- Áp dụng vòng đời cho bản sao và nhật ký truy cập trên S3. Chỉ giữ các image dùng để triển khai hoặc quay lại bản trước. Rà soát các snapshot còn giữ sau khi thử nghiệm.
- Kiểm tra CPU, bộ nhớ, tín dụng CPU của RDS và độ trễ trước khi đổi cấu hình. Đối chiếu giá CloudFront và WAF với lưu lượng thực trước khi đổi gói.
- Sau khi thực hành, làm theo các bước dọn tài nguyên bên dưới rồi kiểm tra hóa đơn. AWS công bố [biểu giá WAF mới từ 01/02/2027](https://aws.amazon.com/waf/pricing/). Cập nhật dòng này khi lập dự toán cho các tháng sau.

## 3. Dọn tài nguyên lab

Mở danh sách tài nguyên ở chương 5.2 và kiểm tra tài khoản bằng `aws sts get-caller-identity`. Lưu minh chứng và bản sao cuối nếu cần. Chỉ thực hiện các bước bên dưới với tài nguyên bạn đã tạo cho lab.

1. **Lịch chạy và cảnh báo.** Trên VM lab, bỏ ba lịch lab bằng `crontab -e`. Tại Singapore, xóa alarm CloudWatch và SNS topic. Khi khóa lab không còn được dùng, lên lịch xóa KMS key. [Xóa alarm](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_DeleteAlarms.html) · [Lên lịch xóa khóa KMS](https://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html)
   - **Tự động phát hành, nếu đã bật.** Tắt workflow GitHub của lab và bỏ dòng cron đánh dấu `ownword-registry-release`. Lưu những image còn cần rồi xóa image và kho ECR của lab. Gỡ role đẩy image và policy tải image của VM. Chỉ xóa nhà cung cấp GitHub OIDC nếu nó được tạo riêng cho lab và không còn ai dùng. [Xóa kho ECR](https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-delete.html)
2. **Tầng phân phối.** Xóa bản ghi công khai của lab. Tắt CloudFront distribution, đợi thay đổi sang trạng thái **Deployed** và xóa distribution. Nếu cần tách web ACL trước, thực hiện sau khi đã tắt distribution. Xóa web ACL và chứng chỉ ACM của lab khi đã hết liên kết. Xóa bản ghi xác thực DNS nếu nó chỉ phục vụ chứng chỉ này. [Xóa CloudFront distribution](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/HowToDeleteDistribution.html) · [Xóa chứng chỉ ACM](https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-delete.html)
3. **Đăng nhập.** Tại Singapore, gỡ trigger Pre sign-up khỏi pool lab. Xóa tên miền managed login, tắt bảo vệ xóa nếu đã bật, rồi xóa pool. Xóa Lambda của lab, CloudWatch log group và execution role cùng inline policy. Xóa Google OAuth client riêng của lab. [Xóa tên miền Cognito](https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_DeleteUserPoolDomain.html) · [Xóa pool Cognito](https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_DeleteUserPool.html)
4. **Cơ sở dữ liệu và máy chủ.** Tại Singapore, tắt bảo vệ xóa của RDS lab và đợi thay đổi có hiệu lực. Xóa instance với lựa chọn phù hợp về snapshot cuối và sao lưu tự động giữ lại. Rà soát snapshot và các bản sao còn tốn lưu trữ. Sau khi RDS giải phóng tài nguyên, xóa security group và subnet group dành riêng cho lab. Xóa bản ghi A của máy chủ gốc. Xóa VM Lightsail và snapshot không cần nữa, rồi giải phóng IP tĩnh nếu còn. Chỉ tắt peering nếu bạn bật cho lab và không có hệ thống khác dùng chung. [Xóa RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteInstance.html) · [Dọn Lightsail](https://docs.aws.amazon.com/lightsail/latest/userguide/getting-started.html)
5. **Lưu trữ và thông tin xác thực.** Tắt S3 server access logging ở bucket nguồn nếu đã bật. Làm rỗng các bucket lab, gồm phiên bản đối tượng và delete marker, rồi xóa bucket. Xóa access key, inline policy và IAM user lab cho sao lưu và Bedrock. Thu hồi hai khóa OpenRouter và dọn bản sao thông tin riêng trên máy cá nhân nếu không còn cần. [Làm rỗng bucket S3 có versioning](https://docs.aws.amazon.com/AmazonS3/latest/userguide/empty-bucket.html) · [Xóa IAM user](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_remove.html)

**Điểm kiểm tra.** Dò từng tài nguyên trong danh sách và đối chiếu với console. Ghi lại thứ bạn giữ, chẳng hạn snapshot, hoặc đã lên lịch xóa. Xem lại AWS Billing khi số liệu sử dụng cập nhật.
