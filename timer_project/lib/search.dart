import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:provider/provider.dart';
import 'package:timer_project/provider/provider.dart';
import './database/db.dart';
import 'package:toast/toast.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _AlarmState();
}

class _AlarmState extends State<Search> {
  var user;

  // List<Map<String, dynamic>> _journals = [];
  // void _refreshJournals() async {
  //   final data = await SQLHelper.getItems();
  //   setState(() {
  //     _journals = data;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      user = Provider.of<Userinfos>(context, listen: false);
    });
  }

  String completion = '저장완료되었습니다.';
  String chprofile = '';
  String chname = '';
  String chname1 = '';
  String chname2 = '';
  String chlevel = '';
  int lengthing = 0;
  String inputname = '';
  bool isLoading = false;
  bool getString = false;
  bool isHaving = false;
  bool isSave = false;
  bool isJudge = false;
  final _nicknameTextEditController = TextEditingController();

  void saveprofile() {
    setState(() {
      isJudge = true;
    });
    user.inputname(chname1);
    user.inputrole(chname2);
    user.inputlevel(chlevel);
    user.inputjudgement(isJudge);
  }

  Future<List<Object>> lovingcats(String namings) async {
    ToastContext().init(context);
    setState(() {
      isJudge = false;
    });
    try {
      int count = 0;
      int procount = 0;
      int levelcount = 0;
      setState(() {
        isLoading = true;
      });
      setState(() {
        chname = '';
        chname1 = '';
        chname2 = '';
        chlevel = '';
      });

      final response = await http.Client().get(Uri.parse(
          'https://maplestory.nexon.com/N23Ranking/World/Total?c=${namings}&w=0'));
      // Status Code 200 means response has been received successfully
      if (response.statusCode == 200) {
        // Getting the html document from the response
        var document = parser.parse(response.body);
        final names = document.querySelectorAll('.search_com_chk .left');
        final profileimgs =
            document.querySelectorAll('.search_com_chk .left .char_img img');
        final levels = document.querySelectorAll('.search_com_chk td');

        if (levels == ' ' || levels == '') {
          setState(() {
            isHaving = false;
            isSave = false;
          });
        }
        // 요소들 출력
        for (var name in names) {
          count++;
          if (count >= 2) {
            chname = name.text;
          }
        }
        for (var profile in profileimgs) {
          procount++;
          if (procount > 1) {
            break;
          }
          chprofile = (profile.attributes['src'])!;
        }
        for (var level in levels) {
          levelcount++;
          if (levelcount == 3) {
            chlevel = level.text;
          }
        }
        if (chname == '') {
          setState(() {
            isHaving = false;
            isSave = false;
          });
        }
        try {
          var responseString1 =
              document.getElementsByClassName('.search_com_chk');
          setState(() {
            isLoading = false;
            getString = true;
          });
          chname = chname.trimLeft();
          void countlength() {
            List<String> searchKeywords =
                List<String>.generate(chname.length, (index) => chname[index]);
            for (int i = 0; i <= chname.length; i++) {
              if (chname[i] != ' ') {
                lengthing++;
              } else if (chname.length == 0) {
              } else {
                break;
              }
            }
          }

          user.inputprofile(chprofile);
          countlength();
          chname1 = chname.substring(0, lengthing - 1);
          chname2 =
              chname.substring(lengthing, chname.length).trimLeft().trimRight();
          chlevel = chlevel.trimLeft();
          lengthing = 0;
          if (chname1 != '') {
            setState(() {
              isHaving = true;
            });
          } else {
            setState(() {
              isHaving = false;
            });
          }
          return responseString1;
        } catch (e) {
          setState(() {});
          return ['', '', 'ERROR!'];
        }
      } else {
        setState(() {});
        return ['', '', 'ERROR: ${response.statusCode}.'];
      }
    } catch (e) {
      setState(() {});
      return ['', '', 'ERROR:.'];
    }
    // Getting the response from the targeted url
  }

  // Future<void> _addItem() async {
  //   await SQLHelper.createItem(chname1, chname2, chlevel);
  // }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<Userinfos>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Search User", style: TextStyle(fontSize: 30)),
          centerTitle: true,
        ),
        body: isLoading
            ? loadings()
            : getString
                ? isHaving
                    ? Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(chprofile),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(chname1,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  width: 30,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(chname2,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  width: 30,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(chlevel,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  width: 30,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 300,
                                  child: TextField(
                                    controller: _nicknameTextEditController,
                                    decoration: InputDecoration(
                                      labelText: 'Nickname',
                                      hintText: '검색할 캐릭터의 닉네임 입력',
                                      labelStyle:
                                          TextStyle(color: Colors.redAccent),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.redAccent),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.redAccent),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: (text) {
                                      setState(() {
                                        inputname = text;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      lovingcats(
                                          _nicknameTextEditController.text);
                                    },
                                    child: Text("검색")),
                                SizedBox(
                                  width: 25,
                                ),
                                ElevatedButton(
                                  child: Text("프로필 저장하기"),
                                  onPressed: () {
                                    setState(() {
                                      isSave = true;
                                    });
                                    showToast('캐릭터가 ' + completion,
                                        duration: 2, gravity: 1);
                                    saveprofile();
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    : errorpage(user)
                : mainsearch());
  }

  Column errorpage(var user) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('없는 유저명 입니다!'),
          ],
        ),
        SizedBox(height: 50),
        Container(
          width: 300,
          child: TextField(
            controller: _nicknameTextEditController,
            decoration: InputDecoration(
              labelText: 'Nickname',
              hintText: '검색할 캐릭터의 닉네임 입력',
              labelStyle: TextStyle(color: Colors.redAccent),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(width: 1, color: Colors.redAccent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(width: 1, color: Colors.redAccent),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: (text) {
              setState(() {
                inputname = text;
              });
            },
          ),
        ),
        SizedBox(height: 50),
        ElevatedButton(
            onPressed: () {
              lovingcats(inputname);
            },
            child: Text("검색")),
      ],
    );
  }

  Center mainsearch() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300,
            child: TextField(
              controller: _nicknameTextEditController,
              decoration: InputDecoration(
                labelText: 'Nickname',
                hintText: '검색할 캐릭터의 닉네임 입력',
                labelStyle: TextStyle(color: Colors.redAccent),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(width: 1, color: Colors.redAccent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(width: 1, color: Colors.redAccent),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: (text) {
                setState(() {
                  inputname = text;
                });
              },
            ),
          ),
          SizedBox(height: 50),
          ElevatedButton(
              onPressed: () {
                lovingcats(inputname);
              },
              child: Text("검색"))
        ],
      ),
    );
  }

  Center searchusers(var user) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(chprofile),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(chname1,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                width: 30,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(chname2,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                width: 30,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(chlevel,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                width: 30,
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                child: TextField(
                  controller: _nicknameTextEditController,
                  decoration: InputDecoration(
                    labelText: 'Nickname',
                    hintText: '검색할 캐릭터의 닉네임 입력',
                    labelStyle: TextStyle(color: Colors.redAccent),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(width: 1, color: Colors.redAccent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(width: 1, color: Colors.redAccent),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (text) {
                    setState(() {
                      inputname = text;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    lovingcats(_nicknameTextEditController.text);
                  },
                  child: Text("검색")),
              SizedBox(
                width: 25,
              ),
              ElevatedButton(
                child: Text("프로필 저장하기"),
                onPressed: () {
                  setState(() {
                    isSave = true;
                  });
                  saveprofile();
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Column loadings() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
          ],
        )
      ],
    );
  }

  void showToast(String msg, {required int duration, required int gravity}) {
    Toast.show(msg, duration: duration, gravity: gravity);
  }
}
