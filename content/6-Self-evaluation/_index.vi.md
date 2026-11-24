---
title: "Tự đánh giá"
date: 2026-11-13
weight: 6
chapter: false
pre: " <b>6.</b> "
---

Trong kỳ thực tập First Cloud AI Journey, tôi cùng nhóm xây dựng Ownword cho những người học tiếng Anh có thể nhận ra nhiều từ nhưng ít dùng đến chúng khi viết. Người học có thể mô tả ý mình muốn diễn đạt để tìm từ phù hợp, lưu từ vào WordBoard rồi luyện nhớ lại sau. Tôi góp phần xác định cách các tính năng từ vựng và luyện tập hoạt động, đồng thời tham gia triển khai bản thử nghiệm trên AWS.

[Workshop Ownword](../5-workshop/) hướng dẫn triển khai theo mô hình nhóm đã dùng, với ứng dụng chạy trên Lightsail và dữ liệu người học được lưu trong cơ sở dữ liệu RDS riêng tư. Tôi phụ trách một phần cấu hình đăng nhập Google qua Cognito và kiểm tra email cảnh báo sao lưu. Khi kết quả thực tế khác với hướng dẫn lab, tôi cùng các bạn kiểm tra lại cách dịch vụ hoạt động và tìm cách xử lý.

## Mức tự đánh giá

| STT | Tiêu chí | Nội dung tự đánh giá | Tốt | Khá | Trung bình |
| ---: | --- | --- | :---: | :---: | :---: |
| 1 | Khối lượng đóng góp | Phần việc tôi nhận và hoàn thành cho nhóm | ✅ | ⬜ | ⬜ |
| 2 | Kết quả đóng góp | Những thay đổi có ích cho Ownword hoặc cho nhóm từ phần việc của tôi | ✅ | ⬜ | ⬜ |
| 3 | Tính chủ động | Việc tự phát hiện vấn đề, đề xuất thay đổi hoặc xung phong hỗ trợ | ⬜ | ✅ | ⬜ |
| 4 | Làm việc nhóm | Cách tôi cập nhật tiến độ, lắng nghe và hỗ trợ các bạn | ✅ | ⬜ | ⬜ |
| 5 | Hiệu quả học tập | Cách tôi dùng thời gian khi gặp vướng mắc và chọn lúc nhờ hỗ trợ | ⬜ | ✅ | ⬜ |
| 6 | Tiếp thu góp ý | Cách tôi dùng phản hồi để cải thiện phần việc của mình | ✅ | ⬜ | ⬜ |
| 7 | Kiến thức AWS cơ bản | Khả năng giải thích các dịch vụ đã học dùng để làm gì và nên dùng khi nào | ✅ | ⬜ | ⬜ |
| 8 | Áp dụng AWS vào Ownword | Mức độ phù hợp của những dịch vụ tôi tham gia triển khai với nhu cầu của dự án | ⬜ | ✅ | ⬜ |
| 9 | Đáp ứng thời hạn | Việc giao đúng hẹn và báo sớm nếu có nguy cơ chậm | ✅ | ⬜ | ⬜ |
| 10 | Sắp xếp ưu tiên | Khả năng chọn việc quan trọng nhất với nhóm khi có nhiều việc cùng lúc | ✅ | ⬜ | ⬜ |
| 11 | Duy trì tiến độ | Mức độ đều đặn khi làm việc và cập nhật nhật ký hằng tuần | ✅ | ⬜ | ⬜ |
| 12 | Chất lượng công việc | Cách tôi kiểm tra trước khi bàn giao và phần việc các bạn phải sửa thêm | ⬜ | ✅ | ⬜ |

## Phần đóng góp của tôi trong dự án Ownword

Tôi và các bạn trong nhóm trao đổi về những gì người học cần ở Ownword. Tôi xác định cách các tính năng từ vựng và luyện tập nên hoạt động, rồi dùng Codex để hỗ trợ xây dựng và chỉnh sửa. Tôi cũng tham gia cấu hình và kiểm tra hệ thống thử nghiệm trên AWS.

- **Từ vựng và WordBoard.** Tôi thấy từ thêm thủ công bị trống định nghĩa trên WordBoard và trong thẻ ôn tập. Tôi đề xuất lưu từ ngay rồi để ứng dụng bổ sung định nghĩa trong nền. Tôi cũng đề xuất hiện nghĩa tiếng Việt ngay trong danh sách gợi ý đầu tiên và dùng nút phát âm nhỏ hơn trên các thẻ WordBoard.
- **Luyện tập và thẻ ôn tập.** Tôi xác định cách lật và chuyển thẻ bằng bàn phím, cách chạm để lật thẻ trên điện thoại, đồng thời báo lỗi gợi ý chữ cái đầu tự xuất hiện trước khi người học yêu cầu. Với bài đặt câu, tôi đề xuất cho người học tự chọn chủ đề miễn là dùng từ đúng ngữ cảnh. Từ yêu cầu đó, nhóm bỏ chủ đề định sẵn khỏi dữ liệu gửi cho mô hình chấm câu.
- **Cấu hình và kiểm tra trên AWS.** Tôi cấu hình Google làm nhà cung cấp danh tính trong Amazon Cognito, chạy lệnh triển khai liên kết tài khoản trên AWS CloudShell và kiểm tra rằng sau khi đăng nhập bằng Google, người dùng vẫn mở được WordBoard đã có. Tôi cũng chạy lệnh thiết lập sao lưu trên S3, áp dụng bản sửa cấu hình KMS cho kênh cảnh báo vận hành và xác nhận đã nhận được email cảnh báo thử sau khi sửa.

## Điều tôi muốn cải thiện

- Tôi đã bỏ sót một số cách để giảm đáng kể chi phí AWS. Các bạn trong nhóm nhận ra phần lớn những điểm đó và góp ý để nhóm tránh được phương án tốn kém hơn. Lần sau, tôi muốn so sánh chi phí sớm hơn, khi vẫn còn dễ thay đổi thiết kế.
- Lúc mới thực tập, tôi còn chậm khi tìm nguyên nhân sự cố trên AWS. Qua những lần xử lý lỗi như thiếu quyền IAM, tôi đã biết cách khoanh vùng nguyên nhân nhanh hơn. Tôi muốn ghi lại các bước đã thử rõ hơn để tránh kiểm tra đi kiểm tra lại cùng một chỗ.
- Tôi thường thử đưa dịch vụ AWS mới học vào Ownword. Một số lựa chọn ban đầu chưa hợp với dự án, nên tôi đã thay bằng dịch vụ phù hợp hơn khi hiểu rõ nhu cầu của ứng dụng và các phương án khác. Lần sau, tôi muốn so sánh các lựa chọn theo nhu cầu của ứng dụng trước khi thêm dịch vụ.
- Tôi cố giữ lịch sử Git gọn gàng và viết mã dễ đọc. Dù vậy, một số thay đổi của tôi vẫn gây lỗi và khiến các bạn phải mất công xử lý thêm. Tôi muốn tự rà soát kỹ hơn và báo rõ những thay đổi ảnh hưởng đến cách chạy hoặc kiểm thử ứng dụng trước khi bàn giao.
