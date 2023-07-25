import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hesabini_bil_demo/Pages/Page1.dart';
import 'package:hesabini_bil_demo/Pages/Page2.dart';
import 'package:hesabini_bil_demo/Pages/Page3.dart';
import 'package:hesabini_bil_demo/Pages/Page4.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import '../Process_Page/Process_Page.dart';
import '../notes.dart';

class Home_Page extends StatefulWidget {
  int kategori_id;
  String dateTime;
  String tutaar;
  int id;

  Home_Page({
    required this.kategori_id,
    required this.tutaar,
    required this.dateTime,
    required this.id,
  });

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
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

  //String tarih = DateFormat.yMd().format(DateTime.now());

  int currentindex = 0;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                currentindex = value;
              });
            },
            children: [
              Page1(
                kategori_id: widget.kategori_id,
                dateTime: widget.dateTime,
                tutaar: widget.tutaar,
                id: widget.id,
              ),
              Page2(),
              Page3(),
              Page4(),
            ],
          ),
        ),
        bottomNavigationBar: GNav(
          backgroundColor: HexColor('#00478d'),
          activeColor: Colors.white54,
          padding: EdgeInsets.all(18),
          gap: 10.0,
          onTabChange: (index) {
            setState(() {
              _pageController.jumpToPage(index);
            });
          },
          selectedIndex: currentindex,
          tabs: [
            GButton(
              textColor: Colors.white,
              iconColor: Colors.white54,
              iconActiveColor: Colors.white,
              icon: Icons.list,
              text: "İşlemler",
            ),
            GButton(
              textColor: Colors.white,
              iconColor: Colors.white54,
              iconActiveColor: Colors.white,
              icon: Icons.equalizer,
              text: "İstatistik",
            ),
            GButton(
              textColor: Colors.white,
              iconColor: Colors.white54,
              iconActiveColor: Colors.white,
              icon: Icons.account_balance_wallet,
              text: "Hesaplar",
            ),
            GButton(
              textColor: Colors.white,
              iconColor: Colors.white54,
              iconActiveColor: Colors.white,
              icon: Icons.more_horiz,
              text: "Daha",
            ),
          ],
        ),
      ),
    );
  }
}
