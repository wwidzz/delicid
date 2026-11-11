import '../data/api_service.dart';
import '../data/recipe_model.dart';

import 'package:flutter/material.dart';

import 'about_us_page.dart';
import 'cooking_class_page.dart';
import 'profil_page.dart';
import '../data/favorite_recipe_data.dart';
import 'recipe_detail_page.dart';
import '../widgets/search_bar_widget.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _backgroundController;
  final ApiService apiService = ApiService();
  late Future<List<RecipeModel>> recipesFuture;
  String searchText = '';

  // FUNGSI SEARCH DILETAKKAN DI SINI
  void _handleSearch(String query) {
    final trimmedQuery = query.trim();
    setState(() {
      searchText = trimmedQuery;
      recipesFuture = apiService.fetchRecipes(
        search: trimmedQuery.isEmpty ? null : trimmedQuery,
      );
    });
  }

  @override
  void initState() {
    super.initState();

    recipesFuture = apiService.fetchRecipes();

    _backgroundController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _backgroundController.dispose();
    super.dispose();
  }
  // =========================================================
  // KATEGORI
  // =========================================================

  // =========================================================
  // FILTER RESEP
  // =========================================================

  List<Map<String, dynamic>> getRecipes(
    String category,
    List<Map<String, dynamic>> allRecipes,
  ) {
    return allRecipes.where((recipe) {
      final bool sameCategory = recipe['category'] == category;

      final String name = recipe['name'].toString().toLowerCase();

      final bool matchesSearch =
          searchText.isEmpty || name.contains(searchText.toLowerCase());

      return sameCategory && matchesSearch;
    }).toList();
  }

  // =========================================================
  // BUILD
  // =========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F3EA),

      body: Stack(
        children: [
          // =====================================================
          // BACKGROUND
          // =====================================================

          Positioned.fill(
            child: AnimatedBuilder(
              animation: _backgroundController,
              builder: (context, child) {
                final double value = _backgroundController.value;

                return Transform.translate(
                  offset: Offset(value * 18 - 9, value * 10 - 5),
                  child: Transform.scale(
                    scale: 1.04 + (value * 0.025),
                    child: Opacity(
                      opacity: 1.00,
                      child: Image.network(
                        'https://images.unsplash.com/photo-1498837167922-ddd27525d352?w=1600',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(color: const Color(0xFFF8F3EA));
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // =====================================================
          // OVERLAY CREAM
          // =====================================================
          Positioned.fill(
            child: Container(
              color: const Color(0xFFF8F3EA).withValues(alpha: 0.68),
            ),
          ),

          // =====================================================
          // ISI WEBSITE
          // =====================================================
          SingleChildScrollView(
            child: Column(
              children: [
                // =================================================
                // NAVBAR
                // =================================================

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

                      _navItem(context, 'Home', false),

                      _navItem(context, 'About Us', false),

                      _navItem(context, 'Recipe', true),

                      _navItem(context, 'Cooking Class', false),

                      _navItem(context, 'Profil', false),

                      const SizedBox(width: 15),

                      IconButton(
                        tooltip: 'Logout',
                        onPressed: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        icon: const Icon(
                          Icons.power_settings_new,
                          color: Color(0xFF493B32),
                        ),
                      ),
                    ],
                  ),
                ),

                // =================================================
                // JUDUL
                // =================================================
                const SizedBox(height: 55),

                const Text(
                  'Recipe',
                  style: TextStyle(
                    fontSize: 52,
                    fontFamily: 'AbrilFatface',
                    color: Color(0xFF493B32),
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Temukan resep favoritmu dan masak dengan penuh cinta ♡',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17, color: Color(0xFF79675B)),
                ),

                const SizedBox(height: 25),

                // =================================================
                // SEARCH BAR
                // =================================================
                SearchBarWidget(onSearch: _handleSearch),

                const SizedBox(height: 55),

                // =================================================
                // GRID KATEGORI
                // =================================================

                // =================================================
                // SEMUA KATEGORI
                // =================================================
                FutureBuilder<List<RecipeModel>>(
                  future: recipesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Gagal mengambil data: ${snapshot.error}'),
                      );
                    }

                    final recipeList = snapshot.data ?? [];

                    if (recipeList.isEmpty) {
                      return const Center(child: Text('Resep tidak ditemukan'));
                    }

                    final allRecipes = recipeList.map((recipe) {
                      return {
                        'id': recipe.id,
                        'name': recipe.title,
                        'image': recipe.imageUrl,
                        'category': recipe.category,
                        'rating': '4.5',
                        'description':
                            'Masakan ${recipe.category} dari ${recipe.area}.',
                        'area': recipe.area,
                        'ingredients': recipe.ingredients,
                        'tools': <String>[],
                        'steps': recipe.instructions
                            .split(RegExp(r'\r?\n+'))
                            .where((step) => step.trim().isNotEmpty)
                            .toList(),
                        'alternateDrink': recipe.alternateDrink,
                        'tags': recipe.tags,
                        'videoUrl': recipe.videoUrl,
                        'sourceUrl': recipe.sourceUrl,
                        'imageSourceUrl': recipe.imageSourceUrl,
                        'creativeCommonsConfirmed':
                            recipe.creativeCommonsConfirmed,
                        'dateModified': recipe.dateModified,
                      };
                    }).toList();

                    final apiCategories = allRecipes
                        .map((recipe) => recipe['category'].toString())
                        .toSet()
                        .toList();

                    return Column(
                      children: [
                        _categoryGrid(apiCategories),

                        const SizedBox(height: 35),

                        ...apiCategories.map(
                          (category) => _categorySection(category, allRecipes),
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 60),

                // =================================================
                // FOOTER
                // =================================================
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
                        style: TextStyle(color: Colors.white60),
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
  // GRID KATEGORI
  // =========================================================

  Widget _categoryGrid(List<String> categories) {
    // 💡 BAHAN TAMBAHAN: Saring agar hanya mengambil kategori yang unik saja
    final uniqueCategories = categories.toSet().toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        // 💡 Ubahcategories.length jadi uniqueCategories.length
        itemCount: uniqueCategories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 3.2,
        ),
        itemBuilder: (context, index) {
          // 💡 Ambil dari uniqueCategories
          final category = uniqueCategories[index];

          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFFC09A8A).withValues(alpha: 0.72),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.10),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _categoryIcon(category),
                  color: const Color(0xFF493B32),
                  size: 25,
                ),

                const SizedBox(width: 8),

                Text(
                  category,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF493B32),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  // =========================================================
  // KATEGORI
  // =========================================================

  Widget _categorySection(
    String category,
    List<Map<String, dynamic>> allRecipes,
  ) {
    final categoryRecipes = getRecipes(category, allRecipes);

    if (categoryRecipes.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: Row(
              children: [
                Icon(
                  _categoryIcon(category),
                  color: const Color(0xFF493B32),
                  size: 25,
                ),

                const SizedBox(width: 10),

                Text(
                  category,
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF493B32),
                  ),
                ),

                const Spacer(),

                const Text(
                  'Geser →',
                  style: TextStyle(fontSize: 13, color: Color(0xFF79675B)),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          // =====================================================
          // HORIZONTAL SCROLL SETIAP KATEGORI
          // =====================================================
          SizedBox(
            height: 285,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,

              padding: const EdgeInsets.symmetric(horizontal: 70),

              itemCount: categoryRecipes.length,

              separatorBuilder: (context, index) => const SizedBox(width: 15),

              itemBuilder: (context, index) {
                return _recipeCard(categoryRecipes[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // ICON KATEGORI
  // =========================================================

  IconData _categoryIcon(String category) {
    switch (category) {
      case 'Olahan Daging':
        return Icons.restaurant;

      case 'Olahan Ikan':
        return Icons.set_meal;

      case 'Olahan Ayam':
        return Icons.egg_alt;

      case 'Olahan Mie':
        return Icons.ramen_dining;

      case 'Dessert':
        return Icons.cake;

      case 'Roti':
        return Icons.bakery_dining;

      case 'Minuman':
        return Icons.local_cafe;

      default:
        return Icons.restaurant_menu;
    }
  }

  // =========================================================
  // RECIPE CARD
  // =========================================================

  Widget _recipeCard(Map<String, dynamic> recipe) {
    return Container(
      width: 205,
      decoration: BoxDecoration(
        // COKLAT MUDA AGAK PINK + LEBIH TRANSPARAN
        color: const Color(0xFFC09A8A).withValues(alpha: 0.72),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // GAMBAR

          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: recipe['image'].toString().startsWith('http')
                ? Image.network(
                    recipe['image'],
                    width: double.infinity,
                    height: 145,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: 145,
                        color: const Color(0xFFEFD5B8),
                        child: const Icon(
                          Icons.restaurant,
                          size: 45,
                          color: Color(0xFF493B32),
                        ),
                      );
                    },
                  )
                : Image.asset(
                    recipe['image'],
                    width: double.infinity,
                    height: 145,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: 145,
                        color: const Color(0xFFEFD5B8),
                        child: const Icon(
                          Icons.restaurant,
                          size: 45,
                          color: Color(0xFF493B32),
                        ),
                      );
                    },
                  ),
          ),

          // INFORMASI
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF493B32),
                  ),
                ),

                const SizedBox(height: 4),

                Row(
                  children: [
                    const Icon(Icons.star, size: 15, color: Color(0xFFFFC107)),
                    const SizedBox(width: 3),
                    Text(
                      recipe['rating'],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF493B32),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                // BOOKMARK + LIKE + LIHAT
                Row(
                  children: [
                    // IKON SIMPAN
                    InkWell(
                      onTap: () {
                        setState(() {
                          FavoriteRecipeData.toggleSaved(recipe);
                        });
                      },
                      child: Icon(
                        FavoriteRecipeData.isSaved(recipe['name'])
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                        size: 19,
                        color: const Color(0xFF493B32),
                      ),
                    ),

                    const SizedBox(width: 10),

                    // IKON SUKA
                    InkWell(
                      onTap: () {
                        setState(() {
                          FavoriteRecipeData.toggleLiked(recipe);
                        });
                      },
                      child: Icon(
                        FavoriteRecipeData.isLiked(recipe['name'])
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 19,
                        color: FavoriteRecipeData.isLiked(recipe['name'])
                            ? Colors.red
                            : const Color(0xFF493B32),
                      ),
                    ),

                    const Spacer(),

                    // TOMBOL LIHAT
                    ElevatedButton(
                      onPressed: () {
                        _showRecipeDetail(recipe);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF493B32)
                            .withValues(alpha: 0.78),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        elevation: 0,
                        minimumSize: const Size(0, 30),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Lihat',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // DETAIL RESEP
  // =========================================================

  void _showRecipeDetail(Map<String, dynamic> recipe) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            RecipeDetailPage(recipe: RecipeModel.fromJson(recipe)),
      ),
    );
  }

  // =========================================================
  // NAVBAR
  // =========================================================

  Widget _navItem(BuildContext context, String title, bool active) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),

      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          TextButton(
            onPressed: () {
              // HOME
              if (title == 'Home') {
                Navigator.popUntil(context, (route) => route.isFirst);
              }
              // ABOUT US
              else if (title == 'About Us') {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const AboutUsPage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              }
              // RECIPE
              else if (title == 'Recipe') {
                // Sudah di halaman Recipe.
              }
              // COOKING CLASS
              else if (title == 'Cooking Class') {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const CookingClassPage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              }
              // PROFIL
              else if (title == 'Profil') {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
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
                fontWeight: active ? FontWeight.bold : FontWeight.w600,
              ),
            ),
          ),

          if (active)
            Container(width: 50, height: 2, color: const Color(0xFF493B32)),
        ],
      ),
    );
  }
}
