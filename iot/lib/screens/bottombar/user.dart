import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot/screens/bottombar/kakao/kakao_login.dart';
import 'package:iot/screens/bottombar/user2.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_user.dart';
import 'package:iot/screens/bottombar/kakao/main_view_model.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';

class User extends StatefulWidget {
  const User({super.key});
  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  void initState() {
    super.initState();
    KakaoSdk.init(nativeAppKey: 'fa1ebc5906cb5174151d65be8a937486');
  }
  
  final viewModel = MainViewModel(KakaoLogin());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 19.w, top: 14.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Yu",
                    style: TextStyle(
                        fontSize: 30.sp, color: const Color(0xff18A6F5)),
                  ),
                  Text(
                    "uri",
                    style: TextStyle(
                        fontSize: 30.sp, color: const Color(0xff17C81E)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 80.h,
            ),
            Column(
              children: [
                Text(
                  '너, 나, 우리',
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff18A6F5),
                  ),
                ),
                Text(
                  '모두가 함께 만들어가는',
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '깨끗한 세상',
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff17C81E),
                  ),
                ),
                SizedBox(
                  height: 70.h,
                ),
                Container(
                  width: 230.w,
                  height: 60.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellow,
                      onPrimary: Colors.black,
                      textStyle: TextStyle(
                        fontSize: 17.sp,
                      ),
                    ),
                    onPressed: () async {
                      await viewModel.login();
                      var changing =
                          // ignore: unnecessary_string_interpolations
                          '${viewModel.user?.kakaoAccount?.profile?.nickname ?? ''}';
                      if(changing != null) {
                        Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Usert())
                        );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          child: Image.asset('images/kakao.png'),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        const Text('카카오톡으로 로그인'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  width: 300.w,
                  height: 300.h,
                  child: Image.asset("images/nonearth.png"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
