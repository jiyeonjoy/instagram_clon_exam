import 'package:flutter/material.dart';

// 상태 변하지 않으므로 StatelessWidget 으로 생성
// stless 입력하고 엔터치면 됨!!
class DetailPostPage extends StatelessWidget {

  // final 과 var 는 같이 쓸 수 없다. 따라서 dynamic 으로 지정
  final dynamic document;
  // 생성자
  DetailPostPage(this.document);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('둘러보기'),
      ),
      body: _buildBody(),
    );
  }

 Widget _buildBody() {
    // 아이폰 탈모때문에 감싸는 것임. 스크롤뷰써도 안가려짐.
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          // 행이 왼쪽으로 붙게 설정
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              // 전체 패딩 8.0 만큼 주기
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(document['userPhotoUrl']),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Column(
                      children: <Widget>[
                        Text(document['email'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(document['displayName'])
                      ],
                    ),
                  )
                ],
              ),
            ),
            Image.network(document['photoUrl']),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(document['contents']))
          ],
        ),
      ),

    );
 }
}
