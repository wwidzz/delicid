class RecipeModel {
  final String id;
  final String title;
  final String imageUrl;
  final String category;
  final String area;
  final String instructions;
  final List<String> ingredients;
  final String? alternateDrink;
  final List<String> tags;
  final String? videoUrl;
  final String? sourceUrl;
  final String? imageSourceUrl;
  final String? creativeCommonsConfirmed;
  final String? dateModified;

  RecipeModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.category,
    required this.area,
    required this.instructions,
    required this.ingredients,
    this.alternateDrink,
    this.tags = const [],
    this.videoUrl,
    this.sourceUrl,
    this.imageSourceUrl,
    this.creativeCommonsConfirmed,
    this.dateModified,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    String? optionalString(List<String> keys) {
      for (final key in keys) {
        final value = json[key]?.toString().trim();
        if (value != null && value.isNotEmpty) {
          return value;
        }
      }
      return null;
    }

    List<String> extractedIngredients = [];
    final ingredients = json['ingredients'];
    if (ingredients is List) {
      extractedIngredients = ingredients
          .where((ingredient) => ingredient != null)
          .map((ingredient) => ingredient.toString().trim())
          .where((ingredient) => ingredient.isNotEmpty)
          .toList();
    } else {
      for (int i = 1; i <= 20; i++) {
        final ingredient = json['strIngredient$i']?.toString().trim() ?? '';
        final measure = json['strMeasure$i']?.toString().trim() ?? '';
        if (ingredient.isNotEmpty) {
          extractedIngredients.add(
            [measure, ingredient].where((part) => part.isNotEmpty).join(' '),
          );
        }
      }
    }

    final rawInstructions =
        json['strInstructions']?.toString().trim() ??
        json['instructions']?.toString().trim() ??
        '';
    final steps = json['steps'];
    final String instructions;
    if (rawInstructions.isNotEmpty) {
      instructions = rawInstructions;
    } else if (steps is List) {
      instructions = steps
          .where((step) => step != null)
          .map((step) => step.toString().trim())
          .where((step) => step.isNotEmpty)
          .join('\n');
    } else {
      instructions = '';
    }

    return RecipeModel(
      id: (json['idMeal'] ?? json['id'] ?? '').toString(),
      title: (json['strMeal'] ?? json['name'] ?? 'Tanpa Judul').toString(),
      imageUrl: (json['strMealThumb'] ?? json['image'] ?? '').toString(),
      category: (json['strCategory'] ?? json['category'] ?? 'Umum').toString(),
      area: (json['strArea'] ?? json['area'] ?? 'International').toString(),
      instructions: instructions.isEmpty
          ? 'Instruksi tidak tersedia.'
          : instructions,
      ingredients: extractedIngredients,
      alternateDrink: optionalString(['strDrinkAlternate', 'alternateDrink']),
      tags: _parseTags(json['strTags'] ?? json['tags']),
      videoUrl: optionalString(['strYoutube', 'videoUrl']),
      sourceUrl: optionalString(['strSource', 'sourceUrl']),
      imageSourceUrl: optionalString(['strImageSource', 'imageSourceUrl']),
      creativeCommonsConfirmed: optionalString([
        'strCreativeCommonsConfirmed',
        'creativeCommonsConfirmed',
      ]),
      dateModified: optionalString(['dateModified']),
    );
  }

  static List<String> _parseTags(dynamic value) {
    if (value is List) {
      return value
          .where((tag) => tag != null)
          .map((tag) => tag.toString().trim())
          .where((tag) => tag.isNotEmpty)
          .toList();
    }
    if (value is String && value.trim().isNotEmpty) {
      return value
          .split(',')
          .map((tag) => tag.trim())
          .where((tag) => tag.isNotEmpty)
          .toList();
    }
    return [];
  }
}
