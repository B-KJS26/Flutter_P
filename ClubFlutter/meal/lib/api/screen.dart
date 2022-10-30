import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal/api/provider/provider.dart';

import './test.dart';

class ApisScreen extends StatefulWidget {
  const ApisScreen({Key? key}) : super(key: key);

  @override
  State<ApisScreen> createState() => _ApisScreenState();
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
    initApis().then((_){
    setState(() {
      isLoading = false;
    });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading ? const Center(child: CircularProgressIndicator(), ) : 
      GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20
      ),
      itemCount: apis.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Text(apis[index].one),
            Text(apis[index].two)
          ]),
        );
      },),
    );
  }
}