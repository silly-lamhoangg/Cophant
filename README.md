# Cophant

Ứng dụng Android hỗ trợ học Tiếng Anh lớp 8 theo các chủ điểm của sách *Global Success*. Dự án hiện là bản giao diện Flutter ban đầu.

## Thiết kế
- Flutter, Material 3; phong cách thân thiện với học sinh.
- Màu nâu, be và xanh mint; biểu tượng voi ma mút nguyên bản được vẽ bằng các widget Flutter.
- Màn hình đăng nhập/đăng ký trải nghiệm, trang danh sách bài học, trang chi tiết Unit.
- Android tối thiểu: API 24 (Android 7.0).

## Chạy dự án
Cần cài Flutter SDK và Android Studio/Android SDK.

```bash
flutter create --platforms=android .
flutter pub get
flutter run
```

Lệnh `flutter create` tạo bộ khung Android còn thiếu trong repo mới; sau đó kiểm tra `android/app/build.gradle` hoặc `android/app/build.gradle.kts` và đặt `minSdk` thành `24` (Android 7.0). Tùy phiên bản Flutter, cấu trúc Gradle được tạo có thể khác nhau.

## Phạm vi bản hiện tại
Đây là prototype giao diện. Màn hình đăng nhập/đăng ký mới kiểm tra định dạng email và độ dài mật khẩu; chưa có xác thực, lưu tài khoản hay đồng bộ tiến độ. Các mục bài học đang là khung điều hướng, nội dung cần được đối chiếu với bản sách giáo khoa hiện hành và tài liệu được phép sử dụng trước khi phát hành.

Danh sách Unit và Review được sắp theo cấu trúc Tiếng Anh 8 – Global Success; nên xác minh lại với bản sách đang dùng tại trường khi bổ sung nội dung chi tiết. Cophant là dự án học tập độc lập, không liên kết với Bộ Giáo dục và Đào tạo hay nhà xuất bản.
