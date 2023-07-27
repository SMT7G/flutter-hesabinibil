import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hesabini_bil_demo/Hesapdao.dart';
import 'package:hesabini_bil_demo/Pages/detail_page.dart';
import 'package:hesabini_bil_demo/Pages/favori_page.dart';
import 'package:hesabini_bil_demo/Process_Page/Process_Page.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import '../notes.dart';

class Page1 extends StatefulWidget {
  int kategori_id;
  String dateTime;
  String tutaar;
  int id;

  Page1({
    required this.kategori_id,
    required this.dateTime,
    required this.tutaar,
    required this.id,
  });

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  DateTime _dateTime = DateTime(2003, 6, 13);
  DateTime _dateTime2 = DateTime.now();

  //Future<void> favorileriGetir() async {
  //  var liste = await Hesapdao().tumVeriler();
  //  setState(() {
  //    gelenListe = liste;
  //  });
  //} //

  Future<List<Notes>> son10Veri() async {
    var liste = await Hesapdao().son10veri();
    return liste;
  }

  Future<List<Notes>> tarihArasi(String date1, String date2) async {
    var liste = await Hesapdao().tarihArasi(date1, date2);
    return liste;
  }

  Future<void> favoriGuncelle(int note_id, int id) async {
    await Hesapdao().favoriGuncelle(note_id, id);
  }

  Future<void> NoteSil(int note_id) async {
    await Hesapdao().NoteSil(note_id);
  }

  void sil(int id) {
    NoteSil(id);
  }

  void _dateTimePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime(2003, 6, 13),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  void _dateTimePicker2() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    ).then((value) {
      setState(() {
        _dateTime2 = value!;
      });
    });
  }

  //String tarih = DateFormat.yMd().format(DateTime.now());

  @override
  void initState() {
    super.initState();
    son10Veri();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: _dateTimePicker,
          child: Row(
            children: [
              appBarTheme(_dateTime),
              SizedBox(
                width: 3,
              ),
              appBarTheme(_dateTime2),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => favori_page(),
                ));
              },
              icon: Icon(
                FontAwesomeIcons.bookmark,
                color: Colors.white,
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
      body: FutureBuilder<List<Notes>>(
        future: tarihArasi(_dateTime.toString(), _dateTime2.toString()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var NotesListesi = snapshot.data;
            return ListView.builder(
              itemCount: NotesListesi!.length,
              itemBuilder: (context, index) {
                var note = NotesListesi[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Slidable(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => detail_page(note: note),
                            ));
                      },
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tileColor: note.kategori == 1
                          ? HexColor('#dc3545')
                          : note.kategori == 2
                              ? HexColor('#dc3545')
                              : note.kategori == 3
                                  ? HexColor('#dc3545')
                                  : note.kategori == 4
                                      ? HexColor('#28a745')
                                      : note.kategori == 5
                                          ? HexColor('#28a745')
                                          : note.kategori == 6
                                              ? HexColor('#28a745')
                                              : Colors.red,
                      title: note.kategori == 1
                          ? Text("- ${note.tutar} TL")
                          : note.kategori == 2
                              ? Text("- ${note.tutar} TL")
                              : note.kategori == 3
                                  ? Text("- ${note.tutar} TL")
                                  : note.kategori == 4
                                      ? Text("+ ${note.tutar} TL")
                                      : note.kategori == 5
                                          ? Text("+ ${note.tutar} TL")
                                          : note.kategori == 6
                                              ? Text("+ ${note.tutar} TL")
                                              : Text(""),
                      subtitle: Text(
                        "${note.dateTime}",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: note.kategori == 1
                          ? Text(
                              "Yemek",
                            )
                          : note.kategori == 2
                              ? Text(
                                  "Eğlence",
                                )
                              : note.kategori == 3
                                  ? Text(
                                      "Araç",
                                    )
                                  : note.kategori == 4
                                      ? Text(
                                          "Aylık",
                                        )
                                      : note.kategori == 5
                                          ? Text(
                                              "Fazla Mesai Ücreti",
                                            )
                                          : note.kategori == 6
                                              ? Text(
                                                  "Avanta",
                                                )
                                              : Text(""),
                    ),
                    endActionPane: ActionPane(
                      motion: BehindMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            setState(() {
                              sil(note.note_id);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text("Kayıt başarılı bir şekilde silindi!"),
                                duration: Duration(seconds: 3),
                              ),
                            );
                          },
                          backgroundColor: Colors.white,
                          icon: Icons.delete,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          autoClose: true,
                          foregroundColor: Colors.red,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        SlidableAction(
                          onPressed: (context) {
                            setState(() {
                              favoriGuncelle(note.note_id, 1);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Kayıt favorilere eklendi!"),
                                duration: Duration(seconds: 3),
                              ),
                            );
                          },
                          backgroundColor: Colors.white,
                          icon: Icons.bookmark_border_outlined,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          autoClose: true,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Process_Page(),
              ));
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.amber,
          size: 30,
        ),
      ),
    );
  }

  Container appBarTheme(DateTime date) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: Colors.black),
        color: HexColor('#E37B1F'),
      ),
      child: Text(
        "< ${date.year}-${date.day}-${date.month} >",
        style: TextStyle(fontSize: 19),
      ),
    );
  }
}
