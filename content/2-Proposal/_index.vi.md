---
title: "Đề xuất"
date: 2026-11-13
weight: 2
chapter: false
pre: " <b>2.</b> "
---

## Tóm tắt dự án

Ownword dành cho người học tiếng Anh nhận ra nhiều từ khi đọc nhưng khó nhớ để dùng khi viết. Ứng dụng giúp người học tìm từ mình đang cần, lưu lại và luyện đến khi tự nhớ ra được. Phần Viết giúp người học xác định đoạn nào trong bản nháp cần sửa và xem bản chỉnh sửa đã xử lý góp ý đến đâu.

Bản thử nghiệm chạy trên AWS. Amazon Bedrock dùng Kimi K3.1 Pro để tra từ theo khái niệm, còn OpenRouter cung cấp mô hình cho việc đánh giá bản nháp và kiểm tra bản chỉnh sửa. Người đọc có thể thử [ứng dụng đang chạy](https://app.ownword.co/) hoặc tự triển khai theo [workshop song ngữ](../5-workshop/).

## Vấn đề

Có những từ mình nhận ra ngay khi đọc, nhưng đến lúc viết lại dùng một từ quen thuộc hơn. Tra được một từ phù hợp giúp mình viết tiếp ngay lúc đó, nhưng lần sau có thể vẫn phải tra lại. Khi sửa bài cũng có chuyện tương tự. Mình có thể thấy một câu chưa ổn mà chưa rõ cần sửa phần nào.

Ownword bắt đầu từ bản nháp hoặc ý người học muốn diễn đạt. Ứng dụng nối lúc tìm được từ với những buổi luyện sau đó. Phản hồi về bài viết chỉ ra những đoạn cụ thể mà người học có thể xem lại khi sửa.

## Đối tượng và vòng lặp học tập

Bản thử nghiệm dành cho người học tiếng Anh nâng cao muốn tự học. Luồng từ vựng là **viết → khám phá → chọn → luyện tập → truy hồi → vận dụng**. Trên WordBoard, từ đã lưu chuyển qua **New**, **Practicing** và **Active** khi người học nhớ lại và sử dụng từ ở nhiều thời điểm, trong nhiều ngữ cảnh.

Ví dụ, nếu muốn diễn tả một trải nghiệm vừa vui vừa buồn, người học có thể mô tả cảm giác đó bằng tiếng Anh hoặc tiếng Việt, xem gợi ý như *bittersweet* rồi lưu vào WordBoard. Khi ôn nhanh, người học có thể đánh dấu nếu quên từ. Trong Full Practice, họ thử nhớ lại và đặt câu về một chủ đề tự chọn.

Phần Viết có luồng riêng. Người học chọn đề, viết bài, đọc phản hồi theo từng đoạn rồi tự chỉnh sửa. Bản gốc được giữ lại để người học đối chiếu chỗ đã đổi và xem bản sửa đáp ứng góp ý nào.

## Phạm vi bản thử nghiệm

| Tính năng | Bản thử nghiệm hỗ trợ gì |
| --- | --- |
| Khám phá từ vựng | Tìm gợi ý từ bản nháp hoặc mô tả một khái niệm bằng tiếng Anh hay tiếng Việt. Lưu từ phù hợp hoặc thêm từ thủ công. |
| WordBoard và luyện tập | Theo dõi từ đã lưu, nghe phát âm qua trình duyệt, ôn các từ đã quên rồi luyện nhớ và đặt câu. Chuỗi ngày học ghi lại các ngày có hoạt động. |
| Viết | Viết theo đề, đọc phản hồi gắn với đoạn cụ thể và mở lại bản gốc cùng bản chỉnh sửa trong lịch sử. |
| Tài khoản | Đăng nhập bằng email và mật khẩu hoặc Google. Tài khoản đủ điều kiện có thể liên kết Google đã xác minh để giữ lại WordBoard. |

Bản thử nghiệm chạy ứng dụng trên một VM và dùng cơ sở dữ liệu Single-AZ riêng tư. Mục tiêu là thử luồng học và khả năng khôi phục với một nhóm nhỏ.

## Kiến trúc đã triển khai

{{< ownword-architecture alt="Luồng yêu cầu và sao lưu của Ownword. GitHub Actions đẩy image phát hành lên ECR riêng tư tại Singapore để Lightsail tải về." caption="Kiến trúc Ownword và luồng tự động phát hành ngày 20/11/2026. Chọn sơ đồ để xem ở kích thước đầy đủ." >}}

### Các dịch vụ AWS đang dùng

- **Amazon CloudFront.** Cung cấp điểm truy cập HTTPS công khai của Ownword và chuyển yêu cầu web, API tới Caddy trên Lightsail. Callback của Cognito dùng tên miền công khai của ứng dụng.
- **AWS WAF.** Áp dụng web ACL cho yêu cầu đi qua distribution CloudFront trước khi chúng đến máy chủ gốc.
- **AWS Certificate Manager (ACM).** Cấp chứng chỉ cho tên miền công khai trên CloudFront. Caddy quản lý chứng chỉ riêng cho kết nối tới máy chủ gốc.
- **Amazon Lightsail.** Chạy VM tại Singapore. Caddy nhận HTTPS từ CloudFront rồi chuyển yêu cầu tới Next.js qua mạng Docker riêng. VM cũng chạy tác vụ sao lưu và kiểm tra tình trạng bản sao.
- **Amazon RDS for PostgreSQL.** Lưu hồ sơ người học, từ trên WordBoard, kết quả luyện tập và lịch sử bài viết. Cơ sở dữ liệu Single-AZ tại Singapore nhận kết nối từ máy Lightsail qua VPC peering. Ứng dụng kiểm tra chứng chỉ và tên máy chủ của RDS.
- **Amazon Cognito.** Quản lý mật khẩu, xác minh email và đăng nhập Google qua user pool ở Ohio. Next.js dựa trên danh tính đã xác minh để xác định phiên được truy cập dữ liệu của người học nào.
- **AWS Lambda.** Chạy trigger Pre sign-up cho đăng nhập Google. Nếu lần đăng nhập đầu tiên khớp với một tài khoản đủ điều kiện, trigger có thể liên kết danh tính Google để giữ nguyên WordBoard của người học.
- **Amazon Bedrock.** Chạy Kimi K3.1 Pro cho tra cứu theo khái niệm qua inference profile tại Mỹ. Ứng dụng gọi endpoint ở Bắc Virginia và kiểm tra cấu trúc gợi ý trước khi trả về.
- **Amazon S3.** Lưu bản xuất PostgreSQL hằng ngày trong bucket riêng tư. Bản sao nằm ngoài VM và cơ sở dữ liệu đang chạy, nên nhóm có thể dùng để thử khôi phục vào một cơ sở dữ liệu riêng.
- **Amazon ECR.** Lưu image phát hành riêng tư do GitHub Actions tạo. Lightsail tải image theo digest và kiểm tra ứng dụng sau khi triển khai. [Luồng phát hành trong workshop](../5-workshop/5.6-operations/5.6.1-releases/)
- **Amazon CloudWatch.** Nhận metric `BackupFresh` mỗi giờ. Alarm dựa vào giá trị đó để đánh giá bản sao mới nhất còn đủ mới và có mặt trên S3 hay không.
- **Amazon SNS.** Gửi email cho người vận hành khi CloudWatch chuyển sang trạng thái cảnh báo.
- **AWS Key Management Service (KMS).** Cung cấp khóa do nhóm quản lý để mã hóa SNS topic dùng cho cảnh báo sao lưu.
- **AWS Identity and Access Management (IAM).** Giới hạn quyền gọi Bedrock, truy cập bản sao S3, ghi metric CloudWatch và chạy Lambda liên kết tài khoản. PostgreSQL dùng role riêng cho ứng dụng và tác vụ sao lưu.

## Triển khai kỹ thuật

### Đường đi của yêu cầu và dữ liệu

1. **Mở ứng dụng (bước 1–4).** Trình duyệt kết nối HTTPS tới CloudFront. CloudFront kết nối TLS tới Caddy qua tên miền máy chủ gốc. Caddy chuyển yêu cầu tới Next.js. Ứng dụng đọc hoặc ghi dữ liệu người học trên RDS riêng tư qua một kết nối TLS khác.
2. **Đăng nhập (bước 5–8).** Yêu cầu đăng nhập bằng mật khẩu đi tới Cognito. Với Google, Cognito xử lý liên kết danh tính rồi đưa trình duyệt về callback của Ownword. Next.js đổi mã ủy quyền bằng PKCE. Lambda có thể liên kết danh tính Google ở lần đăng nhập đầu tiên đủ điều kiện.
3. **Gọi mô hình (bước 9–10).** Next.js gửi yêu cầu tra theo khái niệm tới Kimi trên Bedrock. Đánh giá bài viết và kiểm tra bản chỉnh sửa dùng tuyến OpenRouter riêng. Thông tin xác thực của nhà cung cấp nằm trên máy chủ.
4. **Sao lưu và cảnh báo (bước 11–14).** VM đọc RDS bằng role chỉ đọc, xuất cơ sở dữ liệu lên S3 riêng tư rồi kiểm tra bản sao mới nhất mỗi giờ. Nếu bản sao quá cũ hoặc thiếu tín hiệu, hệ thống gửi email qua SNS topic có mã hóa.

Workshop giải thích thêm [sơ đồ và đường đi của yêu cầu](../5-workshop/5.3-architecture/), [đăng nhập và HTTPS công khai](../5-workshop/5.5-auth/) và [cách sao lưu, khôi phục và thử cảnh báo](../5-workshop/5.6-operations/).

### Nhóm dùng Amazon Bedrock và OpenRouter như thế nào {#writing-inference-provider}

**Ownword dùng Kimi K3.1 Pro trên Amazon Bedrock để tra từ theo khái niệm**, một phần chính của tính năng khám phá từ vựng. Người học có thể diễn đạt ý mình muốn nói bằng tiếng Anh hoặc tiếng Việt để nhận gợi ý từ và cụm từ phù hợp. Khi người học lặp lại truy vấn, ứng dụng có thể dùng kết quả đã lưu để tránh gọi mô hình thêm một lần.

Nhóm cũng thử GPT-6 Luna trên Bedrock cho tính năng Viết. Nhóm muốn xem có thể dùng tín dụng AWS Free Tier để tạo phản hồi có cấu trúc và chỉ đúng đoạn cần góp ý trong bản nháp hay không. AWS chấp nhận thỏa thuận trên Marketplace và tài khoản có đủ hạn mức suy luận. Cả hai yêu cầu với bài viết giả lập đều trả về `AccessDeniedException`. Lần thứ hai, AWS xác nhận tài khoản chưa được dùng Luna và hướng dẫn liên hệ AWS Sales. [Hướng dẫn AWS về quyền truy cập mô hình theo tài khoản](https://docs.aws.amazon.com/bedrock/latest/userguide/model-access.html)

Với các tác vụ Viết khó hơn, **nhóm dùng OpenRouter để tiếp cận các mô hình tiên tiến**. Mô hình đang dùng là GPT-6.1 Terra Low. Mô hình nhận xét bản nháp ban đầu rồi kiểm tra xem bản chỉnh sửa đã xử lý các góp ý trước đó chưa.

## Tiến độ và các mốc

| Mốc | Việc đã làm hoặc dự kiến |
| --- | --- |
| 14/09 đến 18/10 | Làm các bài AWS về tài khoản, IAM, mạng, cơ sở dữ liệu và giám sát. [Nhật ký](../1-worklog/) |
| 25/10 | Ghi nhận bản mẫu Ownword đầu tiên, có gợi ý từ bản nháp, WordBoard và luyện đặt câu. [Tuần 6](../1-worklog/1.6-week6/) |
| 28/10 | Thêm Quick Review và Full Practice để người học tập trung vào các từ đã quên. [Tuần 7](../1-worklog/1.7-week7/) |
| 05/11 | Thử khôi phục bản sao trên S3 và kiểm tra luồng cảnh báo CloudWatch, SNS trên Lightsail. [Tuần 8](../1-worklog/1.8-week8/) |
| 12/11 | Đưa màn hình tài khoản, đăng nhập Google và nút phát âm lên bản thử nghiệm. [Tuần 9](../1-worklog/1.9-week9/) |
| 20/11 | Chuyển cơ sở dữ liệu sang RDS riêng tư và phát hành tính năng chuỗi ngày học. |
| Đến 14/12, dự kiến | Chạy thử demo, ghi kết quả kiểm thử hai tài khoản và thời gian khôi phục, hoàn thiện dự toán và tài liệu bàn giao. [Tuần 13](../1-worklog/1.13-week13/) |

## Dự toán chi phí

Chi phí riêng cho máy chạy ứng dụng và phần máy chủ, lưu trữ RDS là **khoảng 33,01 USD mỗi tháng trước khi trừ tín dụng**. Con số này chưa tính lượt gọi mô hình, tầng phân phối, giám sát, sao lưu và các khoản theo mức sử dụng khác.

| Hạng mục | Cơ sở tính theo tháng |
| --- | --- |
| Lightsail tại Singapore | 12 USD cho gói Linux 2 GB có IPv4 công khai. [Giá Lightsail](https://aws.amazon.com/lightsail/pricing/) |
| RDS tại Singapore | Khoảng 21,01 USD cho 730 giờ chạy `db.t4g.micro` Single-AZ với 20 GiB gp3, theo mức giá ghi nhận khi chuyển sang RDS ngày 20/11. [Giá RDS for PostgreSQL](https://aws.amazon.com/rds/postgresql/pricing/) |
| Phân phối và đăng nhập | Tính thêm số yêu cầu và lưu lượng CloudFront, phí WAF theo gói đã chọn, người dùng Cognito hoạt động hằng tháng và số lần gọi Lambda. |
| Sao lưu và giám sát | Tính thêm snapshot Lightsail, dung lượng và yêu cầu S3, metric và alarm CloudWatch, số lần gửi SNS và khóa KMS do nhóm quản lý. |
| Gọi mô hình | Ước tính token đầu vào và đầu ra của Bedrock cho các lượt tra mới. Tách mức dùng OpenRouter cho từ vựng và Viết khỏi chi phí AWS. |

Để tính thử, giả sử có 10 người học hoạt động. Mỗi người tra theo khái niệm 10 lần và yêu cầu hai lượt đánh giá bài hoặc kiểm tra bản sửa trong tháng. Kịch bản này tương ứng 100 lượt tra Bedrock và 20 lượt gọi mô hình cho phần Viết. Đây là giả định để lên dự toán. Khi tính giá, dùng số token đầu vào, đầu ra đo được và đơn giá của từng tuyến. Xem [bảng tính chi phí trong workshop](../5-workshop/5.7-verification/).

## Quyết định và rủi ro

| Rủi ro | Thiết kế xử lý thế nào và cần kiểm tra gì |
| --- | --- |
| VM ứng dụng ngừng chạy | RDS giữ dữ liệu ở ngoài máy chủ ứng dụng. Thử triển khai lại theo workshop và đo thời gian để đăng nhập và WordBoard hoạt động trở lại. |
| Mất cơ sở dữ liệu hoặc sao lưu quá cũ | Bản thử nghiệm dùng RDS Single-AZ. Lưu bản dump hằng ngày trên S3 riêng tư và kiểm tra `BackupFresh`. Khi thử khôi phục vào cơ sở dữ liệu cô lập, ghi lại bản sao được dùng và thời gian thực hiện. |
| Truy cập dữ liệu của người học khác | Cognito xác minh danh tính. Next.js giới hạn dữ liệu theo chủ tài khoản. Dùng tài khoản thứ hai thử mở URL chi tiết từ đã lưu của tài khoản thứ nhất. |
| Mô hình lỗi hoặc phản hồi chưa phù hợp | Kiểm tra cấu trúc phản hồi trước khi dùng. Thử tra một khái niệm mới và kiểm tra bản sửa với nội dung giả lập để nhận ra lỗi nhà cung cấp hoặc phản hồi chưa hữu ích. |
| Lượng truy cập hoặc chi phí tăng | Dùng lại kết quả cho truy vấn lặp và giới hạn lượt gọi mô hình. Theo dõi CPU, bộ nhớ, độ trễ và lỗi khi thử tải nhẹ trước khi quyết định tăng cấu hình VM. |

## Kết quả và phép đo cần bổ sung

Báo cáo có sơ đồ kiến trúc, ứng dụng đang chạy và hướng dẫn song ngữ để triển khai, dọn tài nguyên. Các lần kiểm tra trước đã ghi nhận đăng nhập Cognito, lưu từ và kết quả luyện tập, gọi mô hình thật và khôi phục bản sao RDS vào cơ sở dữ liệu tạm.

Trong buổi demo, người học cần tìm được một từ chưa quen, lưu rồi nhớ lại từ đó và dùng phản hồi để sửa bản nháp. Về phía AWS, nhóm cần tự làm lại bài lab với tài nguyên riêng, khôi phục dữ liệu và nhận cảnh báo khi bản sao quá cũ. Minh chứng còn cần bổ sung gồm kiểm thử hai tài khoản có ngày, thử tải nhẹ, thời gian khôi phục đo được và dự toán đầy đủ trên AWS Pricing Calculator. [Các bước kiểm chứng trong workshop](../5-workshop/5.7-verification/)
