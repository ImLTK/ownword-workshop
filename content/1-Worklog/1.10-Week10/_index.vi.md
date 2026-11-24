---
title: "Tuần 10: Cải thiện phương pháp học và chất lượng ứng dụng"
date: 2026-11-13
weight: 10
chapter: false
pre: " <b>1.10.</b> "
---

**16/11–22/11/2026**

*Mốc tiến độ dự án*

## Mục tiêu tuần 10

- Đánh giá toàn bộ luồng học và ghi lại vấn đề sử dụng.
- Kiểm tra tách biệt tài khoản và xác định vấn đề cần sửa trước workshop.

---

## Công việc trong tuần

Các mốc theo từng công việc là ước tính dựa trên nhật ký trước đó.

| Thứ | Công việc | Bắt đầu | Hoàn thành / ghi nhận | Tài liệu và minh chứng |
| --- | --- | --- | --- | --- |
| Thứ hai đến Thứ ba | **Luồng học.** Cùng nhóm xem lại luồng học trên Ownword, từ lúc viết và tìm từ đến lúc luyện tập và nhớ lại từ đã học. | 16/11/2026 | 17/11/2026 | - |
| Thứ tư | **Rà soát phần luyện tập.** Dùng các ví dụ để xem lại cách ôn cách quãng, phản hồi, mức trừ điểm khi dùng gợi ý và tiêu chí chuyển giai đoạn. | 18/11/2026 | 18/11/2026 | - |
| Thứ năm | **Tách biệt tài khoản.** Dùng hai tài khoản thử để kiểm tra việc tách dữ liệu, đồng thời thử WordBoard và phần luyện tập trên từng tài khoản. | 19/11/2026 | 19/11/2026 | - |
| Thứ sáu | **Luồng gọi mô hình.** Rà soát cách ứng dụng gọi OpenRouter, kiểm tra phản hồi và giới hạn chi phí. Xem dữ liệu nào được gửi đi và điều đó ảnh hưởng gì đến quyền riêng tư. | 20/11/2026 | 20/11/2026 | - |

---

## Kết quả tuần 10

- Ngày 20/11, Ownword phát hành tính năng chuỗi ngày học và chuyển PostgreSQL từ máy Lightsail sang RDS riêng tư. Đợt kiểm tra gồm kết nối TLS đến cơ sở dữ liệu, đăng nhập Cognito và việc lưu giữ từ cùng kết quả luyện tập. Một bước kiểm tra tiếp theo cho chuỗi ngày học là lưu hai từ trong cùng một ngày và xem hệ thống có chỉ tính một ngày hoạt động không. [Các mốc dự án](../../2-proposal/) · [Các bước kiểm chứng](../../5-workshop/5.7-verification/)
- Nhóm cũng kiểm tra hai luồng gọi mô hình trên hệ thống đang chạy. Lượt tra theo khái niệm mới đi qua Bedrock, còn phần đánh giá bài Viết dùng OpenRouter. Lượt tra lặp lại có thể dùng kết quả đã lưu, nên cần dùng một truy vấn mới khi muốn kiểm tra kết nối đến Bedrock. [Luồng gọi mô hình](../../5-workshop/5.3-architecture/)
- Lần phát hành tự động đầu tiên đưa một thay đổi nhỏ lên trang đăng nhập. GitHub Actions chạy thành công cả 21 bài kiểm thử phần học và đẩy image lên ECR. Lightsail tải image về, sau đó nhóm mở trang công khai để xem hiệu ứng cuối trang có chuyển động không. Nhờ vậy, nhóm có thể thấy bản mới đã đến được người dùng. [Lần phát hành tự động đầu tiên](../../5-workshop/5.6-operations/5.6.1-releases/)
