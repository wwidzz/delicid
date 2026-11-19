import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import '../widgets/custom_alert.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;

  void buatAkun() {
    if (usernameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      CustomAlert.showAlert(
        context,
        title: 'Data belum lengkap',
        message: 'Silakan lengkapi semua data terlebih dahulu.',
        type: ContentType.warning,
      );
      return;
    }

    Navigator.pop(context, {
      'username': usernameController.text.trim(),
      'password': passwordController.text.trim(),
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F3EA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F3EA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF493B32)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Daftar',
          style: TextStyle(
            color: const Color(0xFF2F2925),
            fontSize: isMobile ? 22 : 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 30,
            vertical: isMobile ? 16 : 20,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(isMobile ? 22 : 35),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // LOGO / JUDUL
                  Center(
                    child: Column(
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'DelicId',
                            style: TextStyle(
                              fontFamily: 'Diplomata',
                              fontSize: isMobile ? 26 : 32,
                              color: const Color(0xFF493B32),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Buat Akun Baru',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Palace',
                            fontSize: isMobile ? 22 : 28,
                            color: const Color(0xFF79675B),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: isMobile ? 24 : 35),

                  // USERNAME
                  const Text(
                    'Username',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF493B32),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      hintText: 'Masukkan username',
                      prefixIcon: const Icon(Icons.person_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  // EMAIL
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF493B32),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Masukkan email',
                      prefixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  // PASSWORD
                  const Text(
                    'Password',
                    style: TextStyle(
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
                      prefixIcon: const Icon(Icons.lock_outline),
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // BUTTON BUAT AKUN
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: buatAkun,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF493B32),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'BUAT AKUN',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // KEMBALI KE LOGIN
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Kembali ke Login',
                        style: TextStyle(
                          color: Color(0xFF493B32),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}