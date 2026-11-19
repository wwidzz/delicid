import '../data/api_service.dart';
import '../data/recipe_model.dart';
import 'package:flutter/material.dart';
import 'about_us_page.dart';
import 'cooking_class_page.dart';
import 'profil_page.dart';
import '../data/favorite_recipe_data.dart';
import 'recipe_detail_page.dart';
import '../widgets/search_bar_widget.dart';
import '../data/recipe_cover.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

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

  final TextEditingController searchController = TextEditingController();

  String searchText = '';
  String? selectedCategory;

  // FUNGSI SEARCH
  void _handleSearch(String query) {
    setState(() {
      recipesFuture = apiService.fetchRecipes(search: query.trim());
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
    searchController.dispose();
    super.dispose();
  }

  // =========================================================
  // DATA RESEP
  // =========================================================

  final List recipes = RecipeCover.recipes;

  // =========================================================
  // KATEGORI
  // =========================================================

  final List<String> categories = [
    'Olahan Daging',
    'Olahan Ikan',
    'Olahan Ayam',
    'Olahan Mie',
    'Dessert',
    'Roti',
    'Minuman',
    'Lainnya',
  ];

  // =========================================================
  // FILTER RESEP
  // =========================================================

  List getRecipes(
    String category,
    List allRecipes,
  ) {
    return allRecipes.where((recipe) {
      return recipe['category'] == category;
    }).toList();
  }

  // =========================================================
  // BUILD
  // =========================================================

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 768;

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
                  offset: Offset(
                    value * 18 - 9,
                    value * 10 - 5,
                  ),
                  child: Transform.scale(
                    scale: 1.04 + (value * 0.025),
                    child: Opacity(
                      opacity: 1.00,
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
                // NAVBAR RESPONSIVE
                // =================================================
                Container(
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
                            const SizedBox(height: 4),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  _navItem(context, 'Home', false, isMobile: true),
                                  _navItem(context, 'About Us', false, isMobile: true),
                                  _navItem(context, 'Recipe', true, isMobile: true),
                                  _navItem(context, 'Cooking Class', false, isMobile: true),
                                  _navItem(context, 'Profil', false, isMobile: true),
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
                            _navItem(context, 'Home', false),
                            _navItem(context, 'About Us', false),
                            _navItem(context, 'Recipe', true),
                            _navItem(context, 'Cooking Class', false),
                            _navItem(context, 'Profil', false),
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

                // =================================================
                // JUDUL
                // =================================================
                SizedBox(height: isMobile ? 30 : 55),

                Text(
                  'Recipe',
                  style: TextStyle(
                    fontSize: isMobile ? 38 : 52,
                    fontFamily: 'AbrilFatface',
                    color: const Color(0xFF493B32),
                  ),
                ),

                const SizedBox(height: 8),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 0),
                  child: Text(
                    'Temukan resep favoritmu dan masak dengan penuh cinta ♡',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isMobile ? 14 : 17,
                      color: const Color(0xFF79675B),
                    ),
                  ),
                ),

                SizedBox(height: isMobile ? 20 : 25),

                // =================================================
                // SEARCH BAR
                // =================================================
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 0),
                  child: SearchBarWidget(onSearch: _handleSearch),
                ),

                SizedBox(height: isMobile ? 30 : 55),

                // =================================================
                // SEMUA KATEGORI
                // =================================================
                FutureBuilder<List<RecipeModel>>(
                  future: recipesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 16 : 70,
                          vertical: 20,
                        ),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 4,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: isMobile ? 2 : 4,
                              crossAxisSpacing: isMobile ? 12 : 20,
                              mainAxisSpacing: isMobile ? 12 : 20,
                              childAspectRatio: isMobile ? 0.78 : 0.85,
                            ),
                            itemBuilder: (context, index) => Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      );
                    }

                    if (snapshot.hasError) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Center(
                          child: Text(
                            'Gagal mengambil data: ${snapshot.error}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }

                    final recipeList = snapshot.data ?? [];

                    if (recipeList.isEmpty) {
                      return const Center(
                        child: Text('Resep tidak ditemukan'),
                      );
                    }

                    final allRecipes = recipeList.map((recipe) {
                      return <String, dynamic>{
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
                      };
                    }).toList();

                    final apiCategories = allRecipes
                        .map((recipe) => recipe['category'].toString())
                        .toSet()
                        .toList();

                    return Column(
                      children: [
                        _categoryGrid(apiCategories, isMobile: isMobile),
                        SizedBox(height: isMobile ? 25 : 35),
                        ...(selectedCategory == null
                                ? apiCategories
                                : apiCategories.where(
                                    (category) => category == selectedCategory,
                                  ))
                            .map(
                          (category) => _categorySection(
                            category,
                            allRecipes,
                            isMobile: isMobile,
                          ),
                        ),
                      ],
                    );
                  },
                ),

                SizedBox(height: isMobile ? 40 : 60),

                // =================================================
                // FOOTER
                // =================================================
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
        ],
      ),
    );
  }

  // =========================================================
  // GRID KATEGORI
  // =========================================================

  Widget _categoryGrid(List<String> categories, {required bool isMobile}) {
    final uniqueCategories = categories.toSet().toList();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 70,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: uniqueCategories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isMobile ? 2 : 4,
          crossAxisSpacing: isMobile ? 10 : 15,
          mainAxisSpacing: isMobile ? 10 : 15,
          childAspectRatio: isMobile ? 2.8 : 3.2,
        ),
        itemBuilder: (context, index) {
          final category = uniqueCategories[index];
          final bool isSelected = selectedCategory == category;

          return InkWell(
            onTap: () {
              setState(() {
                selectedCategory = isSelected ? null : category;
              });
            },
            borderRadius: BorderRadius.circular(15),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF493B32)
                    : const Color(0xFFC09A8A).withValues(alpha: 0.72),
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
                    color: isSelected ? Colors.white : const Color(0xFF493B32),
                    size: isMobile ? 20 : 25,
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      category,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: isMobile ? 13 : 14,
                        fontWeight: FontWeight.bold,
                        color:
                            isSelected ? Colors.white : const Color(0xFF493B32),
                      ),
                    ),
                  ),
                ],
              ),
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
    List allRecipes, {
    required bool isMobile,
  }) {
    final categoryRecipes = getRecipes(category, allRecipes);

    if (categoryRecipes.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.only(bottom: isMobile ? 24 : 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 70,
            ),
            child: Row(
              children: [
                Icon(
                  _categoryIcon(category),
                  color: const Color(0xFF493B32),
                  size: isMobile ? 22 : 25,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    category,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: isMobile ? 19 : 23,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF493B32),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Geser →',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF79675B),
                  ),
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
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 70,
              ),
              itemCount: categoryRecipes.length,
              separatorBuilder: (context, index) => SizedBox(
                width: isMobile ? 12 : 15,
              ),
              itemBuilder: (context, index) {
                return _recipeCard(
                  categoryRecipes[index],
                  isMobile: isMobile,
                );
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

  Widget _recipeCard(Map<String, dynamic> recipe, {required bool isMobile}) {
    return Container(
      width: isMobile ? 185 : 205,
      decoration: BoxDecoration(
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
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16),
            ),
            child: recipe['image'].toString().startsWith('http')
                ? CachedNetworkImage(
                    imageUrl: recipe['image'].toString(),
                    width: double.infinity,
                    height: 145,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      width: double.infinity,
                      height: 145,
                      color: const Color(0xFFEFD5B8).withValues(alpha: 0.5),
                      child: const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Color(0xFF493B32),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) {
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
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 9,
            ),
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
                    const Icon(
                      Icons.star,
                      size: 15,
                      color: Color(0xFFFFC107),
                    ),
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
                        backgroundColor:
                            const Color(0xFF493B32).withValues(alpha: 0.78),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 13,
                        ),
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

  void _showRecipeDetail(
    Map<String, dynamic> recipe,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipeDetailPage(
          recipe: recipe,
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
    bool active, {
    bool isMobile = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 4 : 10,
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
              // PROFIL
              else if (title == 'Profil') {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (
                      context,
                      animation,
                      secondaryAnimation,
                    ) =>
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
                fontSize: isMobile ? 13 : 14,
                color: const Color(0xFF493B32),
                fontWeight: active ? FontWeight.bold : FontWeight.w600,
              ),
            ),
          ),
          if (active)
            Container(
              width: isMobile ? 35 : 50,
              height: 2,
              color: const Color(0xFF493B32),
            ),
        ],
      ),
    );
  }
}