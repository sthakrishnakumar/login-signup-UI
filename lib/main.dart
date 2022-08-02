import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup_ui/login%20page/presentation/widgets/login.dart';
import 'package:login_signup_ui/utils/config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Note Sewa',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: Config.primaryColor,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Config.primaryColor),
        ),
      ),
      home: const LoginPage(),
    );
  }
}
