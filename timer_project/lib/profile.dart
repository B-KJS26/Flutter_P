import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_project/provider/provider.dart';
import './database/db.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // List<Map<String, dynamic>> _journals = [];
  // // This function is used to fetch all data from the database
  // void _refreshJournals() async {
  //   final data = await SQLHelper.getItems();
  //   setState(() {
  //     _journals = data;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _refreshJournals(); // Loading the diary when the app starts
  // }

  // void _deleteItem(int id) async {
  //   await SQLHelper.deleteItem(id);
  //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //     content: Text('Successfully deleted a journal!'),
  //   ));
  //   _refreshJournals();
  // }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<Userinfos>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved Profile", style: TextStyle(fontSize: 30)),
        centerTitle: true,
      ),
      body: user.judgement
          ? profile(user)
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('아직 저장된 캐릭터가 없습니다!')],
                )
              ],
            ),
      // ListView.builder(
      //   itemCount: _journals.length,
      //   itemBuilder: (context, index) => Card(
      //     color: Colors.orange[200],
      //     margin: const EdgeInsets.all(15),
      //     child: ListTile(
      //         title: Text(_journals[index]['name']),
      //         subtitle: Text(_journals[index]['role']),
      //         trailing: SizedBox(
      //           width: 100,
      //           child: Row(
      //             children: [
      //               IconButton(
      //                 icon: const Icon(Icons.delete),
      //                 onPressed: () => _deleteItem(_journals[index]['id']),
      //               ),
      //             ],
      //           ),
      //         )),
      //   ),
      // ),
    );
  }

  Column profile(Userinfos user) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '저장된 유저',
          style: TextStyle(fontSize: 30),
        ),
        Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.network(user.profile),
                  SizedBox(height: 25),
                  Text('닉네임 : ${user.name}'),
                  Text('직업 : ${user.role}'),
                  Text('레벨 : ${user.level}')
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
