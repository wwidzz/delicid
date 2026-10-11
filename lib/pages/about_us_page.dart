import 'package:flutter/material.dart';
import 'recipe_page.dart';
import 'cooking_class_page.dart';
import 'profil_page.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F3EA),
      body: Column(
        children: [
          // =========================================================
          // NAVBAR
          // =========================================================
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 18,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                // =====================================================
                // LOGO
                // =====================================================
                const Text(
                  'DelicId',
                  style: TextStyle(
                    fontFamily: 'Diplomata',
                    fontSize: 28,
                    color: Color(0xFF493B32),
                  ),
                ),

                const Spacer(),

                // =====================================================
                // MENU HOME
                // =====================================================
                _navItem(
                  context,
                  'Home',
                  false,
                ),

                // =====================================================
                // MENU ABOUT US
                // =====================================================
                _navItem(
                  context,
                  'About Us',
                  true,
                ),

                // =====================================================
                // MENU RECIPE
                // =====================================================
                _navItem(
                  context,
                  'Recipe',
                  false,
                ),

                // =====================================================
                // MENU COOKING CLASS
                // =====================================================
                _navItem(
                  context,
                  'Cooking Class',
                  false,
                ),

                // =====================================================
                // MENU PROFIL
                // =====================================================
                _navItem(
                  context,
                  'Profil',
                  false,
                ),

                const SizedBox(width: 15),

                // =====================================================
                // LOGOUT
                // =====================================================
                IconButton(
                  tooltip: 'Logout',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.power_settings_new,
                    color: Color(0xFF493B32),
                  ),
                ),
              ],
            ),
          ),

          // =========================================================
          // CONTENT
          // =========================================================
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  // ===================================================
                  // BACKGROUND IMAGE
                  // ===================================================
                  Positioned.fill(
                    child: Opacity(
                      opacity: 0.13,
                      child: Image.asset(
                        'assets/background_about_us.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // ===================================================
                  // BACKGROUND OVERLAY
                  // ===================================================
                  Positioned.fill(
                    child: Container(
                      color: const Color(0xFFF8F3EA).withOpacity(0.45),
                    ),
                  ),

                  // ===================================================
                  // MAIN CONTENT
                  // ===================================================
                  Column(
                    children: [
                      // =================================================
                      // ABOUT US SECTION
                      // =================================================
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 80,
                          vertical: 70,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // ===========================================
                            // LEFT SIDE
                            // ===========================================
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // TITLE ABOUT US
                                  Row(
                                    children: [
                                      const Text(
                                        'About Us',
                                        style: TextStyle(
                                          fontFamily: 'AbrilFatface',
                                          fontSize: 46,
                                          color: Color(0xFF493B32),
                                        ),
                                      ),

                                      const SizedBox(width: 18),

                                      const Icon(
                                        Icons.spa_outlined,
                                        size: 38,
                                        color: Color(0xFF9B7354),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 30),

                                  // PARAGRAPH 1
                                  const Text(
                                    'DelicId adalah sebuah platform yang hadir '
                                    'untuk membantu siapa saja menemukan berbagai '
                                    'inspirasi masakan dan resep yang mudah dibuat.',
                                    style: TextStyle(
                                      fontSize: 17,
                                      height: 1.7,
                                      color: Color(0xFF66564C),
                                    ),
                                  ),

                                  const SizedBox(height: 20),

                                  // PARAGRAPH 2
                                  const Text(
                                    'Kami percaya bahwa memasak bukan hanya '
                                    'tentang menghasilkan makanan, tetapi juga '
                                    'tentang menciptakan pengalaman, berbagi '
                                    'kebahagiaan, dan menikmati setiap prosesnya.',
                                    style: TextStyle(
                                      fontSize: 17,
                                      height: 1.7,
                                      color: Color(0xFF66564C),
                                    ),
                                  ),

                                  const SizedBox(height: 20),

                                  // PARAGRAPH 3
                                  const Text(
                                    'Melalui DelicId, kami ingin membuat kegiatan '
                                    'memasak menjadi lebih menyenangkan, sederhana, '
                                    'dan dapat dinikmati oleh semua orang.',
                                    style: TextStyle(
                                      fontSize: 17,
                                      height: 1.7,
                                      color: Color(0xFF66564C),
                                    ),
                                  ),

                                  const SizedBox(height: 30),

                                  // TAGLINE
                                  const Text(
                                    'Discover, Cook, Enjoy! ♡',
                                    style: TextStyle(
                                      fontFamily: 'Palace',
                                      fontSize: 34,
                                      color: Color(0xFF493B32),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 70),

                            // ===========================================
                            // RIGHT LOGO
                            // ===========================================
                            Image.asset(
                              'assets/logo_login.png',
                              width: 470,
                              height: 470,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),

                      // =================================================
                      // PROFIL PENCIPTA
                      // =================================================
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 80,
                          vertical: 60,
                        ),
                        child: Column(
                          children: [
                            // ===========================================
                            // TITLE
                            // ===========================================
                            const Text(
                              'Profil Pencipta',
                              style: TextStyle(
                                fontFamily: 'AbrilFatface',
                                fontSize: 42,
                                color: Color(0xFF493B32),
                              ),
                            ),

                            const SizedBox(height: 45),

                            // ===========================================
                            // FOTO + BIODATA
                            // ===========================================
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // =======================================
                                // FOTO PROFIL
                                // =======================================
                                Container(
                                  width: 270,
                                  height: 270,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    border: Border.all(
                                      color: const Color(0xFFB58B68),
                                      width: 2,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xFF493B32)
                                            .withOpacity(0.12),
                                        blurRadius: 25,
                                        spreadRadius: 2,
                                        offset: const Offset(0, 10),
                                      ),
                                    ],
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/profile_widya.jpeg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 55),

                                // =======================================
                                // BIODATA
                                // =======================================
                                Container(
                                  width: 560,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 40,
                                    vertical: 35,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.94),
                                    borderRadius: BorderRadius.circular(24),
                                    border: Border.all(
                                      color: const Color(0xFFE3D4C5),
                                      width: 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xFF493B32)
                                            .withOpacity(0.08),
                                        blurRadius: 25,
                                        offset: const Offset(0, 10),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // =================================
                                      // LABEL
                                      // =================================
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 14,
                                          vertical: 7,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF1E7DC),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: const Text(
                                          'DELICID • CREATOR',
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.5,
                                            color: Color(0xFF8B684D),
                                          ),
                                        ),
                                      ),

                                      const SizedBox(height: 18),

                                      // =================================
                                      // NAMA
                                      // =================================
                                      const Text(
                                        'Widya Pramudyaning Tyas',
                                        style: TextStyle(
                                          fontSize: 27,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF493B32),
                                        ),
                                      ),

                                      const SizedBox(height: 25),

                                      // =================================
                                      // GARIS PEMBATAS
                                      // =================================
                                      Container(
                                        width: double.infinity,
                                        height: 1,
                                        color: const Color(0xFFE4D6C8),
                                      ),

                                      const SizedBox(height: 20),

                                      // =================================
                                      // NIM
                                      // =================================
                                      _profileInfo(
                                        'NIM',
                                        '25051204405',
                                      ),

                                      const SizedBox(height: 15),

                                      // =================================
                                      // PRODI
                                      // =================================
                                      _profileInfo(
                                        'Prodi',
                                        'Teknik Informatika',
                                      ),

                                      const SizedBox(height: 15),

                                      // =================================
                                      // UNIVERSITAS
                                      // =================================
                                      _profileInfo(
                                        'Universitas',
                                        'Universitas Negeri Surabaya',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // NAVBAR ITEM
  // SAMA DENGAN HOME PAGE
  // ============================================================

  Widget _navItem(
    BuildContext context,
    String title,
    bool isActive,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              // ==================================================
              // HOME
              // ==================================================
              if (title == 'Home') {
                Navigator.popUntil(
                  context,
                  (route) => route.isFirst,
                );
              }

              // ==================================================
              // ABOUT US
              // ==================================================
              else if (title == 'About Us') {
                // Sudah berada di halaman About Us
              }

              // ==================================================
              // RECIPE
              // ==================================================
              else if (title == 'Recipe') {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (
                      context,
                      animation,
                      secondaryAnimation,
                    ) =>
                        const RecipePage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              }

              // ==================================================
              // COOKING CLASS
              // ==================================================
              else if (title == 'Cooking Class') {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (
                      context,
                      animation,
                      secondaryAnimation,
                    ) =>
                        const CookingClassPage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              }

              // ==================================================
              // PROFIL
              // ==================================================
              else if (title == 'Profil') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              }
            },
            child: Text(
              title,
              style: TextStyle(
                color: const Color(0xFF493B32),
                fontWeight: isActive
                    ? FontWeight.bold
                    : FontWeight.w600,
              ),
            ),
          ),

          // =====================================================
          // GARIS MENU AKTIF
          // =====================================================
          if (isActive)
            Container(
              width: 50,
              height: 2,
              color: const Color(0xFF493B32),
            ),
        ],
      ),
    );
  }

  // =========================================================
  // PROFILE INFO
  // =========================================================

  static Widget _profileInfo(
    String label,
    String value,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 105,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF493B32),
            ),
          ),
        ),

        const Text(
          ':',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF8B7565),
          ),
        ),

        const SizedBox(width: 18),

        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF66564C),
            ),
          ),
        ),
      ],
    );
  }
}