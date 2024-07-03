

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool? x=true;
 String? g="";
 String? dd="web";
  TextEditingController t1= TextEditingController();
  TextEditingController t2= TextEditingController();
  TextEditingController t3= TextEditingController();

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Column(

          children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: t1,
              decoration: InputDecoration(
                labelText: "Text 1",
                hintText: "Enter your User name",

                border: OutlineInputBorder(
                  borderRadius:BorderRadius.all(Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),

            SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
               controller: t2,
                // obscureText: true,
                decoration: InputDecoration(
                  labelText: "Text 2",
                  hintText: "Enter your Text",
                  icon: Icon(Icons.group),
                  border: OutlineInputBorder(
                    borderRadius:BorderRadius.all(Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),

Row(
  children: [
    Checkbox(value: x,
        onChanged: (bool? value ){
      setState(() {
        x=value;
        var snackBar = SnackBar(content: Text('True'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
        },

    ),
    Text("Java"),
  ],
),


            Row(
              children: [
                Radio <String>(value: 'femal', groupValue: g, onChanged: (String? value){
                  setState(() {
                    g=value;
                    var snackBar = SnackBar(content: Text('Female'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  });
                }),
                 Text("Female")
              ],
            ),

            Row(
              children: [
                Radio <String>(value: 'male', groupValue: g, onChanged: (String? value){
                  setState(() {
                    g=value;
                    var snackBar = SnackBar(content: Text('Male'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  });
                }),
                Text("Male")
              ],
            ),

            Row(
              children: [
                DropdownButton(
                    value: dd,
                    items: <DropdownMenuItem <String>>[
                    DropdownMenuItem <String>(
                        child:Text("Web"),
                        value: "web",
                    ),
                      DropdownMenuItem <String>(
                        child:Text("Images"),
                        value: "images",
                      ),
                      DropdownMenuItem <String>(
                        child:Text("News"),
                        value: "news",
                      ),
                    ],
                    onChanged: (String? value){
                      setState(() {
                        dd=value;
                        var snackBar = SnackBar(content: Text(dd.toString()));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                    }
                ),
              ],
            ),




            SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                readOnly: true,
                controller: t3,
                // obscureText: true,
                decoration: InputDecoration(
                  labelText: "Result",
                  hintText: "Result",
                  border: OutlineInputBorder(
                    borderRadius:BorderRadius.all(Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),


            SizedBox(
              height: 5,
            ),

            Row(
              children: [
                Container(

                 child:  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),

                    onPressed: () {
                      int x=int.parse(t1.text);
                      int y=int.parse(t2.text);
                      int sum= x+y;

                      // t3.text=t1.text+t2.text;

                      t3.text=sum.toString();

                      SnackBar s=SnackBar(content: Text(sum.toString()),

                      );
                      ScaffoldMessenger.of(
                          context).showSnackBar(s);

                    },
                    child: Text('Submit'),



                  ),




                ),

                Container(

                  child:  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),

                    onPressed: () {
                      int x=int.parse(t1.text);
                      int y=int.parse(t2.text);
                      int sum= x-y;

                      // t3.text=t1.text+t2.text;

                      t3.text=sum.toString();

                      SnackBar s=SnackBar(content: Text(sum.toString()),

                      );
                      ScaffoldMessenger.of(
                          context).showSnackBar(s);

                    },
                    child: Text('Submit'),



                  ),




                ),

                Container(

                  child:  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),

                    onPressed: () {
                      int x=int.parse(t1.text);
                      int y=int.parse(t2.text);
                      int sum= x*y;

                      // t3.text=t1.text+t2.text;

                      t3.text=sum.toString();

                      SnackBar s=SnackBar(content: Text(sum.toString()),

                      );
                      ScaffoldMessenger.of(
                          context).showSnackBar(s);

                    },
                    child: Text('Submit'),



                  ),




                ),

                Container(

                  child:  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),

                    onPressed: () {
                      int x=int.parse(t1.text);
                      int y=int.parse(t2.text);
                      double sum= x/y;

                      // t3.text=t1.text+t2.text;

                      t3.text=sum.toString();

                      SnackBar s=SnackBar(content: Text(sum.toString()),

                      );
                      ScaffoldMessenger.of(
                          context).showSnackBar(s);

                    },
                    child: Text('Submit'),



                  ),

                ),
              ],
            ),

          ],
        ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
