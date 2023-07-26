import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hesabini_bil_demo/Pages/email_page.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';

class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  void _dateTimePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  DateTime _dateTime = DateTime.now();

  bool Theme_Change = false;

  List<String> _titles = [
    "Ayarlar",
    "Bize Ulaşın",
    "Yardım",
    "Hesaplar",
  ];

  List<Icon> _icons = [
    Icon(Icons.settings),
    Icon(Icons.email_outlined),
    Icon(Icons.question_mark),
    Icon(Icons.account_box),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: _dateTimePicker,
          child: appBarTheme(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                Theme_Change = !Theme_Change;
              });
              provider.toggleTheme();
            },
            icon: Theme_Change == true
                ? Icon(Icons.light_mode)
                : Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.settings_outlined,
                    size: 70,
                  ),
                  Text(
                    "Ayarlar",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => email_page(),
                ));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.email_outlined,
                      size: 70,
                    ),
                    Text(
                      "Bize Ulaşın",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.account_box,
                    size: 70,
                  ),
                  Text(
                    "Hesaplar",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.question_mark_outlined,
                    size: 70,
                  ),
                  Text(
                    "Yardım",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container appBarTheme() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: Colors.black),
        color: HexColor('#E37B1F'),
      ),
      child: Text(
        "< ${_dateTime.year}-${_dateTime.day}-${_dateTime.month} >",
        style: TextStyle(fontSize: 19),
      ),
    );
  }
}
