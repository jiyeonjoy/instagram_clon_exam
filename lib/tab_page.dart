import 'package:flutter/material.dart';
import 'package:instagram_clon/account_page.dart';
import 'package:instagram_clon/home_page.dart';
import 'package:instagram_clon/search_page.dart';

// 변경 필요하므로 StatefulWidget 으로 생성
// stful 입력 후 엔터
class TabPage extends StatefulWidget {
  // 파이어베이스 로그인시 정보 객체
  // final FirebaseUser user;

  // TabPage(this.user); - 생성자

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;

  List _pages = [
    HomePage(),
    SearchPage(),
    AccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        // 아이템 선택시 색 변경
        fixedColor: Colors.black,
        // 아이템 선택시 인덱스 바꾸기 메소드 정의
        onTap: _onItemTapped,
          // 현재 선택된 인덱스
          currentIndex: _selectedIndex,
          items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(
            icon: Icon(Icons.search), title: Text('Search')),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), title: Text('Account'))
      ]),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
