# OnlyChat - Just Chat. Nothing More.

OnlyChat là một nền tảng nhắn tin tối giản, được xây dựng với triết lý loại bỏ sự xao nhãng và tập trung hoàn toàn vào việc kết nối con người.

## 🚀 Tính năng chính (MVP)
- **Đăng nhập tối giản**: Sử dụng SĐT hoặc Email.
- **Chat 1-1**: Nhắn tin thời gian thực với trải nghiệm mượt mà.
- **Chat nhóm**: Hỗ trợ các nhóm nhỏ, cộng đồng kín.
- **Giao diện cao cấp**: Thiết kế hiện đại, hỗ trợ Dark Mode.

## 🛠 Yêu cầu hệ thống
- **Flutter SDK**: `^3.5.3` hoặc mới hơn.
- **Dart SDK**: Tương ứng với phiên bản Flutter.
- **Thiết bị/Trình giả lập**: Android, iOS hoặc trình duyệt Web (Chrome/Edge).

## 📥 Cài đặt
1. Di chuyển vào thư mục dự án:
   ```bash
   cd OnlyChatSource
   ```
2. Cài đặt các thư viện (dependencies):
   ```bash
   flutter pub get
   ```

## 🏃 Cách chạy ứng dụng
### Chạy trên thiết bị mặc định:
```bash
flutter run
```

### Chạy trên trình duyệt Web:
```bash
flutter run -d chrome
```

### Chạy ở chế độ Debug (với Hot Reload):
- Sử dụng phím `r` trong terminal để Hot Reload.
- Sử dụng phím `R` để Hot Restart.

## 🐛 Debug & Phát triển
### 1. VS Code (Khuyến nghị)
- Cài đặt plugin **Flutter** và **Dart**.
- Nhấn `F5` hoặc chọn `Run > Start Debugging`.
- Sử dụng **Flutter DevTools** để kiểm tra giao diện và hiệu năng.

### 2. Android Studio
- Mở thư mục `OnlyChatSource` như một dự án Flutter.
- Nhấn nút **Debug** (biểu tượng con bọ) trên thanh công cụ.

### 3. Kiểm tra trạng thái hệ thống
Để kiểm tra xem môi trường phát triển của bạn đã sẵn sàng chưa:
```bash
flutter doctor
```

## 🏗 Cấu trúc thư mục
- `lib/router/`: Quản lý điều hướng ứng dụng (GoRouter).
- `lib/theme/`: Cấu hình giao diện và màu sắc.
- `lib/features/`: Chứa các tính năng (Auth, Chat).
- `lib/shared/`: Các widget và công cụ dùng chung.

---
> **OnlyChat – Just Chat. Nothing More.**
