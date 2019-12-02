import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  File _image;

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
      floatingActionButton: FloatingActionButton(onPressed: _getImage,
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
    // 키보드가 올라갔을때 공간이 좁아져 에러가 생기는 걸 방지해줌
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // _image 파일이 null 이면 No Image 라는 텍스트가 보이고 파일이 존재하면 이미지 파일이 보인다.
          _image == null ? Text('No Image') : Image.file(_image),
          TextField(
            // text 힌트 설정
            decoration: InputDecoration(hintText: '내용을 입력하세요.'),
            controller: textEditingController,
          )
        ],
      ),
    );
 }

 // 비동기 처리됨
 Future _getImage() async {
    // 미래에 파일로 넘어올 아이라서 파일로 받을 수 없다.
    // 이때 await 를 앞에 붙여주면 되는데 그럼 메소드가 Future를 리턴하고 async를 구현 해야한다.
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
 }
}
