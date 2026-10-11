import 'package:flutter/material.dart';
import 'register_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

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
      body: Row(
        children: [
          // BAGIAN KIRI
          Expanded(
            flex: 5,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFF7EBD7),
                    Color(0xFFEFD5B8),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Opacity(
                      opacity: 0.13,
                      child: Image.network(
                        'https://images.unsplash.com/photo-1498837167922-ddd27525d352?w=1200',
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) {
                          return const SizedBox();
                        },
                      ),
                    ),
                  ),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Transform.translate(
                            offset: const Offset(0, -20),
                            child: Image.asset(
                              'assets/logo_login.png',
                              width: 300,
                              height: 300,
                              fit: BoxFit.contain,
                            ),
                          ),

                          const SizedBox(height: 0),

                          Transform.translate(
                            offset: const Offset(0, -50),
                            child: const Text(
                              'DelicId',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Diplomata',
                                fontSize: 52,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF493B32),
                              ),
                            ),
                          ),

                          const SizedBox(height: 8),

                          Transform.translate(
                            offset: const Offset(0, -65),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 45,
                                  height: 1,
                                  color: const Color(0xFF79675B),
                                ),

                                const SizedBox(width: 10),

                                const Text(
                                  'Cooking & Bakery',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Palace',
                                    fontSize: 20,
                                    letterSpacing: 1,
                                    color: Color(0xFF79675B),
                                  ),
                                ),

                                const SizedBox(width: 10),

                                Container(
                                  width: 45,
                                  height: 1,
                                  color: const Color(0xFF79675B),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 25),

                          Transform.translate(
                            offset: const Offset(0, -70),
                            child: const Text(
                              'Resep lezat untuk setiap momen.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF66564C),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // BAGIAN KANAN - LOGIN
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.white,
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 55,
                    vertical: 40,
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'Welcome Back!',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF493B32),
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Center(
                        child: Text(
                          'Login untuk melanjutkan',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),

                      const SizedBox(height: 35),

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
                            borderRadius:
                                BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(12),
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
                                obscurePassword =
                                    !obscurePassword;
                              });
                            },
                            icon: Icon(
                              obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color:
                                  const Color(0xFF79675B),
                            ),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF8F5F0),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFF493B32),
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Fitur lupa password akan segera tersedia.',
                                ),
                              ),
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

                      const SizedBox(height: 15),

                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: login,
                          style:
                              ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0xFF493B32),
                            foregroundColor: Colors.white,
                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12),
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

                      const SizedBox(height: 12),

                      Center(
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.center,
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
                                  color:
                                      Color(0xFF493B32),
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Username dan password harus diisi!',
          ),
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          username: username,
        ),
      ),
    );
  }

  void daftar() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RegisterPage(),
      ),
    );
  }
}