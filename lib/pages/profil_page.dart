
import 'package:flutter/material.dart';
import 'about_us_page.dart';
import 'recipe_page.dart';
import 'cooking_class_page.dart';
import '../data/favorite_recipe_data.dart';
import 'recipe_detail_page.dart';
import '../data/recipe_data.dart';

class ProfilePage extends StatelessWidget {
  final String username;

  const ProfilePage({
    super.key,
    this.username = 'Nama Akun',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F3EA),
      body: SingleChildScrollView(
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
                    false,
                  ),

                  _navItem(
                    context,
                    'Profil',
                    true,
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
            // JUDUL PROFIL
            // =====================================================

            const SizedBox(height: 45),

            const Text(
              'Profil',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: Color(0xFF493B32),
              ),
            ),

            const SizedBox(height: 30),

            // =====================================================
            // FOTO PROFIL
            // =====================================================

            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFB89580),
                      width: 4,
                    ),
                  ),
                  child: const CircleAvatar(
                    backgroundColor: Color(0xFFE2D3C5),
                    child: Icon(
                      Icons.person,
                      size: 85,
                      color: Color(0xFF79675B),
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
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF493B32),
                    ),
                    child: IconButton(
                      tooltip: 'Edit Foto',
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Fitur mengganti foto akan dibuat selanjutnya.',
                            ),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.edit,
                        size: 20,
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

            Text(
              username,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF493B32),
              ),
            ),

            const SizedBox(height: 45),

            // =====================================================
            // MENU PROFIL
            // =====================================================

            _profileMenu(
              context,
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

            const SizedBox(height: 18),

            _profileMenu(
              context,
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

            const SizedBox(height: 18),

            _profileMenu(
              context,
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
    );
  }

  
  // =========================================================
  // MENAMPILKAN RESEP YANG DISUKAI DAN DISIMPAN
  // =========================================================

  void _showRecipeList(
    BuildContext context,
    String title,
    ValueNotifier<List<Map<String, dynamic>>> recipes,
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
            body: ValueListenableBuilder<
                List<Map<String, dynamic>>>(
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

                    // Cari data resep lengkap berdasarkan nama.
                    final detailRecipe = recipeData.firstWhere(
                      (item) => item['name'] == recipe['name'],
                      orElse: () => recipe,
                    );

                    // Ambil gambar dari data resep lengkap.
                    final imagePath = (
                      detailRecipe['image'] ??
                      recipe['image'] ??
                      ''
                    ).toString();

                    return Container(
                      height: 116,
                      margin: const EdgeInsets.only(
                        bottom: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
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
                                        image: _recipeImageProvider(
                                          imagePath,
                                        ),
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
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  Text(
                                    recipe['name']?.toString() ??
                                        'Resep',
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
                                        (
                                          detailRecipe['rating'] ??
                                          recipe['rating'] ??
                                          '-'
                                        ).toString(),
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
                                        backgroundColor:
                                            const Color(0xFF493B32),
                                        foregroundColor: Colors.white,
                                        elevation: 0,
                                        padding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 15,
                                        ),
                                        minimumSize: Size.zero,
                                        tapTargetSize:
                                            MaterialTapTargetSize
                                                .shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
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

  // Menampilkan pengganti jika gambar gagal dimuat.
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

  // Memilih gambar dari URL atau asset lokal.
  ImageProvider _recipeImageProvider(String path) {
    if (path.startsWith('http://') ||
        path.startsWith('https://')) {
      return NetworkImage(path);
    }

    return AssetImage(path);
  }

  // =========================================================
  // MENU PROFIL
  // =========================================================

  Widget _profileMenu(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 150,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 22,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8D9CC),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 26,
                  color: const Color(0xFF493B32),
                ),
              ),

              const SizedBox(width: 18),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF493B32),
                ),
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
                        (
                          context,
                          animation,
                          secondaryAnimation,
                        ) =>
                            const AboutUsPage(),
                    transitionDuration:
                        Duration.zero,
                    reverseTransitionDuration:
                        Duration.zero,
                  ),
                );
              }

              // RECIPE
              else if (title == 'Recipe') {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder:
                        (
                          context,
                          animation,
                          secondaryAnimation,
                        ) =>
                            const RecipePage(),
                    transitionDuration:
                        Duration.zero,
                    reverseTransitionDuration:
                        Duration.zero,
                  ),
                );
              }

              // COOKING CLASS
              else if (title == 'Cooking Class') {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder:
                        (
                          context,
                          animation,
                          secondaryAnimation,
                        ) =>
                            const CookingClassPage(),
                    transitionDuration:
                        Duration.zero,
                    reverseTransitionDuration:
                        Duration.zero,
                  ),
                );
              }

              // PROFIL
              else if (title == 'Profil') {
                // Sudah berada di halaman Profil.
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
