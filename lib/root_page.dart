import 'package:flutter/material.dart';
import 'tab_page.dart';
// 상태 변하지 않으므로 StatelessWidget 으로 생성
// stless 입력하고 엔터치면 됨!!
class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabPage();
  }
}
