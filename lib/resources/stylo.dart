import 'package:flutter/material.dart';

class Stylo {
  ThemeData mainTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: 'RobotoMono',
      // colorScheme: const ColorScheme(
      //   brightness: Brightness.light,
      //   primary: Color(0xff00aeda),
      //   onPrimary: Colors.transparent,
      //   secondary: Color(0xff3881c4),
      //   onSecondary: Colors.transparent,
      //   error: Colors.red,
      //   onError: Colors.black,
      //   background: Color(0xffeff1f7),
      //   onBackground: Colors.black,
      //   surface: Colors.white,
      //   onSurface: Colors.black,
      // )
    );
  }

  SnackBar snackBar(String message) {
    final toastySnack = SnackBar(
      content: Text(message),
      backgroundColor: const Color(0xFF042c51),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(50),
      elevation: 50,
    );
    return toastySnack;
  }

  CircularProgressIndicator waitForAsync() {
    return const CircularProgressIndicator(
      backgroundColor: Colors.deepPurple,
      strokeWidth: 5,
      valueColor: AlwaysStoppedAnimation(Colors.blue),
    );
  }

  Container authSquareTile(imagePath) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white60,
      ),
      child: Image.asset(
        imagePath,
        height: 40,
      ),
    );
  }
}
