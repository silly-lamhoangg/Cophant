import 'package:flutter/material.dart';

void main() => runApp(const CophantApp());

const _brown = Color(0xFF684B3B);
const _brownDark = Color(0xFF49372D);
const _beige = Color(0xFFF6F0E6);
const _mint = Color(0xFFD8EFE3);
const _green = Color(0xFF39836A);
const _ink = Color(0xFF302B27);
const _muted = Color(0xFF81776E);

class CophantApp extends StatelessWidget {
  const CophantApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Cophant',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: _beige,
          colorScheme: ColorScheme.fromSeed(
            seedColor: _brown,
            primary: _brown,
            secondary: _green,
            surface: Colors.white,
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            hintStyle: const TextStyle(color: _muted),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Color(0xFFE9E0D4)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: _green, width: 1.6),
            ),
          ),
        ),
        home: const LoginScreen(),
      );
}

class MammothMark extends StatelessWidget {
  const MammothMark({super.key, this.size = 76});
  final double size;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: size * .82,
              height: size * .75,
              decoration: const BoxDecoration(
                color: _brown,
                shape: BoxShape.circle,
              ),
            ),
            Positioned(
              left: size * .22,
              top: size * .20,
              child: Container(
                width: size * .12,
                height: size * .12,
                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Center(
                  child: Container(
                    width: size * .055,
                    height: size * .055,
                    decoration: const BoxDecoration(color: _ink, shape: BoxShape.circle),
                  ),
                ),
              ),
            ),
            Positioned(
              right: size * .24,
              top: size * .20,
              child: Container(
                width: size * .12,
                height: size * .12,
                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Center(
                  child: Container(
                    width: size * .055,
                    height: size * .055,
                    decoration: const BoxDecoration(color: _ink, shape: BoxShape.circle),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: size * .10,
              left: size * .31,
              child: Transform.rotate(
                angle: -.22,
                child: Container(
                  width: size * .15,
                  height: size * .25,
                  decoration: const BoxDecoration(
                    color: _beige,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: size * .12,
              bottom: size * .13,
              child: Container(
                width: size * .09,
                height: size * .16,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
            Positioned(
              right: size * .02,
              top: size * .16,
              child: Container(
                width: size * .19,
                height: size * .27,
                decoration: BoxDecoration(
                  color: _brown,
                  borderRadius: BorderRadius.circular(size),
                ),
              ),
            ),
          ],
        ),
      );
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _isRegistering = false;
  bool _hidePassword = true;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _continue() {
    if (!_formKey.currentState!.validate()) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: (_) => HomeScreen(email: _email.text.trim())),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 430),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Center(child: MammothMark(size: 96)),
                      const SizedBox(height: 8),
                      const Text(
                        'Cophant',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900, color: _brownDark),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Học tiếng Anh, tiến bộ mỗi ngày!',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: _muted, fontSize: 15),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        _isRegistering ? 'Tạo tài khoản' : 'Chào mừng bạn trở lại!',
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: _ink),
                      ),
                      const SizedBox(height: 18),
                      TextFormField(
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        autofillHints: const [AutofillHints.email],
                        decoration: const InputDecoration(labelText: 'Email', hintText: 'ban@email.com', prefixIcon: Icon(Icons.email_outlined)),
                        validator: (value) {
                          final text = value?.trim() ?? '';
                          if (text.isEmpty || !text.contains('@') || !text.contains('.')) return 'Nhập địa chỉ email hợp lệ nhé.';
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _password,
                        obscureText: _hidePassword,
                        autofillHints: const [AutofillHints.password],
                        decoration: InputDecoration(
                          labelText: 'Mật khẩu',
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            tooltip: _hidePassword ? 'Hiện mật khẩu' : 'Ẩn mật khẩu',
                            onPressed: () => setState(() => _hidePassword = !_hidePassword),
                            icon: Icon(_hidePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                          ),
                        ),
                        validator: (value) => (value?.length ?? 0) < 6 ? 'Mật khẩu cần có ít nhất 6 ký tự.' : null,
                      ),
                      const SizedBox(height: 20),
                      FilledButton(
                        onPressed: _continue,
                        style: FilledButton.styleFrom(
                          backgroundColor: _brown,
                          foregroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(54),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        ),
                        child: Text(_isRegistering ? 'Tạo tài khoản' : 'Đăng nhập', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () => setState(() => _isRegistering = !_isRegistering),
                        child: Text(_isRegistering ? 'Đã có tài khoản? Đăng nhập' : 'Chưa có tài khoản? Đăng ký', style: const TextStyle(color: _green, fontWeight: FontWeight.w700)),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(color: _mint, borderRadius: BorderRadius.circular(14)),
                        child: const Text(
                          'Bản trải nghiệm: biểu mẫu hiện chỉ kiểm tra dữ liệu, chưa kết nối dịch vụ tài khoản.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: _brownDark, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

const _units = <({int number, String title, String subtitle})>[
  (number: 1, title: 'Leisure Time', subtitle: 'Thời gian rảnh'),
  (number: 2, title: 'Life in the Countryside', subtitle: 'Cuộc sống ở nông thôn'),
  (number: 3, title: 'Teenagers', subtitle: 'Thanh thiếu niên'),
  (number: 4, title: 'Ethnic Groups of Viet Nam', subtitle: 'Các dân tộc Việt Nam'),
  (number: 5, title: 'Our Customs and Traditions', subtitle: 'Phong tục và truyền thống'),
  (number: 6, title: 'Lifestyles', subtitle: 'Lối sống'),
  (number: 7, title: 'Environmental Protection', subtitle: 'Bảo vệ môi trường'),
  (number: 8, title: 'Shopping', subtitle: 'Mua sắm'),
  (number: 9, title: 'Natural Disasters', subtitle: 'Thiên tai'),
  (number: 10, title: 'Communication in the Future', subtitle: 'Giao tiếp trong tương lai'),
  (number: 11, title: 'Science and Technology', subtitle: 'Khoa học và công nghệ'),
  (number: 12, title: 'Life on Other Planets', subtitle: 'Cuộc sống trên hành tinh khác'),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: _beige,
          title: Row(children: [const MammothMark(size: 38), const SizedBox(width: 8), const Text('Cophant', style: TextStyle(color: _brownDark, fontWeight: FontWeight.w900))]),
          actions: [
            IconButton(
              tooltip: 'Tài khoản',
              onPressed: () => showDialog<void>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Tài khoản trải nghiệm'),
                  content: Text(email),
                  actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Đóng'))],
                ),
              ),
              icon: const Icon(Icons.account_circle_outlined, color: _brown),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: _mint, borderRadius: BorderRadius.circular(24)),
              child: Row(children: [
                const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Xin chào! 👋', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900, color: _brownDark)), SizedBox(height: 6), Text('Cùng khám phá Tiếng Anh 8 nhé!', style: TextStyle(color: _brownDark))])),
                const MammothMark(size: 68),
              ]),
            ),
            const SizedBox(height: 24),
            const Text('Tiếng Anh 8 · Global Success', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: _ink)),
            const SizedBox(height: 5),
            const Text('12 chủ điểm học tập • 4 bài ôn tập', style: TextStyle(color: _muted)),
            const SizedBox(height: 16),
            ..._units.map((unit) => _UnitCard(unit: unit)),
            const SizedBox(height: 8),
            const _ReviewCard(title: 'Review 1', subtitle: 'Ôn tập Units 1–3'),
            const _ReviewCard(title: 'Review 2', subtitle: 'Ôn tập Units 4–6'),
            const _ReviewCard(title: 'Review 3', subtitle: 'Ôn tập Units 7–9'),
            const _ReviewCard(title: 'Review 4', subtitle: 'Ôn tập Units 10–12'),
            const SizedBox(height: 12),
            const Text('Cophant là ứng dụng học tập độc lập, không phải sản phẩm của Bộ Giáo dục và Đào tạo.', textAlign: TextAlign.center, style: TextStyle(fontSize: 11, color: _muted)),
          ],
        ),
      );
}

