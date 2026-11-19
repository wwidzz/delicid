import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import '../widgets/custom_alert.dart';
import 'register_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? registeredUsername;
  String? registeredPassword;
  bool obscurePassword = true;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isMobile = constraints.maxWidth < 768;

          if (isMobile) {
            // TAMPILAN MOBILE / ANDROID (1 KOLOM VERTIKAL)
            return SingleChildScrollView(
              child: Column(
                children: [
                  _buildBrandHeader(isMobile: true),
                  _buildLoginForm(isMobile: true),
                ],
              ),
            );
          }

          // TAMPILAN DESKTOP / WEB (2 KOLOM KIRI-KANAN)
          return Row(
            children: [
              Expanded(
                flex: 5,
                child: _buildBrandHeader(isMobile: false),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: SingleChildScrollView(
                      child: _buildLoginForm(isMobile: false),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBrandHeader({required bool isMobile}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: isMobile ? 36 : 30,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF7EBD7),
            Color(0xFFEFD5B8),
          ],
        ),
        borderRadius: isMobile
            ? const BorderRadius.vertical(bottom: Radius.circular(32))
            : BorderRadius.zero,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: isMobile
                  ? const BorderRadius.vertical(bottom: Radius.circular(32))
                  : BorderRadius.zero,
              child: Opacity(
                opacity: 0.13,
                child: Image.network(
                  'https://images.unsplash.com/photo-1498837167922-ddd27525d352?w=1200',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox();
                  },
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo_login.png',
                width: isMobile ? 140 : 280,
                height: isMobile ? 140 : 280,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 8),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'DelicId',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Diplomata',
                    fontSize: isMobile ? 34 : 52,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF493B32),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: isMobile ? 30 : 45,
                    height: 1,
                    color: const Color(0xFF79675B),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      'Cooking & Bakery',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Palace',
                        fontSize: isMobile ? 16 : 20,
                        letterSpacing: 1,
                        color: const Color(0xFF79675B),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: isMobile ? 30 : 45,
                    height: 1,
                    color: const Color(0xFF79675B),
                  ),
                ],
              ),
              SizedBox(height: isMobile ? 12 : 20),
              Text(
                'Resep lezat untuk setiap momen.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  color: const Color(0xFF66564C),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoginForm({required bool isMobile}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 28 : 55,
        vertical: isMobile ? 32 : 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Welcome Back!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 26 : 30,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF493B32),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Center(
            child: Text(
              'Login untuk melanjutkan',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 28),
          const Text(
            'Username',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF493B32),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
              hintText: 'Masukkan username',
              prefixIcon: const Icon(
                Icons.person_outline,
                color: Color(0xFF79675B),
              ),
              filled: true,
              fillColor: const Color(0xFFF8F5F0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFF493B32),
                  width: 1.5,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Password',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF493B32),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: passwordController,
            obscureText: obscurePassword,
            decoration: InputDecoration(
              hintText: 'Masukkan password',
              prefixIcon: const Icon(
                Icons.lock_outline,
                color: Color(0xFF79675B),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
                icon: Icon(
                  obscurePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: const Color(0xFF79675B),
                ),
              ),
              filled: true,
              fillColor: const Color(0xFFF8F5F0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFF493B32),
                  width: 1.5,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                CustomAlert.showAlert(
                  context,
                  title: 'Info',
                  message: 'Fitur lupa password akan segera tersedia.',
                  type: ContentType.warning,
                );
              },
              child: const Text(
                'Lupa password?',
                style: TextStyle(
                  color: Color(0xFF79675B),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: login,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF493B32),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
              child: const Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Text(
                  'Belum punya akun?',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                TextButton(
                  onPressed: daftar,
                  child: const Text(
                    'Daftar',
                    style: TextStyle(
                      color: Color(0xFF493B32),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void login() {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      CustomAlert.showAlert(
        context,
        title: 'Data belum lengkap',
        message: 'Username dan password harus diisi!',
        type: ContentType.warning,
      );
      return;
    }

    if (username != registeredUsername || password != registeredPassword) {
      CustomAlert.showAlert(
        context,
        title: 'Login gagal',
        message: 'Username atau password salah.',
        type: ContentType.failure,
      );
      return;
    }

    CustomAlert.showAlert(
      context,
      title: 'Login berhasil',
      message: 'Selamat datang, $username!',
      type: ContentType.success,
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          username: username,
        ),
      ),
    );
  }

Future<void> daftar() async {
    final hasil = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RegisterPage(),
      ),
    );

    if (!mounted || hasil == null || hasil is! Map) {
      return;
    }

    registeredUsername = hasil['username']?.toString();
    registeredPassword = hasil['password']?.toString();
    usernameController.text = registeredUsername ?? '';
    passwordController.text = registeredPassword ?? '';

    CustomAlert.showAlert(
      context,
      title: 'Berhasil',
      message: 'Akun berhasil dibuat!',
      type: ContentType.success,
    );
  }
}
