
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteRecipeData {
  static final ValueNotifier<List<Map<String, dynamic>>> likedRecipes =
      ValueNotifier([]);

  static final ValueNotifier<List<Map<String, dynamic>>> savedRecipes =
      ValueNotifier([]);

  // Menyimpan data like dan bookmark ke penyimpanan lokal.
  static Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      'liked_recipes',
      jsonEncode(likedRecipes.value),
    );

    await prefs.setString(
      'favorite_recipes',
      jsonEncode(savedRecipes.value),
    );
  }

  // Memuat kembali data like dan bookmark.
  static Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    final likedData = prefs.getString('liked_recipes');
    final savedData = prefs.getString('favorite_recipes');

    if (likedData != null) {
      final decoded = jsonDecode(likedData) as List;

      likedRecipes.value = decoded
          .map((item) => Map<String, dynamic>.from(item as Map))
          .toList();
    }

    if (savedData != null) {
      final decoded = jsonDecode(savedData) as List;

      savedRecipes.value = decoded
          .map((item) => Map<String, dynamic>.from(item as Map))
          .toList();
    }
  }

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
    unawaited(saveFavorites());
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
    unawaited(saveFavorites());
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
