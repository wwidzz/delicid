import 'package:flutter/material.dart';
import 'about_us_page.dart';
import 'recipe_page.dart';
import 'cooking_class_page.dart';
import '../data/favorite_recipe_data.dart';
import 'recipe_detail_page.dart';
import '../data/recipe_data.dart';

class ProfilePage extends StatefulWidget {
  final String username;

  const ProfilePage({
    super.key,
    this.username = 'Nama Akun',
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    FavoriteRecipeData.loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 768;
    final bool isSmallMobile = screenWidth < 400;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F3EA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // =====================================================
            // NAVBAR
            // =====================================================
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
            // JUDUL PROFIL
            // =====================================================
            SizedBox(height: isMobile ? 28 : 45),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 24),
              child: Text(
                'Profil',
                style: TextStyle(
                  fontSize: isMobile ? 32 : 42,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF493B32),
                ),
              ),
            ),

            SizedBox(height: isMobile ? 22 : 30),

            // =====================================================
            // FOTO PROFIL
            // =====================================================
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: isMobile ? 120 : 150,
                  height: isMobile ? 120 : 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFB89580),
                      width: 4,
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: const Color(0xFFE2D3C5),
                    child: Icon(
                      Icons.person,
                      size: isMobile ? 68 : 85,
                      color: const Color(0xFF79675B),
                    ),
                  ),
                ),

                // =================================================
                // TOMBOL EDIT FOTO
                // =================================================
                Positioned(
                  right: -2,
                  bottom: 2,
                  child: Container(
                    width: isMobile ? 38 : 45,
                    height: isMobile ? 38 : 45,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF493B32),
                    ),
                    child: IconButton(
                      tooltip: 'Edit Foto',
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Fitur mengganti foto akan dibuat selanjutnya.',
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.edit,
                        size: isMobile ? 18 : 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            // =====================================================
            // NAMA AKUN
            // =====================================================
            Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 24),
              child: Text(
                widget.username,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 20 : 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF493B32),
                ),
              ),
            ),

            SizedBox(height: isMobile ? 28 : 45),

            // =====================================================
            // MENU PROFIL
            // =====================================================
            _profileMenu(
              context,
              isMobile: isMobile,
              isSmallMobile: isSmallMobile,
              icon: Icons.favorite_border,
              title: 'Resep yang Disukai',
              onTap: () {
                _showRecipeList(
                  context,
                  'Resep yang Disukai',
                  FavoriteRecipeData.likedRecipes,
                  Icons.favorite,
                );
              },
            ),

            SizedBox(height: isMobile ? 12 : 18),

            _profileMenu(
              context,
              isMobile: isMobile,
              isSmallMobile: isSmallMobile,
              icon: Icons.bookmark_border,
              title: 'Resep yang Disimpan',
              onTap: () {
                _showRecipeList(
                  context,
                  'Resep yang Disimpan',
                  FavoriteRecipeData.savedRecipes,
                  Icons.bookmark,
                );
              },
            ),

            SizedBox(height: isMobile ? 12 : 18),

            _profileMenu(
              context,
              isMobile: isMobile,
              isSmallMobile: isSmallMobile,
              icon: Icons.restaurant_menu,
              title: 'Kelas yang Diikuti',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Halaman Kelas yang Diikuti akan dibuat selanjutnya.',
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: isMobile ? 44 : 70),

            // =====================================================
            // FOOTER
            // =====================================================
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(isMobile ? 24 : 35),
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
    );
  }

  // =========================================================
  // MENAMPILKAN RESEP YANG DISUKAI DAN DISIMPAN
  // =========================================================
  void _showRecipeList(
    BuildContext context,
    String title,
    ValueNotifier<List> recipes,
    IconData icon,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (pageContext) {
          return Scaffold(
            backgroundColor: const Color(0xFFF8F3EA),
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(pageContext),
              ),
              title: Text(title),
              backgroundColor: const Color(0xFFF8F3EA),
              foregroundColor: const Color(0xFF493B32),
              elevation: 0,
            ),
            body: ValueListenableBuilder<List>(
              valueListenable: recipes,
              builder: (context, recipeList, child) {
                if (recipeList.isEmpty) {
                  return const Center(
                    child: Text(
                      'Belum ada resep.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF493B32),
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  itemCount: recipeList.length,
                  itemBuilder: (context, index) {
                    final recipe = recipeList[index];

                    final detailRecipe = recipeData.firstWhere(
                      (item) => item['name'] == recipe['name'],
                      orElse: () => recipe,
                    );

                    final imagePath = (detailRecipe['image'] ??
                            recipe['image'] ??
                            '')
                        .toString();

                    return Container(
                      height: 116,
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.06),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // GAMBAR RESEP DI SEBELAH KIRI
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(9),
                              child: SizedBox(
                                width: 94,
                                height: 100,
                                child: imagePath.isEmpty
                                    ? _emptyRecipeImage()
                                    : Image(
                                        image: _recipeImageProvider(imagePath),
                                        fit: BoxFit.cover,
                                        errorBuilder: (
                                          context,
                                          error,
                                          stackTrace,
                                        ) {
                                          return _emptyRecipeImage();
                                        },
                                      ),
                              ),
                            ),
                          ),

                          // NAMA, RATING, DAN TOMBOL LIHAT
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 2,
                                vertical: 9,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    recipe['name']?.toString() ?? 'Resep',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF493B32),
                                    ),
                                  ),
                                  const SizedBox(height: 5),

                                  // RATING BINTANG
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Color(0xFFFFC107),
                                        size: 17,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        (detailRecipe['rating'] ??
                                                recipe['rating'] ??
                                                '-')
                                            .toString(),
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF493B32),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),

                                  // TOMBOL LIHAT
                                  SizedBox(
                                    height: 27,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          pageContext,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                RecipeDetailPage(
                                              recipe: detailRecipe,
                                            ),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF493B32),
                                        foregroundColor: Colors.white,
                                        elevation: 0,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                        ),
                                        minimumSize: Size.zero,
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      child: const Text(
                                        'Lihat',
                                        style: TextStyle(fontSize: 11),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _emptyRecipeImage() {
    return Container(
      color: const Color(0xFFEFD5B8),
      alignment: Alignment.center,
      child: const Icon(
        Icons.restaurant,
        size: 32,
        color: Color(0xFF493B32),
      ),
    );
  }

  ImageProvider _recipeImageProvider(String path) {
    if (path.startsWith('http://') || path.startsWith('https://')) {
      return NetworkImage(path);
    }
    return AssetImage(path);
  }

  // =========================================================
  // MENU PROFIL
  // =========================================================
  Widget _profileMenu(
    BuildContext context, {
    required bool isMobile,
    required bool isSmallMobile,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 150,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isSmallMobile ? 14 : (isMobile ? 18 : 25),
            vertical: isMobile ? 16 : 22,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: isMobile ? 42 : 48,
                height: isMobile ? 42 : 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8D9CC),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: isMobile ? 22 : 26,
                  color: const Color(0xFF493B32),
                ),
              ),
              SizedBox(width: isMobile ? 12 : 18),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: isSmallMobile ? 15 : (isMobile ? 16 : 18),
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF493B32),
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: const Color(0xFF493B32).withValues(alpha: 0.6),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // =========================================================
  // NAVBAR
  // =========================================================
  List<Widget> _buildNavItems(BuildContext context, {required bool isMobile}) {
    final items = ['Home', 'About Us', 'Recipe', 'Cooking Class', 'Profil'];
    return items.map((title) {
      return _navItem(context, title, title == 'Profil', isMobile: isMobile);
    }).toList();
  }

  Widget _navItem(
    BuildContext context,
    String title,
    bool active, {
    required bool isMobile,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 6 : 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
                Navigator.popUntil(
                  context,
                  (route) => route.isFirst,
                );
              } else if (title == 'About Us') {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const AboutUsPage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              } else if (title == 'Recipe') {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const RecipePage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              } else if (title == 'Cooking Class') {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const CookingClassPage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              } else if (title == 'Profil') {
                // Sudah berada di halaman Profil.
              }
            },
            child: Text(
              title,
              style: TextStyle(
                fontSize: isMobile ? 13 : 14,
                color: const Color(0xFF493B32),
                fontWeight: active ? FontWeight.bold : FontWeight.w600,
              ),
            ),
          ),
          if (active)
            Container(
              width: isMobile ? 36 : 50,
              height: 2,
              color: const Color(0xFF493B32),
            ),
        ],
      ),
    );
  }
}