import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:submission_dicoding/pages/login.dart';
import 'package:submission_dicoding/pages/home.dart';
import 'package:submission_dicoding/pages/about.dart';
import 'package:submission_dicoding/pages/belajar/belajar.dart';
import 'package:submission_dicoding/pages/crypto/crypto.dart';

void main() => runApp(
      WusApp(),
    );

class WusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CuanCrypto',
      theme: ThemeData(
        accentColor: Color(0xFFFFA62B),
        scaffoldBackgroundColor: Color(0xFFf5fafa),
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        primaryColor: Color(0xFFf5fafa),
        primaryColorLight: Color(0xFF0B2385),
        dividerColor: Color(0xFFf5fafa),
        bottomAppBarColor: Color(0xFFCFCFCF),
        buttonColor: Color(0xFF0B2385),
        primaryIconTheme: IconThemeData(color: Color(0xFF2585DF)),
        accentIconTheme: IconThemeData(color: Color(0xFF2585DF)),
        disabledColor: Colors.grey[500],
        textSelectionTheme:
            TextSelectionThemeData(selectionHandleColor: Color(0xFFFFA62B)),
        fontFamily: 'SourceSansPro',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/crypto': (context) => CryptoPage(),
        '/belajar': (context) => BelajarPage(),
        '/about': (context) => AboutPage()
      },
    );
  }
}
