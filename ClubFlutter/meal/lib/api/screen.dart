import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal/api/provider/provider.dart';

import './test.dart';

class ApisScreen extends StatefulWidget {
  const ApisScreen({Key? key}) : super(key: key);
  @override
  _ApisScreenState createState() {
    return new _ApisScreenState();
  }
}

class _ApisScreenState extends State<ApisScreen> {

  List<Apis> apis = [];
  bool isLoading = true;
  ApisProviders apisProvider = ApisProviders();

  Future initApis() async {
    apis = await apisProvider.getApis();
  }

  @override
  void initState() {
    super.initState();
    initApis().then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("왜 안나오노"),
      ),
      body: isLoading ? Center(child: const CircularProgressIndicator(),) :
      GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
      ),
          itemCount: apis.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(apis[index].one),
                  Text(apis[index].two),
                ],
              ),
            );
          }),
    );
  }
}