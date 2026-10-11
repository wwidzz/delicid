import 'package:flutter/material.dart';
import 'about_us_page.dart';
import 'cooking_class_page.dart';
import 'profil_page.dart';
import '../data/favorite_recipe_data.dart';
import '../data/recipe_data.dart';
import 'recipe_detail_page.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _backgroundController;

  final TextEditingController searchController =
      TextEditingController();

  String searchText = '';

  @override
  void initState() {
    super.initState();

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

  final List<Map<String, dynamic>> recipes = [
    // ===================== OLAHAN DAGING =====================

    {
      'category': 'Olahan Daging',
      'name': 'Rendang',
      'rating': '4.8',
      'image':
          'assets/rendang.jpeg',
      'description':
          'Rendang daging sapi dengan bumbu rempah khas Indonesia yang kaya rasa.',
    },
    {
      'category': 'Olahan Daging',
      'name': 'Sate',
      'rating': '4.6',
      'image':
          'https://images.unsplash.com/photo-1529563021893-cc83c992d75d?w=700',
      'description':
          'Sate dengan potongan daging berbumbu yang dibakar hingga harum.',
    },
    {
      'category': 'Olahan Daging',
      'name': 'Rawon',
      'rating': '4.5',
      'image':
          'assets/rawon.webp',
      'description':
          'Rawon kuah hitam khas Jawa dengan daging sapi yang lembut.',
    },
    {
      'category': 'Olahan Daging',
      'name': 'Beef Steak',
      'rating': '4.7',
      'image':
          'https://images.unsplash.com/photo-1544025162-d76694265947?w=700',
      'description':
          'Beef steak dengan daging lembut dan saus yang gurih.',
    },
    {
      'category': 'Olahan Daging',
      'name': 'Semur Daging',
      'rating': '4.4',
      'image':
          'assets/semur_daging.jpeg',
      'description':
          'Semur daging dengan kuah kecap yang manis dan gurih.',
    },
    {
      'category': 'Olahan Daging',
      'name': 'Tongseng Sapi',
      'rating': '4.3',
      'image':
          'assets/tongseng.jpeg',
      'description':
          'Tongseng sapi dengan kuah gurih, rempah, dan sayuran.',
    },
    {
      'category': 'Olahan Daging',
      'name': 'Sop Daging',
      'rating': '4.2',
      'image':
          'assets/sop_daging.jpeg',
      'description':
          'Sop daging hangat dengan sayuran dan kuah yang gurih.',
    },
    {
      'category': 'Olahan Daging',
      'name': 'Bistik Daging',
      'rating': '4.4',
      'image':
          'https://images.unsplash.com/photo-1558030006-450675393462?w=700',
      'description':
          'Bistik daging dengan saus gurih dan sayuran pendamping.',
    },

    // ===================== OLAHAN IKAN =====================

    {
      'category': 'Olahan Ikan',
      'name': 'Ikan Bakar',
      'rating': '4.6',
      'image':
          'assets/ikan_bakar.jpeg',
      'description':
          'Ikan bakar dengan bumbu rempah yang harum dan lezat.',
    },
    {
      'category': 'Olahan Ikan',
      'name': 'Gurame Asam Manis',
      'rating': '4.5',
      'image':
          'assets/gurame.jpeg',
      'description':
          'Gurame goreng dengan saus asam manis yang segar.',
    },
    {
      'category': 'Olahan Ikan',
      'name': 'Pepes Ikan',
      'rating': '4.4',
      'image':
          'assets/pepes_ikan.jpeg',
      'description':
          'Ikan berbumbu rempah yang dimasak dengan cara dikukus.',
    },
    {
      'category': 'Olahan Ikan',
      'name': 'Salmon Panggang',
      'rating': '4.7',
      'image':
          'assets/salmon.jpeg',
      'description':
          'Salmon panggang dengan tekstur lembut dan rasa gurih.',
    },
    {
      'category': 'Olahan Ikan',
      'name': 'Tuna Steak',
      'rating': '4.5',
      'image':
          'assets/tuna.jpeg',
      'description':
          'Tuna steak yang dipanggang dengan bumbu sederhana.',
    },
    {
      'category': 'Olahan Ikan',
      'name': 'Pempek',
      'rating': '4.3',
      'image':
          'https://images.unsplash.com/photo-1601050690117-94f5f6fa8bd7?w=700',
      'description':
          'Pempek ikan khas Palembang dengan kuah cuko.',
    },
    {
      'category': 'Olahan Ikan',
      'name': 'Sarden',
      'rating': '4.2',
      'image':
          'assets/sarden.jpeg',
      'description':
          'Olahan ikan sarden yang praktis dan cocok untuk menu sehari-hari.',
    },
    {
      'category': 'Olahan Ikan',
      'name': 'Cumi Saus Tiram',
      'rating': '4.4',
      'image':
          'assets/cumi.jpeg',
      'description':
          'Cumi dengan saus tiram yang gurih dan nikmat.',
    },

    // ===================== OLAHAN AYAM =====================

    {
      'category': 'Olahan Ayam',
      'name': 'Ayam Bakar',
      'rating': '4.8',
      'image':
          'assets/ayam_bakar.jpeg',
      'description':
          'Ayam bakar dengan bumbu rempah yang meresap dan harum.',
    },
    {
      'category': 'Olahan Ayam',
      'name': 'Ayam Goreng',
      'rating': '4.6',
      'image':
          'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?w=700',
      'description':
          'Ayam goreng renyah dengan bumbu gurih.',
    },
    {
      'category': 'Olahan Ayam',
      'name': 'Ayam Geprek',
      'rating': '4.5',
      'image':
          'assets/geprek.jpeg',
      'description':
          'Ayam crispy dengan sambal pedas yang menggugah selera.',
    },
    {
      'category': 'Olahan Ayam',
      'name': 'Chicken Katsu',
      'rating': '4.6',
      'image':
          'assets/katsu.jpeg',
      'description':
          'Chicken katsu renyah dengan bagian dalam yang lembut.',
    },
    {
      'category': 'Olahan Ayam',
      'name': 'Opor Ayam',
      'rating': '4.6',
      'image':
          'assets/opor.jpeg',
      'description':
          'Opor ayam dengan kuah santan dan rempah khas Indonesia.',
    },
    {
      'category': 'Olahan Ayam',
      'name': 'Soto Ayam',
      'rating': '4.3',
      'image':
          'assets/soto.jpeg',
      'description':
          'Soto ayam dengan kuah hangat dan rempah yang harum.',
    },
    {
      'category': 'Olahan Ayam',
      'name': 'Ayam Rica-Rica',
      'rating': '4.4',
      'image':
          'assets/rica.jpeg',
      'description':
          'Ayam rica-rica dengan bumbu pedas dan rempah khas.',
    },
    {
      'category': 'Olahan Ayam',
      'name': 'Ayam Teriyaki',
      'rating': '4.5',
      'image':
          'assets/teriyaki.jpeg',
      'description':
          'Ayam dengan saus teriyaki yang manis dan gurih.',
    },

    // ===================== OLAHAN MIE =====================

    {
      'category': 'Olahan Mie',
      'name': 'Mie Goreng',
      'rating': '4.5',
      'image':
          'assets/mie_goreng.jpeg',
      'description':
          'Mie goreng dengan sayuran, telur, dan bumbu gurih.',
    },
    {
      'category': 'Olahan Mie',
      'name': 'Mie Ayam',
      'rating': '4.6',
      'image':
          'assets/mie_ayam.jpeg',
      'description':
          'Mie dengan topping ayam berbumbu dan kuah gurih.',
    },
    {
      'category': 'Olahan Mie',
      'name': 'Ramen',
      'rating': '4.6',
      'image':
          'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=700',
      'description':
          'Ramen dengan kuah gurih dan berbagai topping.',
    },
    {
      'category': 'Olahan Mie',
      'name': 'Udon',
      'rating': '4.3',
      'image':
          'https://images.unsplash.com/photo-1618841557871-b4664fbf0cb3?w=700',
      'description':
          'Udon dengan mie tebal dan kuah khas Jepang.',
    },
    {
      'category': 'Olahan Mie',
      'name': 'Spaghetti',
      'rating': '4.5',
      'image':
          'https://images.unsplash.com/photo-1551892374-ecf8754cf8b0?w=700',
      'description':
          'Spaghetti dengan saus tomat yang gurih dan lezat.',
    },
    {
      'category': 'Olahan Mie',
      'name': 'Kwetiau',
      'rating': '4.2',
      'image':
          'assets/kwetiau.jpeg',
      'description':
          'Kwetiau goreng dengan sayuran dan topping pilihan.',
    },
    {
      'category': 'Olahan Mie',
      'name': 'Bihun Goreng',
      'rating': '4.3',
      'image':
          'assets/bihun.jpeg',
      'description':
          'Bihun goreng sederhana dengan sayuran dan telur.',
    },
    {
      'category': 'Olahan Mie',
      'name': 'Mie Instan',
      'rating': '4.0',
      'image':
          'assets/mie_instan.jpeg',
      'description':
          'Mie instan dengan topping tambahan yang praktis.',
    },

    // ===================== DESSERT =====================

    {
      'category': 'Dessert',
      'name': 'Chocolate Cake',
      'rating': '4.8',
      'image':
          'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=700',
      'description':
          'Cake cokelat lembut dengan rasa cokelat yang kaya.',
    },
    {
      'category': 'Dessert',
      'name': 'Cheesecake',
      'rating': '4.7',
      'image':
          'https://images.unsplash.com/photo-1565958011703-44f9829ba187?w=700',
      'description':
          'Cheesecake lembut dengan rasa keju yang creamy.',
    },
    {
      'category': 'Dessert',
      'name': 'Tiramisu',
      'rating': '4.8',
      'image':
          'https://images.unsplash.com/photo-1571877227200-a0d98ea607e9?w=700',
      'description':
          'Tiramisu dengan perpaduan kopi dan krim lembut.',
    },
    {
      'category': 'Dessert',
      'name': 'Brownies',
      'rating': '4.6',
      'image':
          'https://images.unsplash.com/photo-1564355808539-22fda35bed7e?w=700',
      'description':
          'Brownies cokelat lembut dengan rasa manis yang pas.',
    },
    {
      'category': 'Dessert',
      'name': 'Pudding',
      'rating': '4.3',
      'image':
          'https://images.unsplash.com/photo-1488477181946-6428a0291777?w=700',
      'description':
          'Pudding lembut dan dingin yang cocok sebagai dessert.',
    },
    {
      'category': 'Dessert',
      'name': 'Pancake',
      'rating': '4.5',
      'image':
          'https://images.unsplash.com/photo-1528207776546-365bb710ee93?w=700',
      'description':
          'Pancake lembut dengan topping manis.',
    },

    // ===================== ROTI =====================

    {
      'category': 'Roti',
      'name': 'Croissant',
      'rating': '4.7',
      'image':
          'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=700',
      'description':
          'Croissant renyah di luar dan lembut di dalam.',
    },
    {
      'category': 'Roti',
      'name': 'Garlic Bread',
      'rating': '4.5',
      'image':
          'assets/garlic.jpeg',
      'description':
          'Roti dengan mentega bawang putih yang harum.',
    },
    {
      'category': 'Roti',
      'name': 'Donat',
      'rating': '4.6',
      'image':
          'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=700',
      'description':
          'Donat lembut dengan berbagai pilihan topping.',
    },
    {
      'category': 'Roti',
      'name': 'Roti Sobek',
      'rating': '4.5',
      'image':
          'assets/roti_sobek.jpeg',
      'description':
          'Roti lembut yang cocok dinikmati bersama keluarga.',
    },
    {
      'category': 'Roti',
      'name': 'Baguette',
      'rating': '4.4',
      'image':
          'assets/baguette.jpeg',
      'description':
          'Baguette renyah dengan tekstur khas roti Prancis.',
    },

    // ===================== MINUMAN =====================

    {
      'category': 'Minuman',
      'name': 'Es Teh',
      'rating': '4.5',
      'image':
          'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=700',
      'description':
          'Es teh manis yang segar untuk menemani makan.',
    },
    {
      'category': 'Minuman',
      'name': 'Jus Mangga',
      'rating': '4.6',
      'image':
          'https://images.unsplash.com/photo-1623065422902-30a2d299bbe4?w=700',
      'description':
          'Jus mangga segar dengan rasa manis alami.',
    },
    {
      'category': 'Minuman',
      'name': 'Matcha Latte',
      'rating': '4.5',
      'image':
          'https://images.unsplash.com/photo-1515823064-d6e0c04616a7?w=700',
      'description':
          'Matcha latte creamy dengan rasa matcha yang khas.',
    },
    {
      'category': 'Minuman',
      'name': 'Coffee Latte',
      'rating': '4.7',
      'image':
          'https://images.unsplash.com/photo-1541167760496-1628856ab772?w=700',
      'description':
          'Coffee latte creamy untuk menemani waktu santai.',
    },
    {
      'category': 'Minuman',
      'name': 'Cokelat',
      'rating': '4.6',
      'image':
          'https://images.unsplash.com/photo-1542990253-0d0f5be5f0ed?w=700',
      'description':
          'Minuman cokelat hangat dengan rasa manis dan creamy.',
    },

    // ===================== LAINNYA =====================

    {
      'category': 'Lainnya',
      'name': 'Nasi Goreng',
      'rating': '4.8',
      'image':
          'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=700',
      'description':
          'Nasi goreng dengan bumbu khas dan topping pilihan.',
    },
    {
      'category': 'Lainnya',
      'name': 'Gado-Gado',
      'rating': '4.4',
      'image':
          'assets/gado.jpeg',
      'description':
          'Gado-gado dengan sayuran segar dan saus kacang.',
    },
    {
      'category': 'Lainnya',
      'name': 'Pecel',
      'rating': '4.3',
      'image':
          'assets/pecel.jpeg',
      'description':
          'Pecel dengan sayuran dan sambal kacang.',
    },
    {
      'category': 'Lainnya',
      'name': 'Soto',
      'rating': '4.6',
      'image':
          'assets/soto.jpeg',
      'description':
          'Soto hangat dengan kuah gurih dan rempah.',
    },
  ];

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

  List<Map<String, dynamic>> getRecipes(String category) {
    return recipes.where((recipe) {
      final bool sameCategory =
          recipe['category'] == category;

      final String name =
          recipe['name'].toString().toLowerCase();

      final bool matchesSearch =
          searchText.isEmpty ||
          name.contains(searchText.toLowerCase());

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
                final double value =
                    _backgroundController.value;

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
                        errorBuilder:
                            (context, error, stackTrace) {
                          return Container(
                            color:
                                const Color(0xFFF8F3EA),
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
              color:
                  const Color(0xFFF8F3EA).withValues(alpha: 0.68),
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
                        true,
                      ),

                      _navItem(
                        context,
                        'Cooking Class',
                        false,
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
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xFF79675B),
                  ),
                ),

                const SizedBox(height: 25),

                // =================================================
                // SEARCH BAR
                // =================================================

                SizedBox(
                  width: 470,
                  child: TextField(
                    controller: searchController,

                    onChanged: (value) {
                      setState(() {
                        searchText = value.trim();
                      });
                    },

                    decoration: InputDecoration(
                      hintText: 'Cari resep...',

                      hintStyle: const TextStyle(
                        color: Color(0xFF9B8A7C),
                      ),

                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xFF79675B),
                      ),

                      suffixIcon: Container(
                        margin: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Color(0xFF493B32),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 19,
                        ),
                      ),

                      filled: true,

                      fillColor:
                          Colors.white.withValues(alpha: 0.94),

                      contentPadding:
                          const EdgeInsets.symmetric(
                        vertical: 17,
                        horizontal: 15,
                      ),

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),

                      // =================================================
                      // FOKUS SEARCH BAR
                      // =================================================

                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xFF493B32),
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 55),

                // =================================================
                // GRID KATEGORI
                // =================================================

                _categoryGrid(),

                const SizedBox(height: 45),

                // =================================================
                // SEMUA KATEGORI
                // =================================================

                ...categories.map(
                  (category) =>
                      _categorySection(category),
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

  Widget _categoryGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 70,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categories.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 3.2,
        ),
        itemBuilder: (context, index) {
          final category = categories[index];

          return Container(
            decoration: BoxDecoration(
              color:
                  const Color(0xFFC09A8A)
                      .withValues(alpha: 0.72),
              borderRadius:
                  BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color:
                      Colors.black.withValues(alpha: 0.10),
                  blurRadius: 8,
                  offset:
                      const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                Icon(
                  _categoryIcon(category),
                  color:
                      const Color(0xFF493B32),
                  size: 25,
                ),

                const SizedBox(width: 8),

                Text(
                  category,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight:
                        FontWeight.bold,
                    color:
                        Color(0xFF493B32),
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

  Widget _categorySection(String category) {
    final categoryRecipes =
        getRecipes(category);

    if (categoryRecipes.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(
              horizontal: 70,
            ),
            child: Row(
              children: [
                Icon(
                  _categoryIcon(category),
                  color:
                      const Color(0xFF493B32),
                  size: 25,
                ),

                const SizedBox(width: 10),

                Text(
                  category,
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight:
                        FontWeight.bold,
                    color:
                        Color(0xFF493B32),
                  ),
                ),

                const Spacer(),

                const Text(
                  'Geser →',
                  style: TextStyle(
                    fontSize: 13,
                    color:
                        Color(0xFF79675B),
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
              scrollDirection:
                  Axis.horizontal,

              padding:
                  const EdgeInsets.symmetric(
                horizontal: 70,
              ),

              itemCount:
                  categoryRecipes.length,

              separatorBuilder:
                  (context, index) =>
                      const SizedBox(
                width: 15,
              ),

              itemBuilder:
                  (context, index) {
                return _recipeCard(
                  categoryRecipes[index],
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
  borderRadius: const BorderRadius.vertical(
    top: Radius.circular(16),
  ),
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
      Map<String, dynamic> recipe) {
    final detailRecipe = recipeData.firstWhere(
      (item) => item['name'] == recipe['name'],
      orElse: () => recipe,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipeDetailPage(
          recipe: detailRecipe,
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
      padding:
          const EdgeInsets.symmetric(
        horizontal: 10,
      ),

      child: Column(
        mainAxisSize:
            MainAxisSize.min,

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
              else if (title ==
                  'Recipe') {
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
                color:
                    const Color(
                        0xFF493B32),
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
              color:
                  const Color(
                      0xFF493B32),
            ),
        ],
      ),
    );
  }
}