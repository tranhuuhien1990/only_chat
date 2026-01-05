# Hướng dẫn Thiết lập và Chạy dự án OnlyChat (Dev Init)

Tài liệu này hướng dẫn chi tiết các bước để một lập trình viên mới có thể thiết lập môi trường và chạy dự án OnlyChat từ đầu.

## 1. Yêu cầu Tiền đề (Pre-requisites)

Trước khi bắt đầu, hãy đảm bảo máy tính của bạn đã cài đặt:
- **Flutter SDK**: Phiên bản `^3.24.0` hoặc mới hơn.
- **Node.js**: Để cài đặt Firebase CLI.
- **Git**: Để quản lý mã nguồn.
- **Tài khoản Google**: Để quản lý dự án Firebase.

## 2. Bước 1: Cài đặt Công cụ CLI (Command Line Interface)

Mở terminal và chạy các lệnh sau:

### Cài đặt Firebase CLI:
```bash
npm install -g firebase-tools
```

### Đăng nhập Firebase:
```bash
firebase login
```

### Cài đặt FlutterFire CLI:
```bash
dart pub global activate flutterfire_cli
```

*Lưu ý: Nếu nhận được cảnh báo về đường dẫn (PATH), hãy thêm thư mục `%USERPROFILE%\AppData\Local\Pub\Cache\bin` vào biến môi trường PATH của Windows.*

## 3. Bước 2: Thiết lập Dự án Firebase (Trên Cloud)

1. Truy cập [Firebase Console](https://console.firebase.google.com/).
2. Tạo dự án mới (ví dụ: `only-chat-2026`).
3. **Bật Authentication**:
   - Menu `Build > Authentication > Get Started`.
   - Tab `Sign-in method` > Chọn **Anonymous** > **Enable** > **Save**.
4. **Bật Firestore Database**:
   - Menu `Build > Firestore Database` > **Create database**.
   - Chọn **Test Mode** (để có quyền đọc/ghi ngay lập tức).
5. **Bật Realtime Database**:
   - Menu `Build > Realtime Database` > **Create database**.
   - Chọn **Test Mode** và vị trí server (ví dụ: `asia-southeast1`).
   - **Lưu lại Database URL** (dạng `https://...firebasedatabase.app/`).

## 4. Bước 3: Cấu hình Dự án Flutter

Di chuyển vào thư mục `OnlyChatSource` và thực hiện:

### Tải các thư viện:
```bash
cd OnlyChatSource
flutter pub get
```

### Cấu hình Firebase cho Flutter:
Chạy lệnh sau và làm theo hướng dẫn trên màn hình (chọn dự án bạn đã tạo):
```bash
dart pub global run flutterfire_cli:flutterfire configure
```
*Lệnh này sẽ tạo ra file `lib/firebase_options.dart` và đăng ký các App ID cho Android, iOS, Web.*

## 5. Bước 4: Cập nhật Cấu hình Đặc thù

Dự án sử dụng Realtime Database cho tính năng chat, bạn cần cập nhật link thủ công:

1. Mở file `lib/features/chat/data/firebase_chat_repository.dart`.
2. Tìm dòng `databaseURL:` và thay thế bằng URL bạn đã lưu ở **Bước 2.5**.
   ```dart
   databaseURL: 'https://your-project-id-rtdb.asia-southeast1.firebasedatabase.app/',
   ```

## 6. Bước 5: Chạy Ứng dụng

### Chạy trên Web:
```bash
flutter run -d chrome
```

### Chạy trên Windows:
```bash
flutter run -d windows
```

## 🐛 Các lỗi thường gặp và Cách xử lý

| Lỗi | Nguyên nhân | Cách xử lý |
| :--- | :--- | :--- |
| `options != null` (Web) | Chưa cấu hình Firebase cho Web | Chạy lại `flutterfire configure` và chọn Web |
| `configuration-not-found` | Chưa bật Anonymous Auth | Vào Firebase Console bật Anonymous |
| `failed-precondition` | Thiếu Index trong Firestore | Click vào link trong console lỗi để tạo Index tự động |
| `Cannot parse Firebase url` | Database URL bị trống | Cập nhật `databaseURL` trong `firebase_chat_repository.dart` |

---
> **OnlyChat – Just Chat. Nothing More.**
