import 'package:flutter/material.dart';

class Tb3 extends StatefulWidget {
  const Tb3({Key? key}) : super(key: key);

  @override
  State<Tb3> createState() => _Tb3State();
}

class _Tb3State extends State<Tb3> {
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

  void _timePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }

  TimeOfDay _timeOfDay = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
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
                    padding: const EdgeInsets.all(14.0),
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
                              width: 250,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black87),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: PopupMenuButton(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Kategori Seç!",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    child: Text("Nakit"),
                                  ),
                                  PopupMenuItem(
                                    child: Divider(
                                      color: Colors.black,
                                      height: 2,
                                      thickness: 2,
                                    ),
                                  ),
                                  PopupMenuItem(
                                    child: Text("Banka Hesapları"),
                                  ),
                                  PopupMenuItem(
                                    child: Divider(
                                      color: Colors.black,
                                      height: 2,
                                      thickness: 2,
                                    ),
                                  ),
                                  PopupMenuItem(
                                    child: Text("Kredi Kartı"),
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
                          onPressed: () {},
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
