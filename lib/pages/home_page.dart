
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'about_us_page.dart';
import 'recipe_page.dart';
import 'profil_page.dart';
import 'cooking_class_page.dart';

class HomePage extends StatelessWidget {
  final String username;

  static const List<String> bannerImages = [
    'https://images.unsplash.com/photo-1498837167922-ddd27525d352?w=900',
    'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=900',
    'https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?w=900',
    'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=900',
  ];

  const HomePage({
    super.key,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
final bool isMobile = screenWidth < 768;
    return Scaffold(
      backgroundColor: const Color(0xFFF8F3EA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // NAVBAR
           
// NAVBAR
Container(
  padding: EdgeInsets.symmetric(
    horizontal: isMobile ? 16 : 50,
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
  child: isMobile
      ? Column(
          children: [
            const Text(
              'DelicId',
              style: TextStyle(
                fontFamily: 'Diplomata',
                fontSize: 24,
                color: Color(0xFF493B32),
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _navItem(context, 'Home', true),
                  _navItem(context, 'About Us', false),
                  _navItem(context, 'Recipe', false),
                  _navItem(context, 'Cooking Class', false),
                  _navItem(context, 'Profil', false),
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
            _navItem(context, 'Home', true),
            _navItem(context, 'About Us', false),
            _navItem(context, 'Recipe', false),
            _navItem(context, 'Cooking Class', false),
            _navItem(context, 'Profil', false),
            const SizedBox(width: 15),
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


            // WELCOME
          
// WELCOME
Container(
  width: double.infinity,
  padding: EdgeInsets.symmetric(
    horizontal: isMobile ? 16 : 60,
    vertical: isMobile ? 30 : 60,
  ),
  child: isMobile
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat datang, $username!',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF493B32),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Temukan resep lezat dan inspirasi '
              'memasak untuk setiap momen.',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF79675B),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (
                      context,
                      animation,
                      secondaryAnimation,
                    ) => const RecipePage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF493B32),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Jelajahi Resep',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            CarouselSlider(
              options: CarouselOptions(
                height: 220,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                enlargeCenterPage: true,
                viewportFraction: 0.9,
              ),
              items: bannerImages.map((img) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    img,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFFEFD5B8),
                        child: const Icon(
                          Icons.restaurant,
                          size: 80,
                          color: Color(0xFF493B32),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
            ),
          ],
        )
      : Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat datang, $username!',
                    style: const TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF493B32),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Temukan resep lezat dan inspirasi '
                    'memasak untuk setiap momen.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF79675B),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                          ) => const RecipePage(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF493B32),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Jelajahi Resep',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 40),
            Expanded(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 320,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration:
                      const Duration(milliseconds: 800),
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                ),
                items: bannerImages.map((img) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(
                      img,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: const Color(0xFFEFD5B8),
                          child: const Icon(
                            Icons.restaurant,
                            size: 80,
                            color: Color(0xFF493B32),
                          ),
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
),


      SizedBox(height: isMobile ? 30 : 70),

            // FOOTER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
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
                  SizedBox(height: 10),
                  Text(
                    'Cooking & Bakery',
                    style: TextStyle(
                      fontFamily: 'Palace',
                      fontSize: 20,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 10),
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
    );
  }

  // NAVBAR ITEM
  Widget _navItem(
    BuildContext context,
    String title,
    bool isActive,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              if (title == 'About Us') {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (
                      context,
                      animation,
                      secondaryAnimation,
                    ) => const AboutUsPage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              }

              if (title == 'Recipe') {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (
                      context,
                      animation,
                      secondaryAnimation,
                    ) => const RecipePage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              }

              if (title == 'Cooking Class') {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (
                      context,
                      animation,
                      secondaryAnimation,
                    ) => const CookingClassPage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              }

              if (title == 'Profil') {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (
                      context,
                      animation,
                      secondaryAnimation,
                    ) => ProfilePage(username: username),
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
                fontWeight: isActive
                    ? FontWeight.bold
                    : FontWeight.w600,
              ),
            ),
          ),
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

  // COOKING CLASS CARD
  Widget classCard(
    String title,
    String description,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 50,
            color: const Color(0xFF493B32),
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xFF493B32),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF79675B),
            ),
          ),
        ],
      ),
    );
  }
}
