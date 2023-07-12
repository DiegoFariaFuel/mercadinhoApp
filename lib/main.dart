import 'package:flutter/material.dart';
import 'package:mercadinho/src/models/pages/auth/singin_page.dart';

void main() {
  runApp(const Mercadinho());
}

class Mercadinho extends StatefulWidget {
  const Mercadinho({super.key});

  @override
  State<Mercadinho> createState() => _MercadinhoState();
}

class _MercadinhoState extends State<Mercadinho> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.white.withAlpha(190)),
      home: const SingIn(),
    );
  }
}
