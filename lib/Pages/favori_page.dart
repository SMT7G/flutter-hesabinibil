import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hesabini_bil_demo/Hesapdao.dart';
import 'package:hexcolor/hexcolor.dart';

import '../notes.dart';

class favori_page extends StatefulWidget {
  const favori_page({Key? key}) : super(key: key);

  @override
  State<favori_page> createState() => _favori_pageState();
}

class _favori_pageState extends State<favori_page> {
  Future<List<Notes>> favorileriGetir() async {
    var liste = await Hesapdao().favoriGetir(1);
    return liste;
  }

  Future<void> favoriGuncelle(int id, String tutar) async {
    await Hesapdao().favoriGuncelle(tutar, id);
  }

  void _showMessage() {
    Fluttertoast.showToast(
      msg: "Herhangi bir kayıdı silmek için üstüne dokunun!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  void initState() {
    super.initState();
    _showMessage();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kaydedilenler"),
      ),
      body: FutureBuilder<List<Notes>>(
        future: favorileriGetir(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var NotesListesi = snapshot.data;
            return ListView.builder(
              itemCount: NotesListesi?.length,
              itemBuilder: (context, index) {
                var note = NotesListesi?[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                      print("Silindi");
                      setState(() {
                        favoriGuncelle(0, "${note?.tutar}");
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Kayıt başarılı bir şekilde silindiiiii!"),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    tileColor: note?.kategori == 1
                        ? HexColor('#dc3545')
                        : note?.kategori == 2
                            ? HexColor('#dc3545')
                            : note?.kategori == 3
                                ? HexColor('#dc3545')
                                : note?.kategori == 4
                                    ? HexColor('#28a745')
                                    : note?.kategori == 5
                                        ? HexColor('#28a745')
                                        : note?.kategori == 6
                                            ? HexColor('#28a745')
                                            : Colors.red,
                    title: note?.kategori == 1
                        ? Text("- ${note?.tutar} TL")
                        : note?.kategori == 2
                            ? Text("- ${note?.tutar} TL")
                            : note?.kategori == 3
                                ? Text("- ${note?.tutar} TL")
                                : note?.kategori == 4
                                    ? Text("+ ${note?.tutar} TL")
                                    : note?.kategori == 5
                                        ? Text("+ ${note?.tutar} TL")
                                        : note?.kategori == 6
                                            ? Text("+ ${note?.tutar} TL")
                                            : Text(""),
                    subtitle: Text(
                      "${note?.dateTime}",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: note?.kategori == 1
                        ? Text(
                            "Yemek",
                          )
                        : note?.kategori == 2
                            ? Text(
                                "Eğlence",
                              )
                            : note?.kategori == 3
                                ? Text(
                                    "Araç",
                                  )
                                : note?.kategori == 4
                                    ? Text(
                                        "Aylık",
                                      )
                                    : note?.kategori == 5
                                        ? Text(
                                            "Fazla Mesai Ücreti",
                                          )
                                        : note?.kategori == 6
                                            ? Text(
                                                "Avanta",
                                              )
                                            : Text(""),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }
}
