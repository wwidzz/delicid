import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class CustomAlert {
  static void showAlert(
    BuildContext context, {
    required String title,
    required String message,
    required ContentType type,
  }) {
    final Color customBrownColor = type == ContentType.success
        ? const Color.fromARGB(221, 65, 74, 50)
        : type == ContentType.warning
            ? const Color.fromRGBO(105, 75, 18, 1)
            : const Color.fromARGB(234, 122, 63, 56);

    final IconData iconData = type == ContentType.success
        ? Icons.check_circle_outline
        : type == ContentType.warning
            ? Icons.warning_amber_rounded
            : Icons.error_outline;

    final double screenHeight = MediaQuery.of(context).size.height;

    final snackBar = SnackBar(
      elevation: 4,
      duration: const Duration(milliseconds: 2200),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
      backgroundColor: customBrownColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      margin: EdgeInsets.only(
        bottom: screenHeight > 220 ? screenHeight - 150 : 20,
        left: 16,
        right: 16,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      content: Row(
        children: [
          Icon(iconData, color: Colors.white, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  message,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}