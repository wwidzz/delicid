import 'package:flutter_test/flutter_test.dart';

import 'package:delicid/data/recipe_model.dart';

void main() {
  group('RecipeModel.fromJson', () {
    test('parses TheMealDB fields', () {
      final recipe = RecipeModel.fromJson({
        'idMeal': '123',
        'strMeal': 'Apple Pie',
        'strMealThumb': 'https://example.com/apple-pie.jpg',
        'strCategory': 'Dessert',
        'strArea': 'British',
        'strDrinkAlternate': 'Tea',
        'strTags': 'Pie, Dessert',
        'strYoutube': 'https://youtube.com/watch?v=example',
        'strSource': 'https://example.com/recipe',
        'strImageSource': 'https://example.com/image',
        'strCreativeCommonsConfirmed': 'Yes',
        'dateModified': '2024-01-02',
        'strIngredient1': 'Apple',
        'strMeasure1': '2',
        'strIngredient2': ' ',
        'strInstructions': 'Bake until golden.',
      });

      expect(recipe.id, '123');
      expect(recipe.title, 'Apple Pie');
      expect(recipe.imageUrl, 'https://example.com/apple-pie.jpg');
      expect(recipe.category, 'Dessert');
      expect(recipe.area, 'British');
      expect(recipe.alternateDrink, 'Tea');
      expect(recipe.tags, ['Pie', 'Dessert']);
      expect(recipe.videoUrl, 'https://youtube.com/watch?v=example');
      expect(recipe.sourceUrl, 'https://example.com/recipe');
      expect(recipe.imageSourceUrl, 'https://example.com/image');
      expect(recipe.creativeCommonsConfirmed, 'Yes');
      expect(recipe.dateModified, '2024-01-02');
      expect(recipe.ingredients, ['2 Apple']);
      expect(recipe.instructions, 'Bake until golden.');
    });

    test('parses the recipe-page map used to open recipe details', () {
      final recipe = RecipeModel.fromJson({
        'id': '456',
        'name': 'Apple Crumble',
        'image': 'https://example.com/apple-crumble.jpg',
        'category': 'Dessert',
        'area': 'British',
        'ingredients': ['2 apples', '1 cup flour'],
        'steps': ['Slice the apples.', 'Bake until golden.'],
        'tags': ['Vegetarian', 'Dessert'],
        'videoUrl': 'https://youtube.com/watch?v=example',
      });

      expect(recipe.id, '456');
      expect(recipe.title, 'Apple Crumble');
      expect(recipe.imageUrl, 'https://example.com/apple-crumble.jpg');
      expect(recipe.category, 'Dessert');
      expect(recipe.area, 'British');
      expect(recipe.ingredients, ['2 apples', '1 cup flour']);
      expect(recipe.tags, ['Vegetarian', 'Dessert']);
      expect(recipe.videoUrl, 'https://youtube.com/watch?v=example');
      expect(recipe.instructions, 'Slice the apples.\nBake until golden.');
    });
  });
}
