---
title: "Fireside Chat với Tiến sĩ Werner Vogels"
date: 2026-11-13
weight: 3
chapter: false
pre: " <b>4.3.</b> "
---

<div style="border: 4px solid #c62828; background: #ffebee; color: #b71c1c; padding: 20px; margin: 16px 0; border-radius: 8px; text-align: center;">
<p style="font-size: 2rem; font-weight: 900; line-height: 1.25; margin: 0 0 10px 0;">DỪNG LẠI: BẠN PHẢI VIẾT LẠI TRANG NÀY!</p>
<p style="font-size: 1.15rem; font-weight: 700; margin: 0;">Mục Sự kiện đã tham gia là phần cá nhân. Hãy thay toàn bộ 3 sự kiện mẫu, bài viết và hình ảnh bên dưới bằng 3 SỰ KIỆN CỦA CHÍNH BẠN cùng ảnh check-in thấy rõ khuôn mặt của bạn. KHÔNG nộp bài viết hay ảnh sự kiện của thành viên khác.</p>
</div>

| Thông tin | Chi tiết |
|---|---|
| Chủ đề | Navigating the Future of Cloud & AI in Vietnam |
| Ngày | Thứ Sáu, 02/10/2026 |
| Địa điểm | TP. Hồ Chí Minh |
| Khách mời | Tiến sĩ Werner Vogels, Giám đốc Công nghệ của Amazon |
| Vai trò | Người tham dự |

## Tổng quan sự kiện

Trong buổi trò chuyện của First Cloud AI Journey, Tiến sĩ Vogels kể về sự cố cơ sở dữ liệu ở Amazon, cách giữ dịch vụ hoạt động và chuyện trả phí theo mức dùng. Ông cũng nói về trách nhiệm của kỹ sư khi dùng AI. Mình nhớ nhất là ông thường bắt đầu từ vấn đề người dùng hoặc đội vận hành gặp phải rồi mới nói đến công nghệ.

{{< event-photo file="fireside_1.jpg" alt="Slide mở đầu của First Cloud AI Journey ghi chủ đề và ngày 02/10/2026" caption="Slide mở đầu của buổi Fireside Chat ngày 02/10." >}}

## Kiến thức mình học được

### Bắt đầu từ cách ứng dụng đọc và ghi dữ liệu

Sau một sự cố vào mùa mua sắm cao điểm, Amazon xem lại những thao tác ứng dụng thường gửi đến cơ sở dữ liệu. Nhiều yêu cầu chỉ cần tìm theo khóa, như lấy giỏ hàng theo mã định danh. Quan sát đó góp phần dẫn đến Dynamo, hệ thống lưu trữ khóa-giá trị phân tán của Amazon và là một trong những nền tảng ý tưởng của DynamoDB. Dynamo ưu tiên tính sẵn sàng cho các thao tác này và quản lý phiên bản dữ liệu để hỗ trợ xử lý khi nhiều lượt ghi xung đột. Từ ví dụ đó, mình sẽ liệt kê các luồng đọc và ghi thường gặp trước khi chọn cơ sở dữ liệu, đồng thời nghĩ đến cách ứng dụng xử lý dữ liệu chưa cập nhật hoặc thao tác ghi được thử lại.

### Đo các yêu cầu chậm và diễn tập khôi phục

Phần vận hành cho mình hai cách kiểm tra hệ thống. Một là xem độ trễ ở nhóm yêu cầu chậm nhất. Ví dụ, nếu P99.9 là hai giây thì khoảng 99,9% yêu cầu quan sát được hoàn thành trong vòng hai giây, còn một nhóm nhỏ phải chờ lâu hơn. Trung vị có thể vẫn thấp trong khi nhóm đó gặp vấn đề. Hai là tổ chức GameDay, một buổi chủ động tạo lỗi có kiểm soát để kiểm tra khả năng phát hiện, chuyển sang hệ thống dự phòng và khôi phục. Khi diễn tập, nhóm có thể ghi lại thời điểm cảnh báo, ai xử lý và thao tác nào của người dùng hoạt động trở lại.

### Cân đối chi phí với độ tin cậy cần thiết

Tiến sĩ Vogels cũng nói về việc trả tiền theo mức sử dụng và cách điều đó ảnh hưởng đến quyết định đầu tư hạ tầng. Mình sẽ hỏi mỗi đề xuất tăng tài nguyên hoặc thêm dự phòng giúp được việc gì. Nếu thay đổi bảo vệ một thao tác quan trọng của người dùng thì có thể đáng làm. Với bản thử nghiệm nhỏ, mình sẽ tính chi phí hằng tháng và thử khôi phục trước khi quyết định đầu tư thêm.

{{< event-photo file="fireside_2.jpg" alt="Tiến sĩ Werner Vogels trao đổi cùng người dẫn chương trình" caption="Tiến sĩ Werner Vogels trong phần trò chuyện tại sự kiện." >}}

### Giữ trách nhiệm kỹ thuật khi dùng AI

Hình mẫu "Renaissance developer" của Vogels kết hợp chuyên môn sâu với sự tò mò, tư duy hệ thống và khả năng giao tiếp. Mình hiểu điều này là cần biết các phần lân cận hoạt động ra sao để lường được tác động của một thay đổi. Nếu AI hỗ trợ viết một phần của luồng đăng nhập, kỹ sư vẫn cần hiểu cách phiên đăng nhập hoạt động, xem lại quyền truy cập và thử cả trường hợp đăng nhập thành công lẫn thất bại.

## Liên hệ với Ownword

Trên Ownword, người dùng dễ nhận ra khi đăng nhập, tra từ hoặc mở lại WordBoard bị chậm. Mình sẽ đo riêng từng bước để số trung bình không che mất chỗ đang gặp vấn đề. Khi thử khôi phục, mình sẽ dùng tài khoản thử nghiệm để xem lỗi tra cứu có báo rõ, cho thử lại và vẫn cho mở những từ đã lưu không.

{{< event-photo file="fireside_3.jpg" alt="Ảnh nhóm cùng người tham dự sự kiện First Cloud AI Journey" caption="Cùng các bạn trong nhóm của tôi tại sự kiện." >}}

## References

- [Bài tổng kết trên AWS Builder Center](https://builder.aws.com/content/3KBSLeKsdkk6uMUPq7d9Xxa5jbS/the-invariable-lessons-of-tech-and-humanity-key-takeaways-from-amazon-cto-werner-vogels)
- [Bài báo Dynamo của Amazon](https://www.amazon.science/publications/dynamo-amazons-highly-available-key-value-store)
- [Bài viết của Werner Vogels về Renaissance developer](https://www.allthingsdistributed.com/2025/11/tech-predictions-for-2026-and-beyond.html)
