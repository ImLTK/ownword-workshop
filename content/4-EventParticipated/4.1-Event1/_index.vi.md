---
title: "AWS Cloud and AI Day Hanoi 2026"
date: 2026-11-13
weight: 1
chapter: false
pre: " <b>4.1.</b> "
---

| Thông tin | Chi tiết |
|---|---|
| Ngày | Thứ Ba, 29/09/2026 |
| Hội nghị chính | Khách sạn JW Marriott Hà Nội |
| Vai trò | Người tham dự buổi theo dõi trực tiếp tại TP. Hồ Chí Minh |

## Tổng quan sự kiện

AWS tổ chức hơn 30 phiên cùng các gian triển lãm, khu giới thiệu startup và khu gặp gỡ cộng đồng. Tại Hà Nội, chương trình mở cửa đón khách lúc 07:30, bắt đầu keynote lúc 09:00, chuyển sang các phiên kỹ thuật từ 11:00 và kết thúc lúc 17:00. Các diễn giả keynote có Giám đốc Công nghệ Amazon Werner Vogels, Mai Le từ Katalon và Tổng Giám đốc Techcombank Jens Lottner. Lịch chính thức có mục dành cho điểm cầu TP. Hồ Chí Minh và giới thiệu các chủ đề như nền tảng phát triển nội bộ trên EKS của VPBank và quá trình đưa AI agent từ bản demo vào triển khai.

{{< event-photo file="cloud_day_1.jpg" alt="Ảnh nhóm tại điểm cầu với màn hình đang chiếu chương trình hội nghị" caption="Cùng các bạn tham dự tại điểm cầu TP. Hồ Chí Minh." >}}

## Kiến thức mình học được

### Lần theo sự cố qua nhiều dịch vụ

Trong phần demo mình chụp lại, sự cố đăng nhập của GoTymeX xuất hiện đầu tiên qua số lỗi HTTP 5xx tăng ở gateway. Nhóm đối chiếu metric, log, trace và các thay đổi gần đây, rồi lần theo yêu cầu qua từng dịch vụ. Họ tìm thấy một truy vấn đang chờ khóa metadata trên Aurora MySQL reader. Chi tiết đó giải thích vì sao yêu cầu bị ùn lại và một dịch vụ ở phía trước bị timeout.

Mình để ý AWS DevOps Agent chỉ có quyền đọc khi điều tra. Kỹ sư vẫn phải duyệt những việc như dừng truy vấn. Qua sáu tháng theo dõi sự cố, GoTymeX cho biết thời gian trung vị từ lúc có cảnh báo đến lúc tìm được nguyên nhân khả dĩ đầu tiên giảm từ 34,5 phút xuống còn 10 phút. Con số đó cho mình biết đội vận hành mất bao lâu để có một đầu mối có thể kiểm tra.

{{< event-photo file="cloud_day_2.jpg" alt="Slide chẩn đoán sự cố của GoTyme trên màn hình tại điểm cầu" caption="Phần trình diễn của GoTyme lần theo lỗi ở gateway tới khóa cơ sở dữ liệu sau nhiều dịch vụ." >}}

### Kiểm tra ứng dụng đang dùng định danh nào

Bài tổng kết của Kha Van trình bày cách Amazon EKS Pod Identity liên kết service account của Kubernetes với một IAM role. Ứng dụng có thể nhận thông tin xác thực tạm thời qua AWS SDK. Biến môi trường hoặc một nguồn xuất hiện sớm hơn trong chuỗi tìm thông tin xác thực của SDK có thể khiến ứng dụng dùng một định danh khác. Khi gặp lỗi quyền, kiểm tra định danh từ bên trong workload giúp xác định ứng dụng đang thiếu quyền hay đang dùng sai role.

### Tính đến việc vận hành sau bản demo

Bài tổng kết còn nêu cách một nền tảng nội bộ giúp chuẩn hóa các thao tác triển khai lặp lại và vì sao AI agent trong môi trường thật cần người chịu trách nhiệm, quyền hạn rõ ràng và nhật ký thao tác. Phần hạ tầng đưa ra hai ví dụ về lựa chọn theo nhu cầu ứng dụng. Địa điểm Direct Connect ở Hà Nội cung cấp đường kết nối riêng tới AWS, còn Hanoi Local Zone có thể hữu ích khi cần đặt tài nguyên gần người dùng. Độ trễ thực tế, vị trí lưu dữ liệu và khả năng vận hành của nhóm là những yếu tố cần xem xét trước khi lựa chọn.

## Liên hệ với Ownword

Nếu người dùng Ownword gặp lỗi khi đăng nhập hoặc lưu từ, mình sẽ áp dụng cách lần theo sự cố đó. Log cần ghi bước nào lỗi, lỗi xảy ra lúc nào và thành phần nào trả lỗi. Nhóm có thể dựa vào đó để tìm xem vấn đề nằm ở xác thực, API hay lưu trữ, đồng thời giữ thông tin xác thực và nội dung người dùng ngoài log.

{{< event-photo file="cloud_day_3.jpg" alt="Thẻ tham dự ghi tên Lê Tuấn Kiệt và FPT University" caption="Thẻ tham dự của mình tại AWS Cloud and AI Day Hanoi 2026." >}}

## References

- [Tổng quan hội nghị](https://aws.amazon.com/events/cloud-day-hanoi/)
- [Lịch chương trình](https://aws.amazon.com/events/cloud-day-hanoi/agenda/)
- [Bài viết kỹ thuật của GoTymeX](https://www.linkedin.com/pulse/gotymexs-aiops-agent-diagnoses-incidents-35x-faster-aws-drkkc)
- [Bài tổng kết hội nghị](https://builder.aws.com/content/3KMpKxUhRFeSlclpmwu5ZxBQBYL/aws-cloud-and-ai-day-hanoi-2026-building-for-the-next-phase-of-cloud-and-ai)
- [Tài liệu Amazon EKS Pod Identity](https://docs.aws.amazon.com/eks/latest/userguide/pod-identities.html)
