---
title: "Tuần 6: Từ bài lab AWS đến bản mẫu Ownword"
date: 2026-11-13
weight: 6
chapter: false
pre: " <b>1.6.</b> "
---

19/10-25/10/2026

*Mốc tiến độ dự án*

## Mục tiêu tuần 6

- Kết nối các bài AWS với thiết kế ứng dụng thực tế.
- Ghi nhận bản mẫu Ownword đầu tiên và xác định luồng học từ.
- Thực hành xác thực người dùng với Amazon Cognito trước khi dựng phần kiểm tra dữ liệu phía máy chủ, lớp truy cập dữ liệu và chế độ demo cho Ownword.

## Công việc trong tuần

Nếu ghi chép chỉ có ngày hoàn thành hoặc ngày ghi nhận, ngày bắt đầu là ước tính.

| Ngày | Công việc | Bắt đầu | Hoàn thành / ghi nhận | Tài liệu và minh chứng |
| --- | --- | --- | --- | --- |
| 1 | Thực hành bài Cloud Journey về xác thực serverless với Amazon Cognito: tạo User Pool, tích hợp với API và Lambda, kiểm thử đăng nhập từ giao diện rồi dọn tài nguyên. Từ bài lab này, mình hình dung cách đặt lớp API bản mẫu của Ownword phía sau dịch vụ xác thực có quản lý về sau. | 19/10/2026 | 19/10/2026 | [Cloud Journey / workshop](https://000081.awsfcaj.com/) |
| 2-3 | Xây dựng phần kiểm tra đầu vào và cấu trúc phản hồi phía máy chủ cho gợi ý từ vựng từ bản nháp, đồng thời tạo các bản nháp mẫu cùng phản hồi chế độ demo để các bạn trong nhóm kiểm thử mà không cần khóa mô hình thật. | 20/10/2026 | 21/10/2026 | [Gợi ý từ vựng](#vocabulary-suggestion) |
| 4-5 | Xác định cách kết quả nhớ từ và đặt câu chuyển trạng thái từ đã lưu giữa Mới học, Đang luyện và Đã vận dụng trên WordBoard, đồng thời tách truy vấn D1 vào các hàm repository để sau này có thể đổi lớp lưu trữ mà không phải viết lại giao diện. | 22/10/2026 | 23/10/2026 | [Các trạng thái trong WordBoard](#wordboard-stages) |
| 2-7 | Bản mẫu gợi ý từ vựng từ bài viết. Người học có thể lưu từ vào WordBoard, rồi thử nhớ lại và đặt câu với từ đó. | 20/10/2026 | 25/10/2026 | [Gợi ý từ vựng](#vocabulary-suggestion) |
| 5-7 | WordBoard chia từ đã lưu thành Mới học, Đang luyện và Đã vận dụng, giúp người học theo dõi từng từ trong quá trình luyện tập. | 23/10/2026 | 25/10/2026 | [Các trạng thái trong WordBoard](#wordboard-stages) |
| 1-7 | Bản mã đầu tiên được ghi nhận có giao diện Next.js, API phía máy chủ và lớp truy cập dữ liệu D1. Chế độ demo có sẵn cho phép thử bài viết mẫu và phản hồi mà không cần khóa mô hình. | 19/10/2026 | 25/10/2026 | |
| 6-7 | Cùng nhóm chạy thử toàn bộ luồng bản mẫu từ đầu đến cuối (viết nháp, nhận gợi ý, lưu vào WordBoard, luyện nhớ từ và đặt câu), đồng thời ghi lại các điểm vướng ban đầu để xử lý ở Tuần 7 như đánh dấu nhanh từ bị quên và hiển thị nghĩa tiếng Việt rõ hơn khi luyện tập. | 24/10/2026 | 25/10/2026 | [Tuần 7](../1.7-week7/) |

## Kết quả tuần 6

- Bản mẫu Ownword đã có luồng từ viết, lưu từ đến luyện tập. Nhóm dựa trên luồng này để sửa phần luyện tập ở Tuần 7.
- Làm bài Cognito ở Ngày 1 và gom truy vấn D1 vào các hàm repository giúp nhóm dựng bản mẫu nhanh mà sau này vẫn đổi được cơ sở dữ liệu hoặc phần đăng nhập.
- Dữ liệu demo có sẵn giúp cả nhóm thử trọn luồng từ bản nháp đến luyện tập mà không cần khóa mô hình thật. Lần chạy thử đó cho thấy nhóm cần làm thêm phần đánh dấu từ quên và hỗ trợ nghĩa tiếng Việt ở [Tuần 7](../1.7-week7/).

## Ảnh minh họa từ ứng dụng hiện tại

### Gợi ý từ vựng {#vocabulary-suggestion}

{{< worklog-image file="ownword-vocabulary-suggestion.png" caption="Ownword gợi ý thay careful bằng meticulous, đặt từ mới vào câu của người học và cho phép thêm từ để luyện." >}}

### Các trạng thái trong WordBoard {#wordboard-stages}

{{< worklog-image file="ownword-wordboard-stages.png" caption="WordBoard hiển thị năm từ đã lưu và các bộ lọc Mới học, Đang luyện, Đã vận dụng." >}}
