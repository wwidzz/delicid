import 'package:flutter/material.dart';
import 'recipe_page.dart';
import 'cooking_class_page.dart';
import 'profil_page.dart';

class AboutUsPage extends StatelessWidget {
  static String tag = 'about-us-page';

  const AboutUsPage({super.key});

  // DATA ANGGOTA TIM DEVELOPER
  final teamMembers = const [
    {
      'nama': 'DAFFA MAULANA PUTRA HANAYU',
      'nim': '25051204425',
      'prodi': 'Teknik Informatika',
      'univ': 'Universitas Negeri Surabaya',
      'foto': 'assets/profile_daffa.jpeg', // Jalur foto otomatis digabung dengan assets/
    },
    {
      'nama': 'WIDYA PRAMUDYANING TYAS',
      'nim': '25051204405',
      'prodi': 'Teknik Informatika',
      'univ': 'Universitas Negeri Surabaya',
      'foto': 'assets/profile_widya.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F3EA),
      body: Column(
        children: [
          // NAVBAR
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 18),
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
                const Text(
                  'DelicId',
                  style: TextStyle(
                    fontFamily: 'Diplomata',
                    fontSize: 28,
                    color: Color(0xFF493B32),
                  ),
                ),
                const Spacer(),
                _navItem(context, 'Home', false),
                _navItem(context, 'About Us', true),
                _navItem(context, 'Recipe', false),
                _navItem(context, 'Cooking Class', false),
                _navItem(context, 'Profil', false),
                const SizedBox(width: 15),
                IconButton(
                  tooltip: 'Logout',
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.power_settings_new, color: Color(0xFF493B32)),
                ),
              ],
            ),
          ),

          // CONTENT
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Opacity(
                      opacity: 0.13,
                      child: Image.asset('assets/background_about_us.png', fit: BoxFit.cover),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(color: const Color(0xFFF8F3EA).withValues(alpha: 0.45)),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 50),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: const [
                                      Text(
                                        'About Us',
                                        style: TextStyle(
                                          fontFamily: 'AbrilFatface',
                                          fontSize: 46,
                                          color: Color(0xFF493B32),
                                        ),
                                      ),
                                      SizedBox(width: 18),
                                      Icon(Icons.spa_outlined, size: 38, color: Color(0xFF9B7354)),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'DelicId adalah sebuah platform yang hadir untuk membantu siapa saja menemukan berbagai inspirasi masakan dan resep yang mudah dibuat.',
                                    style: TextStyle(fontSize: 17, height: 1.7, color: Color(0xFF66564C)),
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'Discover, Cook, Enjoy! ♡',
                                    style: TextStyle(fontFamily: 'Palace', fontSize: 34, color: Color(0xFF493B32)),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 70),
                            Image.asset('assets/logo_login.png', width: 300, height: 300, fit: BoxFit.contain),
                          ],
                        ),
                      ),

                      // PROFIL TIM DEVELOPER
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
                        child: Column(
                          children: [
                            const Text(
                              'Tim Developer',
                              style: TextStyle(fontFamily: 'AbrilFatface', fontSize: 42, color: Color(0xFF493B32)),
                            ),
                            const SizedBox(height: 45),

                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: teamMembers.length,
                              itemBuilder: (context, index) {
                                final member = teamMembers[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 30),
                                  child: _buildMemberCard(member),
                                );
                              },
                            ),
                            const SizedBox(height: 30),
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

  Widget _buildMemberCard(Map<String, String> member) {
    // Penanganan path foto otomatis
    final String imagePath = (member['foto'] != null && member['foto']!.startsWith('assets/'))
        ? member['foto']!
        : 'assets/${member['foto'] ?? 'logo_login.png'}';

    return Center(
      child: Container(
        width: 850,
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.94),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFFE3D4C5), width: 1),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF493B32).withValues(alpha: 0.08),
              blurRadius: 25,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            // FOTO ANGGOTA
            Container(
              width: 180,
              height: 180,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: const Color(0xFFB58B68), width: 2),
              ),
              child: ClipOval(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.person, size: 80, color: Color(0xFF493B32)),
                ),
              ),
            ),
            const SizedBox(width: 40),

            // BIODATA ANGGOTA
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1E7DC),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'DELICID • ${(member['role'] ?? 'DEVELOPER').toUpperCase()}',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        color: Color(0xFF8B684D),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    member['nama'] ?? '-',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF493B32),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Divider(color: Color(0xFFE4D6C8)),
                  const SizedBox(height: 10),
                  _profileInfo('NIM', member['nim'] ?? '-'),
                  const SizedBox(height: 8),
                  _profileInfo('Prodi', member['prodi'] ?? '-'),
                  const SizedBox(height: 8),
                  _profileInfo('Universitas', member['univ'] ?? '-'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(BuildContext context, String title, bool isActive) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              if (title == 'Home') {
                Navigator.popUntil(context, (route) => route.isFirst);
              } else if (title == 'Recipe') {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, a1, a2) => const RecipePage(),
                    transitionDuration: Duration.zero,
                  ),
                );
              } else if (title == 'Cooking Class') {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, a1, a2) => const CookingClassPage(),
                    transitionDuration: Duration.zero,
                  ),
                );
              } else if (title == 'Profil') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              }
            },
            child: Text(
              title,
              style: TextStyle(
                color: const Color(0xFF493B32),
                fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
              ),
            ),
          ),
          if (isActive)
            Container(width: 50, height: 2, color: const Color(0xFF493B32)),
        ],
      ),
    );
  }

  Widget _profileInfo(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 90,
          child: Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF493B32)),
          ),
        ),
        const Text(':', style: TextStyle(fontSize: 14, color: Color(0xFF8B7565))),
        const SizedBox(width: 15),
        Expanded(
          child: Text(value, style: const TextStyle(fontSize: 14, color: Color(0xFF66564C))),
        ),
      ],
    );
  }
}