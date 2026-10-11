import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController =
      TextEditingController();

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  DateTime? tanggalLahir;

  Future<void> pilihTanggalLahir() async {
    final DateTime? tanggal = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (tanggal != null) {
      setState(() {
        tanggalLahir = tanggal;
      });
    }
  }

  void buatAkun() {
    if (usernameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        tanggalLahir == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Silakan lengkapi semua data terlebih dahulu.',
          ),
        ),
      );

      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Akun berhasil dibuat!'),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F3EA),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F3EA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF493B32),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Daftar',
          style: TextStyle(
            color: Color(0xFF2F2925),
            fontSize: 28,
          ),
        ),
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),

          child: Container(
            width: 450,
            padding: const EdgeInsets.all(35),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                // LOGO / JUDUL
                Center(
                  child: Column(
                    children: [
                      const Text(
                        'DelicId',
                        style: TextStyle(
                          fontFamily: 'Diplomata',
                          fontSize: 32,
                          color: Color(0xFF493B32),
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        'Buat Akun Baru',
                        style: TextStyle(
                          fontFamily: 'Palace',
                          fontSize: 28,
                          color: Color(0xFF79675B),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 35),

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
                    prefixIcon:
                        const Icon(Icons.person_outline),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

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
                  keyboardType:
                      TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Masukkan email',
                    prefixIcon:
                        const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

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
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Masukkan password',
                    prefixIcon:
                        const Icon(Icons.lock_outline),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // TANGGAL LAHIR
                const Text(
                  'Tanggal Lahir',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF493B32),
                  ),
                ),

                const SizedBox(height: 8),

                InkWell(
                  onTap: pilihTanggalLahir,
                  child: Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 17,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade400,
                      ),
                      borderRadius:
                          BorderRadius.circular(12),
                    ),

                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_today_outlined,
                          color: Color(0xFF79675B),
                        ),

                        const SizedBox(width: 12),

                        Text(
                          tanggalLahir == null
                              ? 'Pilih tanggal lahir'
                              : '${tanggalLahir!.day}/${tanggalLahir!.month}/${tanggalLahir!.year}',
                          style: TextStyle(
                            color: tanggalLahir == null
                                ? Colors.grey
                                : const Color(0xFF493B32),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // BUTTON BUAT AKUN
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: buatAkun,
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

                const SizedBox(height: 15),

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