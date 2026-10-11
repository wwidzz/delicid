import 'package:flutter/material.dart';

class RecipeDetailPage extends StatelessWidget {
  final Map<String, dynamic> recipe;

  const RecipeDetailPage({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    final List<dynamic> tools = recipe['tools'] ?? [];
    final List<dynamic> ingredients = recipe['ingredients'] ?? [];
    final List<dynamic> steps = recipe['steps'] ?? [];

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
                  // LOGO
                  const Text(
                    'DelicId',
                    style: TextStyle(
                      fontFamily: 'Diplomata',
                      fontSize: 28,
                      color: Color(0xFF493B32),
                    ),
                  ),

                  const Spacer(),

                  // KEMBALI
                  TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFF493B32),
                    ),
                    label: const Text(
                      'Kembali',
                      style: TextStyle(
                        color: Color(0xFF493B32),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // =====================================================
            // GAMBAR RESEP
            // =====================================================
            Padding(
              padding: const EdgeInsets.fromLTRB(
                60,
                40,
                60,
                0,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  recipe['image'],
                  width: double.infinity,
                  height: 350,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) {
                    return Container(
                      height: 350,
                      color: const Color(0xFFEFD5B8),
                      child: const Center(
                        child: Icon(
                          Icons.restaurant,
                          size: 80,
                          color: Color(0xFF493B32),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // =====================================================
            // INFORMASI RESEP
            // =====================================================
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 35,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  // NAMA RESEP
                  Text(
                    recipe['name'],
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF493B32),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // RATING
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xFFD69B2D),
                        size: 25,
                      ),

                      const SizedBox(width: 8),

                      Text(
                        recipe['rating'],
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xFF66564C),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // DESKRIPSI
                  Text(
                    recipe['description'],
                    style: const TextStyle(
                      fontSize: 17,
                      color: Color(0xFF66564C),
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // =================================================
                  // ALAT
                  // =================================================
                  _sectionTitle(
                    icon: Icons.kitchen_outlined,
                    title: 'Alat',
                  ),

                  const SizedBox(height: 15),

                  _whiteBox(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: tools.map((tool) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(
                            bottom: 10,
                          ),
                          child: Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '• ',
                                style: TextStyle(
                                  fontSize: 18,
                                  color:
                                      Color(0xFF493B32),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  tool.toString(),
                                  style:
                                      const TextStyle(
                                    fontSize: 16,
                                    color:
                                        Color(0xFF66564C),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  const SizedBox(height: 35),

                  // =================================================
                  // BAHAN
                  // =================================================
                  _sectionTitle(
                    icon: Icons.shopping_basket_outlined,
                    title: 'Bahan',
                  ),

                  const SizedBox(height: 15),

                  _whiteBox(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children:
                          ingredients.map((ingredient) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(
                            bottom: 10,
                          ),
                          child: Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '• ',
                                style: TextStyle(
                                  fontSize: 18,
                                  color:
                                      Color(0xFF493B32),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  ingredient.toString(),
                                  style:
                                      const TextStyle(
                                    fontSize: 16,
                                    color:
                                        Color(0xFF66564C),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  const SizedBox(height: 35),

                  // =================================================
                  // CARA MEMBUAT
                  // =================================================
                  _sectionTitle(
                    icon: Icons.restaurant_menu,
                    title: 'Cara Membuat',
                  ),

                  const SizedBox(height: 15),

                  _whiteBox(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children:
                          List.generate(
                        steps.length,
                        (index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(
                              bottom: 18,
                            ),
                            child: Row(
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration:
                                      const BoxDecoration(
                                    color:
                                        Color(0xFF493B32),
                                    shape:
                                        BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${index + 1}',
                                      style:
                                          const TextStyle(
                                        color:
                                            Colors.white,
                                        fontWeight:
                                            FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 15),

                                Expanded(
                                  child: Text(
                                    steps[index]
                                        .toString(),
                                    style:
                                        const TextStyle(
                                      fontSize: 16,
                                      color:
                                          Color(0xFF66564C),
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),
                ],
              ),
            ),

            // =====================================================
            // FOOTER
            // =====================================================
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

  // ============================================================
  // JUDUL SECTION
  // ============================================================

  Widget _sectionTitle({
    required IconData icon,
    required String title,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color(0xFF493B32),
          size: 28,
        ),

        const SizedBox(width: 10),

        Text(
          title,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFF493B32),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // KOTAK PUTIH
  // ============================================================

  Widget _whiteBox({
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}