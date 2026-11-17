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
        ? const Color.fromARGB(255, 58, 74, 50) 
        : const Color.fromARGB(255, 122, 61, 56); 

    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: type,
    
        color: customBrownColor,
      ),
    );

ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}