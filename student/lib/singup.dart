import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:student/main.dart';

List<Student> objectsFromJson(String str) =>
    List<Student>.from(json.decode(str).map((x) => Student.fromJson(x)));
String objectsToJson(List<Student> data) =>
    json.encode(List<Student>.from(data.map((x) => x.tojson())));

class Student {
  int? id;
  String? name;
  String? email;
  String? round;
  Student(
      {required this.id,
      required this.name,
      required this.email,
      required this.round});
  factory Student.fromJson(Map<String, dynamic> json) => Student(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      round: json['round']);
  Map<String, dynamic> tojson() {
    return {"id": id, "name": name, "email": email, "round": round};
  }
}

class singup extends StatefulWidget {
  const singup({super.key});

  @override
  State<singup> createState() => _singupState();
}

class _singupState extends State<singup> {
  TextEditingController _id = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _round = TextEditingController();

  Future<Student> singupStudent() async {
    Student s = Student(
        id: int.parse(_id.text),
        name: _name.text,
        email: _email.text,
        round: _round.text);
    final response = await http.post(
        Uri.parse('http://192.168.0.114:8080/insert'),
        body: jsonEncode(s.tojson()),
        headers: {"content-type": "application/json"});
    if (response.statusCode == 200) {
      return Student.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Singup"),
        ),
        body: Form(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: _id,
                    decoration: InputDecoration(
                      labelText: 'ID',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: _name,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: _email,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: _round,
                    decoration: InputDecoration(
                      labelText: 'Round',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  child: Text("sign Up"),
                  onPressed: () async {
                    Student st = await singupStudent();
                    if (st != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                    } else if (_id.text.length == 0) {
                      SnackBar snk =
                          SnackBar(content: Text("Enter correct info"));
                      ScaffoldMessenger.of(context).showSnackBar(snk);
                    }

                  },

                ),
              ],
            ),
          ),
        ));
  }
}
