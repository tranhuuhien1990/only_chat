1. Firebase Auth – Xác thực đăng nhập

Vai trò: Bạn là ai?

Firebase Auth làm gì?

Đăng nhập:

Email / Password

Anonymous (ẩn danh)

Quản lý:

UID người dùng

Token đăng nhập

Bảo mật:

Rule theo auth.uid

👉 Không lưu tin nhắn
👉 Không lưu profile chi tiết

Với OnlyChat

Auth = chìa khóa

UID = ID duy nhất cho toàn hệ thống

✔️ Quyết định: Chuẩn

2. Realtime Database – Lưu tin nhắn (BEST CHOICE cho chat)

Vai trò: Ai nói gì, lúc nào – realtime

Vì sao RTDB hợp chat?

WebSocket realtime mặc định

Ghi/đọc theo node → rẻ hơn Firestore

Tối ưu cho:

Message stream

Presence (online/offline)

Typing indicator

Cấu trúc gợi ý
/messages
  /conversationId
    /messageId
      senderId: "uid_123"
      text: "Hello"
      timestamp: 1700000000


✔️ Rẻ
✔️ Nhanh
✔️ Không bị tính read theo listener như Firestore

3. Firestore – Dùng để làm gì?

Vai trò: Metadata & quản lý

Firestore nên dùng cho:

Danh sách cuộc trò chuyện

Thành viên nhóm

Tin nhắn cuối

Unread count

User profile cơ bản

Ví dụ
/conversations
  id: "c1"
  members: ["u1","u2"]
  lastMessage: "Hello"
  updatedAt: ...


👉 Load 1 lần, không realtime liên tục

4. Kiến trúc “chuẩn bài” cho OnlyChat
Firebase Auth
   ↓
User UID
   ↓
Firestore (metadata)
   - conversations
   - users
   ↓
Realtime Database
   - messages
   - presence


🎯 Đây là kiến trúc được rất nhiều app chat dùng để:

Giảm chi phí

Tăng realtime

Tránh cháy quota Firestore