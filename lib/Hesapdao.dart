import 'package:hesabini_bil_demo/VeritabaniYoneticisi.dart';
import 'package:hesabini_bil_demo/notes.dart';

class Hesapdao {
  Future<List<Notes>> tumVeriler() async {
    var db = await VeritabaniYoneticisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM Notes");
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Notes(
        id: satir["id"],
        dateTime: satir["dateTime"],
        kategori: satir["kategori"],
        tutar: satir["tutar"],
      );
    });
  }

  Future<List<Notes>> son10veri() async {
    var db = await VeritabaniYoneticisi.veritabaniErisim();
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM Notes ORDER BY tutar DESC LIMIT 10");
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Notes(
        id: satir["id"],
        dateTime: satir["dateTime"],
        kategori: satir["kategori"],
        tutar: satir["tutar"],
      );
    });
  }

  Future<void> NoteEkle(
    String dateTime,
    String tutar,
    int kategori,
    int id,
  ) async {
    var db = await VeritabaniYoneticisi.veritabaniErisim();
    var bilgiler = Map<String, dynamic>();

    bilgiler["dateTime"] = dateTime;
    bilgiler["kategori"] = kategori;
    bilgiler["tutar"] = tutar;

    await db.insert("Notes", bilgiler);
  }

  Future<List<Notes>> favoriGetir(int id) async {
    var db = await VeritabaniYoneticisi.veritabaniErisim();
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM Notes WHERE id = '$id'");

    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Notes(
        id: satir["id"],
        dateTime: satir["dateTime"],
        kategori: satir["kategori"],
        tutar: satir["tutar"],
      );
    });
  }

  Future<void> favoriGuncelle(String tutar, int id) async {
    var db = await VeritabaniYoneticisi.veritabaniErisim();
    var bilgiler = Map<String, dynamic>();

    bilgiler["id"] = id;

    await db.update("Notes", bilgiler, where: "tutar = ?", whereArgs: [tutar]);
  }

  Future<void> NoteSil(String tutar) async {
    var db = await VeritabaniYoneticisi.veritabaniErisim();
    await db.delete("Notes", where: "tutar = ?", whereArgs: [tutar]);
  }
}
