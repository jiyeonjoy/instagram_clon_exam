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

  List _pages;


  // init 치면 바로뜸 엔터치면 됨.
  // 생성자 다음에 호출되는 부분임. build 전에 호출됨. 초기화 해줄때 여기에 해주면 에러없음.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 위에 List 선언만 해줌. 초기화 위해서 하면 wiget.user 부분에서 에러 발생.
    _pages = [
      // 파이어베이스 로그인시 로그인 정보 전달
      // HomePage(widget.user),
      // AccountPage(widget.user)
      HomePage(),
      SearchPage(),
      AccountPage()
    ];
  }

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
