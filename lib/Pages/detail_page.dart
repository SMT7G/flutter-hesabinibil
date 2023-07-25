import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hesabini_bil_demo/Hesapdao.dart';
import 'package:hexcolor/hexcolor.dart';

import '../notes.dart';

class detail_page extends StatefulWidget {
  Notes note;

  detail_page({required this.note});

  @override
  State<detail_page> createState() => _detail_pageState();
}

class _detail_pageState extends State<detail_page> {
  Future<void> favoriGuncelle(int id, String tutar) async {
    await Hesapdao().favoriGuncelle(tutar, id);
  }

  @override
  Widget build(BuildContext context) {
    var device_height = MediaQuery.of(context).size.height;
    var device_width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Detay Sayfası"),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(30),
            ),
            height: (device_height - 15) * 0.8,
            width: (device_width) * 0.8,
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: HexColor('#E37B1F'),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    height: device_height * 0.5,
                    width: device_width * 0.6,
                    child: Column(
                      children: <Widget>[
                        widget.note.kategori == 1
                            ? Align(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "- ${widget.note.tutar} TL",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 23),
                                  ),
                                ),
                                alignment: Alignment.topLeft,
                              )
                            : widget.note.kategori == 2
                                ? Align(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        "- ${widget.note.tutar} TL",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 23),
                                      ),
                                    ),
                                    alignment: Alignment.topLeft,
                                  )
                                : widget.note.kategori == 3
                                    ? Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                              "- ${widget.note.tutar} TL",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 23)),
                                        ),
                                      )
                                    : widget.note.kategori == 4
                                        ? Align(
                                            alignment: Alignment.topLeft,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                  "+ ${widget.note.tutar} TL",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 23)),
                                            ),
                                          )
                                        : widget.note.kategori == 5
                                            ? Align(
                                                alignment: Alignment.topLeft,
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Text(
                                                        "+ ${widget.note.tutar} TL",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 23)),
                                                  ),
                                                ),
                                              )
                                            : widget.note.kategori == 6
                                                ? Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                        "+ ${widget.note.tutar} TL",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 23)),
                                                  )
                                                : Text(""),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Tarih: ${widget.note.dateTime}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.white70,
                          height: 2,
                          thickness: 2,
                        ),
                        Spacer(),
                        Text(
                          "Favorilerime Ekle",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            print("Okay");
                            setState(() {
                              favoriGuncelle(1, widget.note.tutar);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Kayıt favorilere eklendi!"),
                                duration: Duration(seconds: 3),
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.bookmark_border_outlined,
                            size: 35,
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 60),
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
