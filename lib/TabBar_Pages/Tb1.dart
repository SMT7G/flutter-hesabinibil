import 'package:flutter/material.dart';
import 'package:hesabini_bil_demo/Hesapdao.dart';
import 'package:hesabini_bil_demo/Pages/Home_Page.dart';
import 'package:hesabini_bil_demo/Pages/Page1.dart';
import 'package:intl/intl.dart';

import '../notes.dart';

class Tb1 extends StatefulWidget {
  const Tb1({Key? key}) : super(key: key);

  @override
  State<Tb1> createState() => _Tb1State();
}

class _Tb1State extends State<Tb1> {
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
  String tarih = DateFormat.yMd().format(DateTime.now());

  void _timePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }

  TimeOfDay _timeOfDay = TimeOfDay.now();

  int kategori_idd = 0;

  late var tutar;

  TextEditingController tf_tutar = TextEditingController();

  Future<void> noteEkle(
    String dateTime,
    String tutar,
    int kategori,
    int id,
  ) async {
    await Hesapdao().NoteEkle(
      dateTime,
      tutar,
      kategori,
      id,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final current_width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.blueGrey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        buildSizedBox(),
                        Row(
                          children: <Widget>[
                            Text(
                              "Tarih",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: GestureDetector(
                                onTap: _dateTimePicker,
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.white70, width: 2)),
                                  child: Text(
                                    "  ${_dateTime.year}-${_dateTime.month}-${_dateTime.day}  ",
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        buildSizedBox(),
                        Divider(
                          thickness: 1,
                          color: Colors.black87,
                          height: 20,
                        ),
                        buildSizedBox(),
                        Row(
                          children: <Widget>[
                            Text(
                              "Tutar",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 250,
                              child: TextField(
                                controller: tf_tutar,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        buildSizedBox(),
                        Divider(
                          thickness: 1,
                          color: Colors.black87,
                          height: 20,
                        ),
                        buildSizedBox(),
                        Row(
                          children: <Widget>[
                            Text(
                              "Kategori",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: 50,
                              width: current_width * 0.5,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black87),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  GestureDetector(
                                    child: Container(
                                      height: 50,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                          ),
                                          color: Colors.grey),
                                      child: Image.asset(
                                        "assets/yemek.png",
                                        height: 50,
                                        width: 50,
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        kategori_idd = 1;
                                      });
                                    },
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      height: 50,
                                      width: 100,
                                      decoration:
                                          BoxDecoration(color: Colors.grey),
                                      child: Image.asset(
                                        "assets/muzik.png",
                                        height: 30,
                                        width: 30,
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        kategori_idd = 2;
                                      });
                                    },
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      height: 50,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                          color: Colors.grey),
                                      child: Image.asset(
                                        "assets/araba.png",
                                        height: 50,
                                        width: 50,
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        kategori_idd = 3;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        buildSizedBox(),
                        Divider(
                          thickness: 1,
                          color: Colors.black87,
                          height: 20,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Not",
                              style: TextStyle(fontSize: 16),
                            ),
                            Spacer(),
                            Container(
                              width: 250,
                              height: 100,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        buildSizedBox(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: EdgeInsets.symmetric(
                                horizontal: 80, vertical: 15),
                          ),
                          onPressed: () {
                            setState(() {
                              tutar = tf_tutar.text;
                            });
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home_Page(
                                    kategori_id: kategori_idd,
                                    tutaar: tutar,
                                    dateTime: DateFormat("dd/MM/yyyy")
                                        .format(_dateTime),
                                    id: 0,
                                  ),
                                ),
                                (route) => false);
                            noteEkle(DateFormat("dd/MM/yyyy").format(_dateTime),
                                tutar, kategori_idd, 0);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Gider kayıdı eklendi!"),
                                duration: Duration(seconds: 3),
                              ),
                            );
                          },
                          child: Text(
                            "Kaydet",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox() {
    return SizedBox(
      height: 17,
    );
  }
}

//PopupMenuButton(
//                                 child: Align(
//                                   alignment: Alignment.center,
//                                   child: Text(
//                                     "Kategori Seç!",
//                                     style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                                 itemBuilder: (context) => [
//                                   PopupMenuItem(
//                                     child: Image.asset(
//                                       "assets/yemek.png",
//                                       height: 50,
//                                       width: 50,
//                                     ),
//                                     value: 1,
//                                     onTap: () {
//                                       setState(() {
//                                         kategori_idd = 1;
//                                       });
//                                     },
//                                   ),
//                                   PopupMenuItem(
//                                     child: Text("Yemek"),
//                                     onTap: () {
//                                       setState(() {
//                                         kategori_idd = 1;
//                                       });
//                                     },
//                                   ),
//                                   PopupMenuItem(
//                                     child: Divider(
//                                       color: Colors.black,
//                                       height: 2,
//                                       thickness: 2,
//                                     ),
//                                   ),
//                                   PopupMenuItem(
//                                     child: Image.asset(
//                                       "assets/muzik.png",
//                                       height: 50,
//                                       width: 50,
//                                     ),
//                                     value: 2,
//                                     onTap: () {
//                                       setState(() {
//                                         kategori_idd = 2;
//                                       });
//                                     },
//                                   ),
//                                   PopupMenuItem(
//                                     child: Text("Eğlence"),
//                                     onTap: () {
//                                       setState(() {
//                                         kategori_idd = 2;
//                                       });
//                                     },
//                                   ),
//                                   PopupMenuItem(
//                                     child: Divider(
//                                       color: Colors.black,
//                                       height: 2,
//                                       thickness: 2,
//                                     ),
//                                   ),
//                                   PopupMenuItem(
//                                     child: Image.asset(
//                                       "assets/araba.png",
//                                       height: 50,
//                                       width: 50,
//                                     ),
//                                     value: 3,
//                                     onTap: () {
//                                       setState(() {
//                                         kategori_idd = 3;
//                                       });
//                                     },
//                                   ),
//                                   PopupMenuItem(
//                                     child: Text("Araç"),
//                                     onTap: () {
//                                       setState(() {
//                                         kategori_idd = 3;
//                                       });
//                                     },
//                                   ),
//                                 ],
//                               )
