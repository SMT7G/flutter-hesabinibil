import 'package:hesabini_bil_demo/VeritabaniYoneticisi.dart';
import 'package:hesabini_bil_demo/notes.dart';

class Hesapdao {
  Future<List<Notes>> tumVeriler() async {
    var db = await VeritabaniYoneticisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM Notes");
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Notes(
        note_id: satir["note_id"],
        id: satir["id"],
        dateTime: satir["dateTime"],
        kategori: satir["kategori"],
        tutar: satir["tutar"],
      );
    });
  }

  Future<List<Notes>> tarihArasi(String date1, String date2) async {
    var db = await VeritabaniYoneticisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM Notes WHERE strftime('%Y-%m-%d', substr(datetime, 7, 4) || '-' || substr(datetime, 4, 2) || '-' || substr(datetime, 1, 2)) BETWEEN '${date1}' AND '${date2}'");
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Notes(
        note_id: satir["note_id"],
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
        await db.rawQuery("SELECT * FROM Notes ORDER BY note_id DESC LIMIT 10");
    return List.generate(maps.length, (index) {
      var satir = maps![index];
      return Notes(
        note_id: satir["note_id"],
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
    List<Map<String, dynamic>> maps = await db
        .rawQuery("SELECT * FROM Notes WHERE id = ${id} ORDER BY rowid DESC");

    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Notes(
        note_id: satir["note_id"],
        id: satir["id"],
        dateTime: satir["dateTime"],
        kategori: satir["kategori"],
        tutar: satir["tutar"],
      );
    });
  }

  Future<void> favoriGuncelle(int note_id, int id) async {
    var db = await VeritabaniYoneticisi.veritabaniErisim();
    var bilgiler = Map<String, dynamic>();

    bilgiler["id"] = id;

    await db
        .update("Notes", bilgiler, where: "note_id = ?", whereArgs: [note_id]);
  }

  Future<void> NoteSil(int note_id) async {
    var db = await VeritabaniYoneticisi.veritabaniErisim();
    await db.delete("Notes", where: "note_id = ?", whereArgs: [note_id]);
  }
}
