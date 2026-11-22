---
title: "Tự đánh giá"
date: 2026-11-13
weight: 6
chapter: false
pre: " <b>6.</b> "
---

Tôi thích cùng nhóm tìm hiểu và cấu hình các dịch vụ AWS cho Ownword. Việc tìm quyền IAM còn thiếu giúp tôi hiểu thêm về kiểm soát truy cập trên đám mây. Một số hướng dẫn trong bài lab có vẻ đã cũ. Khi các bước không khớp với những gì nhóm thấy, chúng tôi kiểm tra lại cách dịch vụ hoạt động rồi cùng tìm cách xử lý.

Sau khi xem lại công việc và phản hồi đã nhận, tôi sẽ chọn **Tốt, Khá hoặc Trung bình** cho từng tiêu chí và thêm ví dụ về việc mình đã làm.

| Tiêu chí | Mức đánh giá | Bằng chứng hoặc nhận xét cá nhân |
|---|---|---|
| Kiến thức chuyên môn | Chờ chọn | Chờ bổ sung |
| Tự học và nghiên cứu | Chờ chọn | Chờ bổ sung |
| Chủ động | Chờ chọn | Chờ bổ sung |
| Kỷ luật và tuân thủ quy định | Chờ chọn | Chờ bổ sung |
| Giao tiếp | Chờ chọn | Chờ bổ sung |
| Làm việc nhóm | Chờ chọn | Chờ bổ sung |
| Giải quyết vấn đề | Chờ chọn | Việc xử lý quyền IAM có thể là ví dụ sau khi xác nhận vai trò của tôi. |
| Đóng góp cho Workshop | Chờ chọn | Xác định yêu cầu và góp ý cho các tính năng từ vựng và luyện tập, cấu hình đăng nhập Google, kiểm tra liên kết tài khoản và cảnh báo sao lưu. |

## Phần đóng góp của tôi trong dự án Ownword

Tôi và các bạn trong nhóm trao đổi về những gì người học cần ở Ownword. Tôi xác định cách các tính năng từ vựng và luyện tập nên hoạt động, rồi dùng Codex để hỗ trợ xây dựng và chỉnh sửa. Tôi cũng tham gia cấu hình và kiểm tra hệ thống thử nghiệm trên AWS.

- **Từ vựng và WordBoard.** Tôi thấy từ thêm thủ công bị trống định nghĩa trên WordBoard và trong thẻ ôn tập. Tôi đề xuất lưu từ ngay rồi để ứng dụng bổ sung định nghĩa trong nền. Tôi cũng đề xuất hiện nghĩa tiếng Việt ngay trong danh sách gợi ý đầu tiên và dùng nút phát âm nhỏ hơn trên các thẻ WordBoard.
- **Luyện tập và thẻ ôn tập.** Tôi xác định cách lật và chuyển thẻ bằng bàn phím, cách chạm để lật thẻ trên điện thoại, đồng thời báo lỗi gợi ý chữ cái đầu tự xuất hiện trước khi người học yêu cầu. Với bài đặt câu, tôi đề xuất cho người học tự chọn chủ đề miễn là dùng từ đúng ngữ cảnh. Từ yêu cầu đó, nhóm bỏ chủ đề định sẵn khỏi dữ liệu gửi cho mô hình chấm câu.
- **Cấu hình và kiểm tra trên AWS.** Tôi cấu hình Google làm nhà cung cấp danh tính trong Amazon Cognito, chạy lệnh triển khai liên kết tài khoản trên AWS CloudShell và kiểm tra rằng sau khi đăng nhập bằng Google, người dùng vẫn mở được WordBoard đã có. Tôi cũng chạy lệnh thiết lập sao lưu trên S3, áp dụng bản sửa cấu hình KMS cho kênh cảnh báo vận hành và xác nhận đã nhận được email cảnh báo thử sau khi sửa.

## Điều tôi muốn cải thiện

Tôi sẽ bổ sung phần này sau khi xem lại dự án và phần trình bày workshop.

{{% notice warning %}}Tôi vẫn đang bổ sung mức tự đánh giá và ví dụ cho từng tiêu chí.{{% /notice %}}
