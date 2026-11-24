---
title: "Tuần 13: Kiểm thử, trình bày và bàn giao"
date: 2026-11-13
weight: 13
chapter: false
pre: " <b>1.13.</b> "
---

**07/12–14/12/2026**

*Mốc tiến độ dự án*

## Mục tiêu tuần 13

- Chạy thử phần demo và ghi lại kết quả kiểm tra khôi phục.
- Hoàn thiện báo cáo song ngữ, ước tính chi phí và bàn giao.

---

## Công việc trong tuần

Các mốc theo từng công việc là ước tính dựa trên nhật ký trước đó.

| Thứ | Công việc | Bắt đầu | Hoàn thành / ghi nhận | Tài liệu và minh chứng |
| --- | --- | --- | --- | --- |
| Thứ hai đến Thứ ba | **Chạy thử demo.** Chạy thử phần demo từ đăng nhập và viết đến lưu từ, luyện tập và xem tiến trình. Xem lại đường đi của yêu cầu đến ứng dụng và cơ sở dữ liệu. | 07/12/2026 | 08/12/2026 | [Ownword architecture](../../5-workshop/5.3-architecture/) |
| Thứ tư | **Đăng nhập và truy cập dữ liệu.** Rà soát đăng nhập qua Cognito và Google, đồng thời kiểm tra cách giới hạn quyền truy cập giữa các tài khoản. | 09/12/2026 | 09/12/2026 | [Cognito and Google sign-in](../../5-workshop/5.5-auth/) |
| Thứ năm | **Khôi phục và cảnh báo.** Thực hiện các bước kiểm tra khôi phục và cảnh báo, đồng thời xem lại thông tin cần ghi về bản sao lưu và thời gian phục hồi. | 10/12/2026 | 10/12/2026 | [Backups and monitoring](../../5-workshop/5.6-operations/) |
| Thứ sáu đến Thứ hai | **Trình bày và bàn giao.** Chuẩn bị dự toán, bài trình bày, báo cáo song ngữ và tài liệu bàn giao. Cùng nhóm xem lại kiến trúc và các giới hạn của hệ thống. | 11/12/2026 | 14/12/2026 | - |

---

## Kết quả tuần 13

- Mình sẽ bắt đầu demo bằng một lượt học trên trang công khai. Người học đăng nhập, mô tả ý mình muốn diễn đạt, lưu một từ được gợi ý rồi mở lại WordBoard trước khi luyện tập. Từ thao tác đó có thể giải thích luôn sơ đồ: Cognito xử lý đăng nhập, Bedrock tìm từ theo khái niệm và RDS lưu từ để lần sau người học vẫn mở lại được. [Tổng quan workshop](../../5-workshop/5.1-overview/)
- Khi bàn giao, mình sẽ để lại commit và digest của bản phát hành, thông tin về lần sao lưu và kiểm tra khôi phục gần nhất, cùng các bước xử lý nếu nhận được cảnh báo sao lưu. Những phép kiểm tra còn thiếu cũng cần ghi rõ. Khi dùng hai tài khoản, ghi lại tài khoản thứ hai nhìn thấy dữ liệu nào. Khi khôi phục, ghi ngày của bản sao, thời gian thực hiện và một truy vấn xác nhận dữ liệu đã khôi phục có thể đọc được. [Danh sách kiểm chứng và dự toán](../../5-workshop/5.7-verification/)
