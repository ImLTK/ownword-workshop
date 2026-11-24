---
title: "Tuần 9: Tài khoản và phát âm"
date: 2026-11-13
weight: 9
chapter: false
pre: " <b>1.9.</b> "
---

**09/11–15/11/2026**

*Mốc tiến độ dự án*

## Mục tiêu tuần 9

- Phát hành thay đổi về tài khoản và phát âm trên môi trường thử nghiệm.
- Kiểm tra migration và điều hướng trang tài khoản sau khi triển khai.

---

## Công việc trong tuần

Nếu ghi chép chỉ có ngày hoàn thành hoặc ngày ghi nhận, ngày bắt đầu là ước tính.

| Thứ | Công việc | Bắt đầu | Hoàn thành / ghi nhận | Tài liệu và minh chứng |
| --- | --- | --- | --- | --- |
| Thứ hai đến Thứ năm | **Phát hành bản thử nghiệm.** Chuẩn bị phát hành bằng cách xác minh bản sao PostgreSQL trên S3, sau đó triển khai màn hình tài khoản, đăng nhập Google và điều khiển phát âm lên ownword-pilot. | 09/11/2026 | 12/11/2026 | [Ownword pilot](https://ownword.3.1.163.210.sslip.io/) |
| Thứ năm | **Sửa điều hướng đăng ký.** Kiểm tra migration và trạng thái container. Khi mở ứng dụng trên trình duyệt, thao tác đăng ký dẫn sai chỗ. Đưa bản sửa lên rồi kiểm tra lại biểu mẫu. | 12/11/2026 | 12/11/2026 | [Account screen](https://ownword.3.1.163.210.sslip.io/account) |
| Thứ năm | **Đăng nhập Google.** Kiểm tra luồng đăng nhập và liên kết Google. Các bước kiểm tra tiếp theo gồm phát âm trên máy tính và điện thoại, cùng thử nghiệm tách biệt hai tài khoản. | 12/11/2026 | 12/11/2026 | [Ownword pilot](https://ownword.3.1.163.210.sslip.io/) |

---

## Kết quả tuần 9

- Màn hình tài khoản và tính năng phát âm đã lên bản thử nghiệm. Nhóm kiểm tra lại điều hướng đăng ký trên trình duyệt và giữ phiên bản trước cùng bản sao lưu đã xác minh để có thể quay lui.
- Lỗi đăng ký cho mình thấy ứng dụng khởi động được mới chỉ là một phần. Khi bấm nút đăng ký, trình duyệt vẫn dẫn sai chỗ. Từ đó, mình có một bước kiểm tra đơn giản cho những lần sửa phần tài khoản sau này: mở trang đăng nhập, bấm vào đường dẫn đăng ký và xem biểu mẫu có hiện đúng không.
- Với đăng nhập Google, mình kiểm tra xem người học đã có tài khoản đủ điều kiện liên kết có còn mở được WordBoard cũ không. Đó là lý do nhóm liên kết tài khoản qua Cognito. Nếu tạo một tài khoản mới, người học có thể tưởng những từ đã lưu bị mất. [Cognito và đăng nhập Google](../../5-workshop/5.5-auth/)
