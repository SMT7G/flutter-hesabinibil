import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hesabini_bil_demo/TabBar_Pages/Tb1.dart';
import 'package:hesabini_bil_demo/TabBar_Pages/Tb2.dart';
import 'package:hesabini_bil_demo/TabBar_Pages/Tb3.dart';

class Process_Page extends StatefulWidget {
  const Process_Page({Key? key}) : super(key: key);

  @override
  State<Process_Page> createState() => _Process_PageState();
}

class _Process_PageState extends State<Process_Page> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text("Ekle"),
        ),
        body: Column(
          children: <Widget>[
            Material(
              color: Colors.black87,
              child: TabBar(
                indicatorColor: Colors.white,
                unselectedLabelColor: Colors.white,
                labelColor: Colors.red,
                tabs: [
                  Tab(
                    child: Text(
                      "Gider",
                    ),
                  ),
                  Tab(
                    text: "Gelir",
                  ),
                  Tab(
                    text: "Havale",
                  ),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(
              children: [
                Tb1(),
                Tb2(),
                Tb3(),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
