import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
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
  Future<void> favoriGuncelle(int note_id, int id) async {
    await Hesapdao().favoriGuncelle(note_id, id);
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: device_height * 0.69,
                  width: device_width * 0.9,
                  decoration: BoxDecoration(
                    color: HexColor('#00478d'),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      width: 2,
                      color: HexColor('#E37B1F'),
                    ),
                  ),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "Tutar:",
                                style: TextStyle(
                                    color: HexColor('E37B1F'), fontSize: 23),
                              ),
                              Spacer(),
                              widget.note.kategori == 1
                                  ? Align(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          "- ${widget.note.tutar} TL",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22),
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
                                                  color: Colors.white,
                                                  fontSize: 22),
                                            ),
                                          ),
                                          alignment: Alignment.topLeft,
                                        )
                                      : widget.note.kategori == 3
                                          ? Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Text(
                                                    "- ${widget.note.tutar} TL",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 22)),
                                              ),
                                            )
                                          : widget.note.kategori == 4
                                              ? Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Text(
                                                        "+ ${widget.note.tutar} TL",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 22)),
                                                  ),
                                                )
                                              : widget.note.kategori == 5
                                                  ? Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                          child: Text(
                                                              "+ ${widget.note.tutar} TL",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      22)),
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
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      22)),
                                                        )
                                                      : Text(""),
                            ],
                          ),
                          buildSizedBox(),
                          Row(
                            children: <Widget>[
                              Text(
                                "Tarih: ",
                                style: TextStyle(
                                    color: HexColor('#E37B1F'), fontSize: 23),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "${widget.note.dateTime}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          buildSizedBox(),
                          Row(
                            children: <Widget>[
                              Text(
                                "Kategori: ",
                                style: TextStyle(
                                    color: HexColor('#E37B1F'), fontSize: 23),
                              ),
                              Spacer(),
                              widget.note.kategori == 1
                                  ? Text(
                                      "Yemek",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    )
                                  : widget.note.kategori == 2
                                      ? Text("Eğlence",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20))
                                      : widget.note.kategori == 3
                                          ? Text("Araç",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20))
                                          : widget.note.kategori == 4
                                              ? Text("Aylık",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20))
                                              : widget.note.kategori == 5
                                                  ? Text("Fazla Mesai Ücreti",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20))
                                                  : widget.note.kategori == 6
                                                      ? Text("Avanta",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20))
                                                      : Text(""),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    print("Okay");
                    setState(() {
                      favoriGuncelle(widget.note.note_id, 1);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Kayıt favorilere eklendi!"),
                        duration: Duration(seconds: 3),
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Center(
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.bookmark_border_outlined,
                            size: 60,
                            color: Colors.white,
                          ),
                          Spacer(),
                          Text(
                            "Favorilere Ekle",
                            style: GoogleFonts.inter(
                                color: Colors.white, fontSize: 22),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                    ),
                    height: device_height * 0.1,
                    width: device_width * 0.7,
                    decoration: BoxDecoration(
                      color: HexColor('#00478d'),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 2, color: HexColor('#E37B1F')),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox() => SizedBox(
        height: 20,
      );
}
