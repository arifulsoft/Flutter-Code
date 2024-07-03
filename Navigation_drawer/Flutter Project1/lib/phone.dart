import 'package:flutter/material.dart';
import 'package:navigationdroar/main.dart';


class Phone extends StatelessWidget {
  const Phone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyPhone(),
    );
  }
}

class MyPhone extends StatefulWidget {
  const MyPhone({super.key});

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 100,
        title: Text('Welcome to Phone Page'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: Text('This is a Phone Page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back),
        tooltip: 'go home',
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
          // Navigator.pop(context); ( kaj kora ai ta )
        },
      ),
    );
  }
}

