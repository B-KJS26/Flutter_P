import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved Profile", style: TextStyle(fontSize: 30)),
        centerTitle: true,
      ),
      body: Container(
        child: Column(),
      ),
    );
  }
}