class _UnitCard extends StatelessWidget {
  const _UnitCard({required this.unit});
  final ({int number, String title, String subtitle}) unit;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          child: InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => UnitScreen(unit: unit))),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(children: [
                Container(width: 46, height: 46, alignment: Alignment.center, decoration: BoxDecoration(color: unit.number.isEven ? _mint : _beige, borderRadius: BorderRadius.circular(14)), child: Text('${unit.number}', style: const TextStyle(color: _brown, fontWeight: FontWeight.w900, fontSize: 18))),
                const SizedBox(width: 13),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Unit ${unit.number}: ${unit.title}', style: const TextStyle(fontWeight: FontWeight.w800, color: _ink)), const SizedBox(height: 3), Text(unit.subtitle, style: const TextStyle(color: _muted, fontSize: 13))])),
                const Icon(Icons.chevron_right, color: _muted),
              ]),
            ),
          ),
        ),
      );
}

class _ReviewCard extends StatelessWidget {
  const _ReviewCard({required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Row(children: [const Icon(Icons.auto_stories_outlined, color: _green), const SizedBox(width: 12), Text(title, style: const TextStyle(fontWeight: FontWeight.w800)), const Spacer(), Text(subtitle, style: const TextStyle(color: _muted, fontSize: 12))]),
        ),
      );
}

class UnitScreen extends StatelessWidget {
  const UnitScreen({super.key, required this.unit});
  final ({int number, String title, String subtitle}) unit;
  static const _sections = <(String, String, IconData)>[
    ('Từ vựng', 'Học từ theo chủ điểm', Icons.translate),
    ('Phát âm', 'Nghe và luyện phát âm', Icons.record_voice_over_outlined),
    ('Ngữ pháp', 'Ôn cấu trúc trọng tâm', Icons.menu_book_outlined),
    ('Luyện tập', 'Thử sức với câu hỏi', Icons.quiz_outlined),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Unit ${unit.number}'), backgroundColor: _beige),
        body: ListView(padding: const EdgeInsets.all(20), children: [
          Container(padding: const EdgeInsets.all(22), decoration: BoxDecoration(color: _mint, borderRadius: BorderRadius.circular(22)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(unit.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: _brownDark)), const SizedBox(height: 6), Text(unit.subtitle, style: const TextStyle(color: _brownDark))])),
          const SizedBox(height: 22),
          const Text('Chọn nội dung học', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900, color: _ink)),
          const SizedBox(height: 12),
          ..._sections.map((section) => Card(
                color: Colors.white,
                elevation: 0,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  leading: CircleAvatar(backgroundColor: _beige, foregroundColor: _green, child: Icon(section.$3)),
                  title: Text(section.$1, style: const TextStyle(fontWeight: FontWeight.w800)),
                  subtitle: Text(section.$2),
                  trailing: const Icon(Icons.lock_clock_outlined, color: _muted),
                  onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Bài học đang được biên soạn để bám sát sách giáo khoa.'))),
                ),
              )),
          const SizedBox(height: 10),
          const Text('Nội dung bài học và câu hỏi sẽ được bổ sung sau khi đối chiếu tài liệu sách giáo khoa được phép sử dụng.', style: TextStyle(color: _muted, height: 1.5)),
        ]),
      );
}
