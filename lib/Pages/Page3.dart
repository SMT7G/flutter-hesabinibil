import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: _dateTimePicker,
          child: appBarTheme(),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.heart,
                color: Colors.red,
                size: 30,
              )),
          SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.search,
              color: Colors.white,
              size: 28,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Page3",
              style: TextStyle(color: Colors.black),
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
        border: Border.all(width: 1,color: Colors.black),
        color: HexColor('#E37B1F'),
      ),
      child: Text(
        "< ${_dateTime.year}-${_dateTime.day}-${_dateTime.month} >",
        style: TextStyle(fontSize: 19),
      ),
    );
  }
}
