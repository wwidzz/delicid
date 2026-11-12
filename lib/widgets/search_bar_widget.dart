
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required Function(String) onSearch,
  }) : _onSearch = onSearch;

  final Function(String) _onSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFFE3D4C5)),
      ),
      child: TextField(
        onChanged: _onSearch,
        decoration: InputDecoration(
          hintText: 'Cari resep masakan favoritmu...',
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          border: InputBorder.none,
          icon: const Icon(
            Icons.search,
            color: Color(0xFF8C684D),
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear, size: 18),
            onPressed: () => _onSearch(''),
          ),
        ),
      ),
    );
  }
}
