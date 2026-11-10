class RecipeModel {
  final String id;
  final String title;
  final String imageUrl;
  final String category;
  final String area;
  final String instructions;
  final List<String> ingredients;

  RecipeModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.category,
    required this.area,
    required this.instructions,
    required this.ingredients,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    List<String> extractedIngredients = [];
    for (int i = 1; i <= 20; i++) {
      final ingredient = json['strIngredient$i'];
      final measure = json['strMeasure$i'];
      if (ingredient != null && ingredient.toString().trim().isNotEmpty) {
        extractedIngredients.add('${measure ?? ''} ${ingredient.toString().trim()}'.trim());
      }
    }

    return RecipeModel(
      id: json['idMeal'] ?? '',
      title: json['strMeal'] ?? 'Tanpa Judul',
      imageUrl: json['strMealThumb'] ?? '',
      category: json['strCategory'] ?? 'Umum',
      area: json['strArea'] ?? 'International',
      instructions: json['strInstructions'] ?? 'Instruksi tidak tersedia.',
      ingredients: extractedIngredients,
    );
  }
}
