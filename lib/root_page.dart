import 'package:flutter/material.dart';
import 'package:instagram_clon/login_page.dart';
import 'tab_page.dart';

// 상태 변하지 않으므로 StatelessWidget 으로 생성
// stless 입력하고 엔터치면 됨!!
class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabPage();
    // 스트림 빌더 생성해서 스냅샷으로 데이터(로그인)가 있으면 TabPage 이동, 로그인정보 없을시에 로그인 페이지 이동
    // 파이어베이스 상태 변경시 스트림으로 받아서 재실행된다.
    
    // return StreamBuilder<FirebaseUser>(
    //  stream: FirebaseAuth.instance.onAuthStateChanged,
    //  builder : (BuildContext context, AsycSnapshot snapshot) {
    //    if (snapshot.hasData) {
    //      return TabPage(snapshop.data);   - data 다이나믹타입(자바의 오브젝트)
    //    } else {
    //      return LoginPage();
    //    }
    //  }
    // )
  }
}
