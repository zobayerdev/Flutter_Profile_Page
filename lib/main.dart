import 'package:flutter/material.dart';
import 'package:flutter_profile_page/root_app.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme:
            GoogleFonts.spaceGroteskTextTheme(Theme.of(context).textTheme),
        useMaterial3: false,
      ),
      home: const RootApp(),
    );
  }
}
