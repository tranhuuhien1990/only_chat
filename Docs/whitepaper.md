# ONLYCHAT WHITEPAPER

## 1. Tóm tắt điều hành (Executive Summary)

OnlyChat là một nền tảng nhắn tin (chat) tối giản, được xây dựng với triết lý **“Only Chat – Chỉ để trò chuyện”**. Trong bối cảnh các ứng dụng nhắn tin hiện nay đang dần trở thành mạng xã hội đa chức năng, OnlyChat ra đời để giải quyết vấn đề **quá tải tính năng, xao nhãng và mất quyền riêng tư**.

OnlyChat tập trung tuyệt đối vào nhu cầu cốt lõi của con người trong giao tiếp số: **nhắn tin nhanh, ổn định, riêng tư và không gây nghiện**. Ứng dụng được phát triển trên nền tảng **Flutter**, hỗ trợ đồng thời **mobile (iOS, Android)** và **web** với trải nghiệm thống nhất.

---

## 2. Vấn đề hiện tại (Problem Statement)

Các ứng dụng chat phổ biến hiện nay đang gặp những vấn đề sau:

* Tích hợp quá nhiều dịch vụ không liên quan: feed, video ngắn, game, marketplace, quảng cáo.
* Thuật toán đề xuất làm tăng thời gian sử dụng không cần thiết.
* Gây xao nhãng, làm gián đoạn công việc và đời sống gia đình.
* Thu thập dữ liệu người dùng quá mức.
* Giao diện phức tạp, khó sử dụng với người lớn tuổi hoặc người cần sự đơn giản.

👉 Người dùng **không thiếu ứng dụng chat**, họ thiếu một **ứng dụng chỉ để chat**.

---

## 3. Tầm nhìn & Sứ mệnh

### 3.1 Tầm nhìn

Trở thành nền tảng nhắn tin tối giản hàng đầu, nơi giao tiếp số trở lại đúng bản chất: **kết nối con người với con người**.

### 3.2 Sứ mệnh

* Loại bỏ sự xao nhãng khỏi giao tiếp số.
* Trao quyền kiểm soát dữ liệu và sự chú ý cho người dùng.
* Xây dựng một không gian trò chuyện lành mạnh, riêng tư và bền vững.

---

## 4. Đối tượng người dùng mục tiêu

* Người làm việc cần tập trung cao (developer, designer, freelancer).
* Gia đình, nhóm nhỏ, cộng đồng kín.
* Người lớn tuổi, người không rành công nghệ.
* Doanh nghiệp nhỏ cần công cụ chat nội bộ đơn giản.

---

## 5. Giải pháp của OnlyChat

OnlyChat cung cấp một nền tảng nhắn tin với các đặc điểm:

* **Tối giản chức năng**: chỉ giữ lại những gì cần cho chat.
* **Không thuật toán gây nghiện**.
* **Không quảng cáo**.
* **Ưu tiên quyền riêng tư**.

---

## 6. Chức năng cốt lõi

### 6.1 Xác thực người dùng

* Đăng nhập bằng số điện thoại (OTP) hoặc email.
* Không yêu cầu thông tin cá nhân phức tạp.

### 6.2 Chat 1-1

* Gửi tin nhắn văn bản realtime.
* Trạng thái gửi / nhận / đã đọc.
* Trả lời (reply), sao chép, xóa tin nhắn.

### 6.3 Chat nhóm

* Tạo nhóm nhỏ (50–100 người).
* Quyền admin đơn giản.
* Thông báo join/leave rõ ràng.

### 6.4 Thông báo

* Push notification cho tin nhắn mới.
* Tắt/mở theo từng cuộc trò chuyện.

### 6.5 Quản lý & tìm kiếm

* Tìm kiếm người và nội dung chat.
* Xóa lịch sử chat cục bộ hoặc trên server.

---

## 7. Những gì OnlyChat *không* có

* News Feed
* Story / Reels / Video ngắn
* Like / Follow
* Quảng cáo
* AI chatbot
* Mini game / Mini app

Việc **chủ động loại bỏ** các tính năng này là lựa chọn chiến lược để giữ vững triết lý sản phẩm.

---

## 8. Quyền riêng tư & Bảo mật

* Không theo dõi hành vi người dùng.
* Không bán hoặc chia sẻ dữ liệu.
* Tuỳ chọn mã hóa đầu-cuối (E2EE) trong các phiên bản sau.
* Tuỳ chọn tự động xoá lịch sử chat.

---

## 9. Kiến trúc kỹ thuật

### 9.1 Frontend

* Flutter (iOS, Android, Web).
* UI tối giản, ít animation.
* State management: Riverpod / Bloc.

### 9.2 Backend

* Auth: Firebase Auth hoặc JWT custom.
* Realtime: WebSocket / Firebase Firestore.
* Database: PostgreSQL hoặc Firestore.
* Push Notification: Firebase Cloud Messaging.

---

## 10. Lộ trình phát triển (Roadmap)

### Phase 1 – MVP

* Login
* Chat 1-1
* Chat nhóm
* Realtime messaging
* Notification

### Phase 2 – Hoàn thiện

* Image/File nhẹ
* Backup & restore
* Web version ổn định

### Phase 3 – Nâng cao

* End-to-End Encryption
* Self-hosted server option
* Phiên bản enterprise

---

## 11. Mô hình vận hành & tài chính

* Miễn phí cho cá nhân.
* Gói trả phí cho:

  * Doanh nghiệp
  * Self-hosted
  * Tính năng bảo mật nâng cao

OnlyChat **không dựa vào quảng cáo** làm nguồn thu chính.

---

## 12. Kết luận

OnlyChat không cạnh tranh bằng số lượng tính năng, mà bằng **sự tôn trọng thời gian, sự chú ý và quyền riêng tư của người dùng**.

Trong một thế giới số ngày càng ồn ào, OnlyChat chọn trở thành **không gian yên tĩnh để trò chuyện**.

> **OnlyChat – Just Chat. Nothing More.**
