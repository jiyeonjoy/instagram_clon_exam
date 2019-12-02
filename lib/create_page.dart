import 'package:flutter/material.dart';

// 변경 필요하므로 StatefulWidget 으로 생성
// stful 입력 후 엔터
class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  // 글자 컨트롤 하기 위한 객체 생성
  // 화면이 없어지거나 할 때 해제 해줘야됨!!
  final textEditingController = TextEditingController();

  // _CreatePageState 객체 소멸될때 호출되는 메소드
  @override
  void dispose() {
    // 메모리 해제 필요
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(onPressed: null,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

 Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.send), onPressed: () {},
        )
      ],
    );
 }

 Widget _buildBody() {
    return Column(
      children: <Widget>[
        Text('No Image'),
        TextField(
          // text 힌트 설정
          decoration: InputDecoration(hintText: '내용을 입력하세요.'),
          controller: textEditingController,
        )
      ],
    );
 }
}
