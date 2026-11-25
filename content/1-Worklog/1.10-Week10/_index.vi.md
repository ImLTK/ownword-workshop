---
title: "Tuần 10: Cải thiện phương pháp học và chất lượng ứng dụng"
date: 2026-11-13
weight: 10
chapter: false
pre: " <b>1.10.</b> "
---

**16/11-22/11/2026**

*Mốc tiến độ dự án*

## Mục tiêu tuần 10

- Đánh giá toàn bộ luồng học và ghi lại vấn đề sử dụng.

## Công việc trong tuần

| Ngày | Công việc | Bắt đầu | Hoàn thành / ghi nhận | Tài liệu và minh chứng |
| --- | --- | --- | --- | --- |
| 5 | Chuyển PostgreSQL sang RDS riêng tư, kiểm tra kết nối TLS và dùng GitHub Actions phát hành ảnh ứng dụng Ownword qua ECR. Cả 21 bài kiểm thử logic học từ đều đạt. | 20/11/2026 | 20/11/2026 | [Luồng phát hành](../../5-workshop/5.3-architecture/) · [Các mốc dự án](../../2-proposal/) |
| 7 | Lưu phiên bản báo cáo Ownword tiếng Anh và tiếng Việt để tiếp tục bàn giao. | 22/11/2026 | 22/11/2026 | [Commit báo cáo](https://github.com/ImLTK/ownword-workshop/commit/7b2e2bb) |

## Kết quả tuần 10

- Ngày 20/11, Ownword phát hành tính năng chuỗi ngày học và chuyển PostgreSQL từ máy Lightsail sang RDS riêng tư. Đợt kiểm tra gồm kết nối TLS đến cơ sở dữ liệu, đăng nhập Cognito và việc lưu giữ từ cùng kết quả luyện tập. [Các mốc dự án](../../2-proposal/) · [Các bước kiểm chứng](../../5-workshop/5.7-verification/)
- Nhóm cũng kiểm tra hai luồng gọi mô hình trên hệ thống đang chạy. Lượt tra theo khái niệm mới đi qua Bedrock, còn phần đánh giá bài Viết dùng OpenRouter. Lượt tra lặp lại có thể dùng kết quả đã lưu, nên cần dùng một truy vấn mới khi muốn kiểm tra kết nối đến Bedrock. [Luồng gọi mô hình](../../5-workshop/5.3-architecture/)
- Lần phát hành tự động đầu tiên đưa một thay đổi nhỏ lên trang đăng nhập. GitHub Actions chạy thành công cả 21 bài kiểm thử phần học và đẩy image lên ECR. Lightsail tải image về, sau đó nhóm mở trang công khai để xem hiệu ứng cuối trang có chuyển động không. Nhờ vậy, nhóm có thể thấy bản mới đã đến được người dùng. [Luồng phát hành](../../5-workshop/5.3-architecture/)
