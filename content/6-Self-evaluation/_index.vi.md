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

Tôi và các bạn trong nhóm trao đổi về những gì người học cần ở Ownword. Tôi xác định cách các tính năng từ vựng và luyện tập nên hoạt động, trực tiếp xây dựng và chỉnh sửa chúng, đồng thời tham gia cấu hình và kiểm tra hệ thống thử nghiệm trên AWS.

Ở phần từ vựng và WordBoard, tôi thấy các từ thêm thủ công bị trống định nghĩa trên WordBoard và trong thẻ ôn tập, nên đề xuất lưu từ ngay rồi để ứng dụng tự bổ sung định nghĩa trong nền. Ngoài ra, tôi đề xuất hiển thị nghĩa tiếng Việt ngay trong danh sách gợi ý đầu tiên và dùng nút phát âm nhỏ hơn trên thẻ WordBoard.

Với phần luyện tập và thẻ ôn tập, tôi xác định cách lật và chuyển thẻ bằng bàn phím, thao tác chạm để lật thẻ trên điện thoại, đồng thời báo lỗi gợi ý chữ cái đầu tự xuất hiện trước khi người học yêu cầu. Trong bài đặt câu, người học cần được tự chọn chủ đề miễn là dùng từ đúng ngữ cảnh; từ yêu cầu đó, nhóm bỏ chủ đề định sẵn khỏi dữ liệu gửi cho mô hình chấm câu.

Ở phần cấu hình và kiểm tra trên AWS, tôi thiết lập Google làm nhà cung cấp danh tính trong Amazon Cognito, chạy lệnh triển khai liên kết tài khoản trên AWS CloudShell và kiểm tra để chắc chắn đăng nhập bằng Google vẫn mở đúng WordBoard đã có. Bên cạnh đó, tôi chạy lệnh thiết lập sao lưu trên S3, áp dụng bản sửa cấu hình KMS cho kênh cảnh báo vận hành và xác nhận email cảnh báo thử đã đến hộp thư sau khi sửa.

## Điều tôi muốn cải thiện

- Tôi đã bỏ sót một số cách giảm đáng kể chi phí AWS. Phần lớn những điểm đó do các bạn trong nhóm phát hiện và góp ý, nhờ vậy nhóm tránh được phương án tốn kém hơn. Sau này, tôi cần so sánh chi phí sớm hơn, khi thiết kế vẫn còn dễ thay đổi.
- Thời gian đầu thực tập, tôi tìm nguyên nhân sự cố trên AWS khá chậm. Qua những lần xử lý lỗi như thiếu quyền IAM, tôi đã biết cách khoanh vùng nguyên nhân nhanh hơn, nhưng vẫn cần ghi lại các bước đã thử rõ hơn để tránh kiểm tra lặp lại cùng một chỗ.
- Mỗi khi học được dịch vụ AWS mới, tôi hay thử đưa ngay vào Ownword. Một vài lựa chọn ban đầu chưa hợp với dự án và phải thay lại khi tôi hiểu rõ hơn nhu cầu ứng dụng cùng các phương án khác. Lần sau, trước khi thêm dịch vụ nào, tôi nên so sánh các lựa chọn theo nhu cầu của ứng dụng.
- Dù tôi cố giữ lịch sử Git gọn gàng và viết mã dễ đọc, một số thay đổi vẫn gây lỗi khiến các bạn phải mất công xử lý thêm. Trước khi bàn giao, tôi cần tự rà soát kỹ hơn và báo rõ những thay đổi ảnh hưởng đến cách chạy hoặc kiểm thử ứng dụng.
