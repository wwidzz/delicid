import 'package:flutter/material.dart';

class FavoriteRecipeData {
  static final ValueNotifier<List<Map<String, dynamic>>> likedRecipes =
      ValueNotifier([]);

  static final ValueNotifier<List<Map<String, dynamic>>> savedRecipes =
      ValueNotifier([]);

  static void toggleLiked(Map<String, dynamic> recipe) {
    final list = List<Map<String, dynamic>>.from(likedRecipes.value);

    final index = list.indexWhere(
      (item) => item['name'] == recipe['name'],
    );

    if (index >= 0) {
      list.removeAt(index);
    } else {
      list.add(recipe);
    }

    likedRecipes.value = list;
  }

  static void toggleSaved(Map<String, dynamic> recipe) {
    final list = List<Map<String, dynamic>>.from(savedRecipes.value);

    final index = list.indexWhere(
      (item) => item['name'] == recipe['name'],
    );

    if (index >= 0) {
      list.removeAt(index);
    } else {
      list.add(recipe);
    }

    savedRecipes.value = list;
  }

  static bool isLiked(String name) {
    return likedRecipes.value.any(
      (recipe) => recipe['name'] == name,
    );
  }

  static bool isSaved(String name) {
    return savedRecipes.value.any(
      (recipe) => recipe['name'] == name,
    );
  }
}