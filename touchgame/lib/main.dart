import 'package:flutter/material.dart';

void main() {
  runApp(const Touchgame());
}

class Touchgame extends StatelessWidget {
  const Touchgame({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Touch Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Mainpages(title: 'Touch Game'),
    );
  }
}

class Mainpages extends StatefulWidget {
  const Mainpages({super.key, required this.title});
  final String title;
  @override
  State<Mainpages> createState() => _MainpagesState();
}

class _MainpagesState extends State<Mainpages> {
  int counter = 9999999;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$counter'
          ),
          ElevatedButton(onPressed: () {
            setState(() {
              counter--;
              if(counter == 0) {
                AlertDialog(title: Text('알이 깨졌습니다!'),);
              }
            });
          }, child: Image(image: AssetImage('assets/egg.png'),
          color: Colors.white,)),
        ]
      ), 
      ),
    );
  }
}
