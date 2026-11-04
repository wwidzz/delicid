import 'package:flutter/material.dart';
import 'video_page.dart';
import 'about_us_page.dart';
import 'recipe_page.dart';
import 'profil_page.dart';

class CookingClassPage extends StatelessWidget {
  const CookingClassPage({super.key});

  final List<Map<String, dynamic>> classes = const [
    {
      'name': 'Kelas Masak Rendang',
      'date': '12 Okt 2026',
      'time': '10:00 - 12:00',
      'level': 'Pemula',
      'rating': '4.8',
      'image':
          'assets/rendang.jpeg',
      'description':
          'Pelajari cara membuat rendang daging dengan bumbu rempah khas Indonesia.',
    },
    {
      'name': 'Kelas Masak Pasta Italia',
      'date': '15 Okt 2026',
      'time': '13:00 - 15:00',
      'level': 'Pemula',
      'rating': '4.6',
      'image':
          'https://images.unsplash.com/photo-1551892374-ecf8754cf8b0?w=700',
      'description':
          'Belajar membuat pasta Italia dengan saus yang lezat dan mudah dibuat.',
    },
    {
      'name': 'Kelas Membuat Kue',
      'date': '18 Okt 2026',
      'time': '09:00 - 11:00',
      'level': 'Pemula',
      'rating': '4.7',
      'image':
          'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=700',
      'description':
          'Belajar membuat kue lembut dengan teknik dasar baking.',
    },
    {
      'name': 'Kelas Membuat Sushi',
      'date': '20 Okt 2026',
      'time': '14:00 - 16:00',
      'level': 'Menengah',
      'rating': '4.5',
      'image':
          'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=700',
      'description':
          'Pelajari cara membuat sushi dengan teknik sederhana dan menarik.',
    },
    {
      'name': 'Kelas Menu Sehat',
      'date': '22 Okt 2026',
      'time': '10:00 - 12:00',
      'level': 'Pemula',
      'rating': '4.6',
      'image':
          'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=700',
      'description':
          'Belajar membuat menu sehat dan bergizi untuk sehari-hari.',
    },
    {
      'name': 'Kelas Membuat Roti',
      'date': '25 Okt 2026',
      'time': '13:00 - 15:00',
      'level': 'Pemula',
      'rating': '4.7',
      'image':
          'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=700',
      'description':
          'Belajar membuat roti lembut dengan teknik dasar pembuatan roti.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F3EA),

      // =====================================================
      // BACKGROUND 
      // =====================================================

      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1498837167922-ddd27525d352?w=1600',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFFF8F3EA),
                );
              },
            ),
          ),

          Positioned.fill(
            child: Container(
              color: const Color(0xFFF8F3EA).withValues(alpha: 0.40),
            ),
          ),

          // =====================================================
          // ISI HALAMAN
          // =====================================================

          SingleChildScrollView(
            child: Column(
              children: [
                // =====================================================
                // NAVBAR
                // =====================================================

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
                      const Text(
                        'DelicId',
                        style: TextStyle(
                          fontFamily: 'Diplomata',
                          fontSize: 28,
                          color: Color(0xFF493B32),
                        ),
                      ),

                      const Spacer(),

                      _navItem(
                        context,
                        'Home',
                        false,
                      ),

                      _navItem(
                        context,
                        'About Us',
                        false,
                      ),

                      _navItem(
                        context,
                        'Recipe',
                        false,
                      ),

                      _navItem(
                        context,
                        'Cooking Class',
                        true,
                      ),

                      _navItem(
                        context,
                        'Profil',
                        false,
                      ),

                      const SizedBox(width: 15),

                      IconButton(
                        tooltip: 'Logout',
                        onPressed: () {
                          Navigator.popUntil(
                            context,
                            (route) => route.isFirst,
                          );
                        },
                        icon: const Icon(
                          Icons.power_settings_new,
                          color: Color(0xFF493B32),
                        ),
                      ),
                    ],
                  ),
                ),

                // =====================================================
                // HEADER
                // =====================================================

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 45,
                    horizontal: 30,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Cooking Class',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF493B32),
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        'Belajar memasak bersama chef profesional,',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF79675B),
                        ),
                      ),

                      const Text(
                        'rasakan pengalaman seru dan penuh cita rasa!',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF79675B),
                        ),
                      ),

                      const SizedBox(height: 25),

                      // SEARCH
                      SizedBox(
                        width: 470,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Cari kelas memasak...',
                            hintStyle: const TextStyle(
                              color: Color(0xFF9B8A7C),
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Color(0xFF79675B),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // =====================================================
                // JUDUL KELAS POPULER
                // =====================================================

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 70,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.restaurant,
                        color: Color(0xFF493B32),
                        size: 25,
                      ),

                      const SizedBox(width: 10),

                      const Text(
                        'Kelas Populer',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF493B32),
                        ),
                      ),

                      const Spacer(),

                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Lihat Semua →',
                          style: TextStyle(
                            color: Color(0xFF493B32),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                // =====================================================
                // CARD COOKING CLASS - LIST VIEW VERTIKAL
                // =====================================================

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 70,
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(),
                    itemCount: classes.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                    itemBuilder: (context, index) {
                      return _classListCard(
                        context,
                        classes[index],
                      );
                    },
                  ),
                ),

                const SizedBox(height: 70),

                // =====================================================
                // FOOTER
                // =====================================================

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(35),
                  color: const Color(0xFF493B32),
                  child: const Column(
                    children: [
                      Text(
                        'DelicId',
                        style: TextStyle(
                          fontFamily: 'Diplomata',
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(height: 8),

                      Text(
                        'Cooking & Bakery',
                        style: TextStyle(
                          fontFamily: 'Palace',
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                      ),

                      SizedBox(height: 8),

                      Text(
                        '© 2026 DelicId',
                        style: TextStyle(
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // LIST CARD COOKING CLASS
  // =========================================================

  Widget _classListCard(
    BuildContext context,
    Map<String, dynamic> cookingClass,
  ) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: const Color(0xFFB89580).withValues(alpha: 0.82),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // GAMBAR
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(14),
            ),
            child: cookingClass['image'].toString().startsWith('assets/')
                ? Image.asset(
                    cookingClass['image'],
                    width: 190,
                    height: 150,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    cookingClass['image'],
                    width: 190,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
          ),

          // INFORMASI KELAS
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Text(
                    cookingClass['name'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF493B32),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 14,
                        color: Color(0xFF66564C),
                      ),

                      const SizedBox(width: 6),

                      Text(
                        cookingClass['date'],
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF66564C),
                        ),
                      ),

                      const SizedBox(width: 20),

                      const Icon(
                        Icons.access_time,
                        size: 14,
                        color: Color(0xFF66564C),
                      ),

                      const SizedBox(width: 6),

                      Text(
                        cookingClass['time'],
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF66564C),
                        ),
                      ),

                      const SizedBox(width: 20),

                      const Icon(
                        Icons.star,
                        size: 16,
                        color: Color(0xFFFFC107),
                      ),

                      const SizedBox(width: 4),

                      Text(
                        cookingClass['rating'],
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF66564C),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // TOMBOL LIHAT
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: ElevatedButton(
              onPressed: () {
                _showClassDetail(
                  context,
                  cookingClass,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color(0xFF493B32)
                        .withValues(alpha: 0.85),
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 13,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'Lihat',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // CARD
  // =========================================================

  Widget classCard(
    BuildContext context,
    Map<String, dynamic> cookingClass,
  ) {
    return Container(
      width: 190,
      decoration: BoxDecoration(
        color: const Color(0xFFB89580).withValues(alpha: 0.82),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          // GAMBAR
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(14),
            ),
            child: cookingClass['image'].toString().startsWith('assets/')
                ? Image.asset(
                    cookingClass['image'],
                    width: double.infinity,
                    height: 125,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    cookingClass['image'],
                    width: double.infinity,
                    height: 125,
                    fit: BoxFit.cover,
                  ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  cookingClass['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF493B32),
                  ),
                ),

                const SizedBox(height: 6),

                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 11,
                      color: Color(0xFF66564C),
                    ),

                    const SizedBox(width: 4),

                    Text(
                      cookingClass['date'],
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF66564C),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 11,
                      color: Color(0xFF66564C),
                    ),

                    const SizedBox(width: 4),

                    Text(
                      cookingClass['time'],
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF66564C),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 13,
                      color: Color(0xFFFFC107),
                    ),

                    const SizedBox(width: 3),

                    Text(
                      cookingClass['rating'],
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF66564C),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {
                      _showClassDetail(
                        context,
                        cookingClass,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF493B32)
                              .withValues(alpha: 0.85),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Lihat',
                      style: TextStyle(
                        fontSize: 11,
                      ),
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

  // =========================================================
  // DETAIL KELAS
  // =========================================================

  void _showClassDetail(
    BuildContext context,
    Map<String, dynamic> cookingClass,
  ) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: 550,
            decoration: BoxDecoration(
              color: const Color(0xFFF8F3EA),
              borderRadius:
                  BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // GAMBAR
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  child: cookingClass['image'].toString().startsWith('assets/')
                      ? Image.asset(
                          cookingClass['image'],
                          width: double.infinity,
                          height: 230,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          cookingClass['image'],
                          width: double.infinity,
                          height: 230,
                          fit: BoxFit.cover,
                        ),
                ),

                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        cookingClass['name'],
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF493B32),
                        ),
                      ),

                      const SizedBox(height: 15),

                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            size: 17,
                            color: Color(0xFF79675B),
                          ),

                          const SizedBox(width: 8),

                          Text(
                            cookingClass['date'],
                            style: const TextStyle(
                              color:
                                  Color(0xFF66564C),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            size: 17,
                            color: Color(0xFF79675B),
                          ),

                          const SizedBox(width: 8),

                          Text(
                            cookingClass['time'],
                            style: const TextStyle(
                              color:
                                  Color(0xFF66564C),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 18,
                            color: Color(0xFFFFC107),
                          ),

                          const SizedBox(width: 5),

                          Text(
                            cookingClass['rating'],
                            style: const TextStyle(
                              color:
                                  Color(0xFF66564C),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      Text(
                        cookingClass['description'],
                        style: const TextStyle(
                          fontSize: 15,
                          height: 1.5,
                          color: Color(0xFF66564C),
                        ),
                      ),

                      const SizedBox(height: 25),

                      // TOMBOL VIDEO
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.end,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              Navigator.pop(
                                  dialogContext);
                            },
                            style:
                                OutlinedButton
                                    .styleFrom(
                              foregroundColor:
                                  const Color(
                                      0xFF493B32),
                            ),
                            child: const Text(
                              'Tutup',
                            ),
                          ),

                          const SizedBox(width: 10),

                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pop(
                                  dialogContext);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      VideoPage(
                                    className:
                                        cookingClass[
                                            'name'],
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.play_circle,
                            ),
                            label: const Text(
                              'Lihat Video',
                            ),
                            style:
                                ElevatedButton
                                    .styleFrom(
                              backgroundColor:
                                  const Color(
                                      0xFF493B32),
                              foregroundColor:
                                  Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // =========================================================
  // NAVBAR
  // =========================================================

  Widget _navItem(
    BuildContext context,
    String title,
    bool active,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () {
              // HOME
              if (title == 'Home') {
                Navigator.popUntil(
                  context,
                  (route) => route.isFirst,
                );
              }

              // ABOUT US
              else if (title == 'About Us') {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder:
                        (context, animation, secondaryAnimation) =>
                            const AboutUsPage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              }

              // RECIPE
              else if (title == 'Recipe') {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder:
                        (context, animation, secondaryAnimation) =>
                            const RecipePage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              }

              // COOKING CLASS
              else if (title == 'Cooking Class') {
                // Sudah di halaman Cooking Class.
              }

              // PROFIL
              else if (title == 'Profil') {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder:
                        (context, animation, secondaryAnimation) =>
                            const ProfilePage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              }
            },
            child: Text(
              title,
              style: TextStyle(
                color: const Color(0xFF493B32),
                fontWeight: active
                    ? FontWeight.bold
                    : FontWeight.w600,
              ),
            ),
          ),

          if (active)
            Container(
              width: 50,
              height: 2,
              color: const Color(0xFF493B32),
            ),
        ],
      ),
    );
  }
}