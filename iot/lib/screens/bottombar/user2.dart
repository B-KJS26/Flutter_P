import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot/screens/bottombar/kakao/kakao_login.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_user.dart';
import 'package:iot/screens/bottombar/kakao/main_view_model.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:iot/screens/bottombar/user.dart';

class Usert extends StatefulWidget {
  const Usert({super.key});

  @override
  State<Usert> createState() => _UsertState();
}

class _UsertState extends State<Usert> {
  var viewModel = MainViewModel(KakaoLogin());
  @override
  void initState() {
    super.initState();
    KakaoSdk.init(nativeAppKey: 'fa1ebc5906cb5174151d65be8a937486');
  }
  bool isLogin = false;
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
            Container(
              child: Row(
                children: [
                  SizedBox(
                    width: 30.w,
                  ),
                  Container(
                    width: 100.w,
                    height: 100.h,
                    child: isLogin
                        ? Image.network(viewModel
                                .user?.kakaoAccount?.profile?.profileImageUrl ??
                            '')
                        : Image.asset('images/loging.png'),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        // ignore: unnecessary_string_interpolations
                        isLogin
                            ? '${viewModel.user?.kakaoAccount?.profile?.nickname ?? ''}님'
                            : ' ',
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        isLogin ? '보유 마일리지' : '',
                        style: TextStyle(
                          fontSize: 20.sp,
                        ),
                      ),
                      isLogin
                          ? Row(
                              children: [
                                Icon(Icons.currency_exchange),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text('n원'),
                              ],
                            )
                          : Text(''),
                    ],
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await viewModel.login();
                setState(() {
                  isLogin = true;
                });
              },
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () async {
                await viewModel.logout();
                isLogin = false;
                Navigator.pop(context);
              },
              child: const Text('Logout'),
            ),
            SizedBox(
              height: 50.h,
            ),
            Container(
              width: 300.w,
              height: 300.h,
              child: Image.asset("images/realearth.png"),
            ),
          ],
        ),
      ),
    );
  }
}
