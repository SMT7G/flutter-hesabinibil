import 'package:flutter/material.dart';
import 'package:hesabini_bil_demo/Pages/Home_Page.dart';
import 'package:hesabini_bil_demo/provider/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, child) {
        final provider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: provider.theme,
          home: Home_Page(
            dateTime: "",
            tutaar: "",
            kategori_id: 0,
            id: 0,
          ),
        );
      },
    );
  }
}
