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
      'foto': 'assets/profile_daffa.jpeg',
    },
    {
      'nama': 'WIDYA PRAMUDYANING TYAS',
      'nim': '25051204405',
      'prodi': 'Teknik Informatika',
      'univ': 'Universitas Negeri Surabaya',
      'foto': 'assets/profile_widya.jpeg',
    },
    {
      'nama': 'FARHAN FAUZAN AZIMA',
      'nim': '25051204389',
      'prodi': 'Teknik Informatika',
      'univ': 'Universitas Negeri Surabaya',
      'foto': 'assets/profile_farhan.jpeg',
    },
    {
      'nama': 'HENDRI DWI MUKTI WIBOWO',
      'nim': '25051204417',
      'prodi': 'Teknik Informatika',
      'univ': 'Universitas Negeri Surabaya',
      'foto': 'assets/profile_hendri.jpeg',
    },
    {
      'nama': 'ANAQITA NAZILA RIZKYA CAHYANA',
      'nim': '25051204399',
      'prodi': 'Teknik Informatika',
      'univ': 'Universitas Negeri Surabaya',
      'foto': 'assets/profile_anaqita.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 768;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F3EA),
      body: Column(
        children: [
          // NAVBAR
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 50,
              vertical: isMobile ? 12 : 18,
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
            child: isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'DelicId',
                            style: TextStyle(
                              fontFamily: 'Diplomata',
                              fontSize: 22,
                              color: Color(0xFF493B32),
                            ),
                          ),
                          IconButton(
                            tooltip: 'Logout',
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.power_settings_new,
                              color: Color(0xFF493B32),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: _buildNavItems(context, isMobile: true),
                        ),
                      ),
                    ],
                  )
                : Row(
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
                      ..._buildNavItems(context, isMobile: false),
                      const SizedBox(width: 15),
                      IconButton(
                        tooltip: 'Logout',
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.power_settings_new,
                          color: Color(0xFF493B32),
                        ),
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
                      child: Image.asset(
                        'assets/background_about_us.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      color: const Color(0xFFF8F3EA).withValues(alpha: 0.45),
                    ),
                  ),
                  Column(
                    children: [
                      // HERO SECTION
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 16 : 80,
                          vertical: isMobile ? 24 : 50,
                        ),
                        child: isMobile
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  _buildHeroText(isMobile: true),
                                  const SizedBox(height: 24),
                                  Image.asset(
                                    'assets/logo_login.png',
                                    width: 160,
                                    height: 160,
                                    fit: BoxFit.contain,
                                  ),
                                ],
                              )
                            : Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: _buildHeroText(isMobile: false),
                                  ),
                                  const SizedBox(width: 70),
                                  Image.asset(
                                    'assets/logo_login.png',
                                    width: 300,
                                    height: 300,
                                    fit: BoxFit.contain,
                                  ),
                                ],
                              ),
                      ),

                      // PROFIL TIM DEVELOPER
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 16 : 80,
                          vertical: isMobile ? 24 : 40,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Tim Developer',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'AbrilFatface',
                                fontSize: isMobile ? 30 : 42,
                                color: const Color(0xFF493B32),
                              ),
                            ),
                            SizedBox(height: isMobile ? 24 : 45),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: teamMembers.length,
                              itemBuilder: (context, index) {
                                final member = teamMembers[index];
                                return Padding(
                                  padding: EdgeInsets.only(
                                    bottom: isMobile ? 18 : 30,
                                  ),
                                  child: _buildMemberCard(
                                    member,
                                    isMobile: isMobile,
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: isMobile ? 16 : 30),
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

  Widget _buildHeroText({required bool isMobile}) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
              isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            Text(
              'About Us',
              style: TextStyle(
                fontFamily: 'AbrilFatface',
                fontSize: isMobile ? 34 : 46,
                color: const Color(0xFF493B32),
              ),
            ),
            SizedBox(width: isMobile ? 10 : 18),
            Icon(
              Icons.spa_outlined,
              size: isMobile ? 28 : 38,
              color: const Color(0xFF9B7354),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'DelicId adalah sebuah platform yang hadir untuk membantu siapa saja menemukan berbagai inspirasi masakan dan resep yang mudah dibuat.',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: isMobile ? 15 : 17,
            height: 1.7,
            color: const Color(0xFF66564C),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Discover, Cook, Enjoy! ♡',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontFamily: 'Palace',
            fontSize: isMobile ? 28 : 34,
            color: const Color(0xFF493B32),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildNavItems(BuildContext context, {required bool isMobile}) {
    final items = ['Home', 'About Us', 'Recipe', 'Cooking Class', 'Profil'];
    return items.map((title) {
      return _navItem(context, title, title == 'About Us', isMobile: isMobile);
    }).toList();
  }

  Widget _buildMemberCard(
    Map<String, String> member, {
    required bool isMobile,
  }) {
    final String imagePath =
        (member['foto'] != null && member['foto']!.startsWith('assets/'))
            ? member['foto']!
            : 'assets/${member['foto'] ?? 'logo_login.png'}';

    final Widget avatar = Container(
      width: isMobile ? 110 : 180,
      height: isMobile ? 110 : 180,
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
          errorBuilder: (context, error, stackTrace) => Icon(
            Icons.person,
            size: isMobile ? 52 : 80,
            color: const Color(0xFF493B32),
          ),
        ),
      ),
    );

    final Widget biodata = Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
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
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: isMobile ? 18 : 22,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF493B32),
          ),
        ),
        const SizedBox(height: 12),
        const Divider(color: Color(0xFFE4D6C8)),
        const SizedBox(height: 10),
        _profileInfo('NIM', member['nim'] ?? '-', isMobile: isMobile),
        const SizedBox(height: 8),
        _profileInfo('Prodi', member['prodi'] ?? '-', isMobile: isMobile),
        const SizedBox(height: 8),
        _profileInfo('Universitas', member['univ'] ?? '-', isMobile: isMobile),
      ],
    );

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 850),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(isMobile ? 16 : 25),
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
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    avatar,
                    const SizedBox(height: 16),
                    biodata,
                  ],
                )
              : Row(
                  children: [
                    avatar,
                    const SizedBox(width: 40),
                    Expanded(child: biodata),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _navItem(
    BuildContext context,
    String title,
    bool isActive, {
    required bool isMobile,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 6 : 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: isMobile
                ? TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  )
                : null,
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
                fontSize: isMobile ? 13 : 14,
                color: const Color(0xFF493B32),
                fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
              ),
            ),
          ),
          if (isActive)
            Container(
              width: isMobile ? 36 : 50,
              height: 2,
              color: const Color(0xFF493B32),
            ),
        ],
      ),
    );
  }

  Widget _profileInfo(String label, String value, {required bool isMobile}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: isMobile ? 82 : 90,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF493B32),
            ),
          ),
        ),
        const Text(':', style: TextStyle(fontSize: 14, color: Color(0xFF8B7565))),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 14, color: Color(0xFF66564C)),
          ),
        ),
      ],
    );
  }
}