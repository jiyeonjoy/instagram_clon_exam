import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// 변경 필요하므로 StatefulWidget 으로 생성
// stful 입력 후 엔터
class CreatePage extends StatefulWidget {

  // 파이어베이스 로그인 시 로그인 정보 전달 , 생성자 추가.
  // final FirebaseUser user; - import 필요
  // CreatePage(this.user)

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
          icon: Icon(Icons.send), onPressed: () {
              // 이미지 및 텍스트 디비에 저장 되는 코드
//            final firebaseStorageRef = FirebaseStorage.instance
//                .ref() - 시작점
//                .child('post') - 경로 post 라는 폴더 만들 것임.
//                .child('${DateTime.now().millisecondsSinceEpoch}.png'); - 현재 시간을 밀리세컨즈로 표현해서 파일 이름 저장
//
             //  파이어 베이스 스토리지가 파일 업로드 지원함.
//            final task = firebaseStorageRef.putFile(
//              _image, StorageMetadata(contentType: 'image/png'));
//
//                // 이런 task가 future로 리턴 되므로 then 으로 받음 스냅샷이 들어오는 것임.(value)
//                // 파일 업로드 완료시 다운로드 url을 받을 수 있음.
//                task.onComplete.then((value) {
//                  // future 객체로 파일 업로드 완료시 받을 수 있음. 다이나믹 객체라서 어떤게 올줄 몰라 var 타입으로 지정
//                  var downloadUrl = value.ref.getDownloadURL();
//
//                  downloadUrl.then((uri) {
//                    // DB에 post 라는 컬렉션을 만들고 그 안에 새로운 문서를 만들것임.
//                    var doc = Firestore.instance.collection('post').document();
//                    // 데이터는 맵 형태로 넣어줘야됨. 가장 쉬운 받법은 json 형태로 넣어주는 것임.
//                    doc.setData({
//                      'id' : doc.documentID,
//                      'photoUrl' : uri.toString(),
//                      'contents' : textEditingController.text,
//                      'email' : widget.user.email,
//                      'displayName' : widget.user.displayName,
//                      'userPhotoUrl' : widget.user.photoUrl
//                    }).then((onValue) {
//                      // 데이터 전송 완료 시 화면 닫기, 이전 화면으로 이동
//                      Navigator.pop(context);
//                    });
//                  });
//                });
                },
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
