import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

class email_page extends StatefulWidget {
  const email_page({Key? key}) : super(key: key);

  @override
  State<email_page> createState() => _email_pageState();
}

class _email_pageState extends State<email_page> {
  Future sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    final serviceId = "service_eqe4t39";
    final templateId = "template_j82anip";
    final userId = 'e52gIzPd-A-WSjpij';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'to_email': 'other.email@gmail.com',
          'user_subject': subject,
          'user_message': message,
        }
      }),
    );
    print(response.body);
  }

  var tf_name = new TextEditingController();
  String name = "";
  var tf_email = new TextEditingController();
  String mail = "";
  var tf_subject = new TextEditingController();
  String subject = "";
  var tf_message = new TextEditingController();
  String message = "";

  void _updateText(String veri, value) {
    setState(() {
      veri = value;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bize Ulaşın"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Hesabını Bil",
                      style: GoogleFonts.adventPro(fontSize: 50),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: tf_name,
                      onChanged: (value) {
                        _updateText(name, value);
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: "Ad-Soyad",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: HexColor('#E37B1F'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: tf_email,
                      onChanged: (value) {
                        _updateText(mail, value);
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        labelText: "Mail",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: tf_subject,
                      onChanged: (value) {
                        _updateText(subject, value);
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.subject),
                        labelText: "Konu",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: tf_message,
                      onChanged: (value) {
                        _updateText(message, value);
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.message),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 75),
                        labelText: "Mesaj",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        sendEmail(
                          name: tf_name.text,
                          email: tf_email.text,
                          subject: tf_subject.text,
                          message: tf_message.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                "Mail başarılı bir şekilde gönderilmiştir"),
                            duration: Duration(seconds: 3),
                          ),
                        );
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Mail Gönder",
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 80, vertical: 20),
                          backgroundColor: HexColor('#00478d')),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
