import 'package:flutter/material.dart';
import 'package:navigationdroar/email.dart';
import 'package:navigationdroar/nextpage.dart';
import 'package:navigationdroar/phone.dart';
import 'package:navigationdroar/settings.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Project',
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ---------------------- navigation drawer -----------------

      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Ariful Islam'),
              accountEmail: Text('arifulhc@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset('images/rt.jpg'),
                ),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/images.jpg'),
                      fit: BoxFit.cover)),
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text('Next Page'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Nextpage()));
              },
            ),

            ListTile(
              leading: Icon(Icons.call),
              title: Text('Phone'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Phone()));
              },
            ),

            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Email()));
              },
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
              },
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text('About'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
              },
            ),

          ],
        ),
      ),

      // ---------------------- app bar-----------------

      appBar: AppBar(
        titleSpacing: 100,
        title: Text('Welcome to Home Page'),
        backgroundColor: Colors.indigoAccent,
      ),

      // ---------------------- body -----------------

      body: Center(
        child: Text('This is a Home Pasge'),
      ),

      // ---------------------- floating action button -----------------

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back),
        tooltip: 'go next page',
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Nextpage()));
        },
      ),
    );
  }
}
