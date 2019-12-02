import 'package:flutter/material.dart';

// 변경 필요하므로 StatefulWidget 으로 생성
// stful 입력 후 엔터
class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('tab page'),
    );
  }
}
