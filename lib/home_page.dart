import 'package:flutter/material.dart';

// 상태 변하지 않으므로 StatelessWidget 으로 생성
// stless 입력하고 엔터치면 됨!!
class HomePage extends StatelessWidget {

  // 파이어베이스 로그인 시 로그인 정보 전달 , 생성자 추가.
  // final FirebaseUser user; - import 필요
  // HomePage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram Clon',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      // 복잡해질 것 같아서 메소드 따로 뺌
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    // 사방에 패딩을 줄것이기 때문에 패딩으로 감싼다.
    return Padding(
      padding: EdgeInsets.all(8.0),
      // 아이폰 탈모 때문에 감싸야 함
      child: SafeArea(
        // 핸드폰 화면이 작을수 있기때문에 스크롤뷰로 감싼다.
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  Text('Instagram에 오신 것을 환영합니다',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  // 글자 사이에 간격을 주기 위해 Padding 추가
                  Padding(padding: EdgeInsets.all(8.0)),
                  Text('사진과 동영상을 보려면 팔로우 하세요'),
                  // 글자 사이에 간격을 주기 위해 Padding 추가
                  Padding(padding: EdgeInsets.all(16.0)),
                  // 크기를 조절할 수 있음. Card 의 크기 정해줌.
                  // Card 앞에 커서 놓고 Alt+Enter 누르고 wrap the new widget 해주면 됨.
                  SizedBox(
                    width: 260.0,
                    child: Card(
                      // 카드뷰 그림자 깊어짐
                      elevation: 4.0,
                      // 나중에 Column 앞에 커서두고 Alt Enter 눌러서 padding 추가함. 한꺼번에 패딩을 줄 수 있음.
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            // 사진 사이에 간격을 주기 위해 Padding 추가
                            Padding(padding: EdgeInsets.all(1.0)),
                            // 크기 조절
                            SizedBox(
                              width: 80.0,
                              height: 80.0,
                              // 동그란 이미지
                              child: CircleAvatar(
                                // 이미지 url 주소로 불러오기
                                backgroundImage: NetworkImage('https://t1.daumcdn.net/cfile/tistory/99D789415DB79FE813'),
                                // 파이어베이스 로그인 시 유저 이미지 불러오기
                                // backgroundImage: NetworkImage(widget.user.photoUrl),
                              ),
                            ),
                            Text('이메일 주소', style: TextStyle(fontWeight: FontWeight.bold),),
                            Text('이름'),
                            // 파이어베이스 로그인 시 유저 정보 불러오기
//                            Text(user.email, style: TextStyle(fontWeight: FontWeight.bold),),
//                            Text(user.displayName),
                            // 글자 사이에 간격을 주기 위해 Padding 추가
                            Padding(padding: EdgeInsets.all(8.0)),
                            Row(
                              // 열이 가운데 올 수 있도록 지정해줌
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: 70.0,
                                  height: 70.0,
                                  // 사진 꽉차게 설정 fit: BoxFit.cover
                                  child: Image.network('https://t1.daumcdn.net/cfile/tistory/99D789415DB79FE813', fit: BoxFit.cover,),
                                ),
                                // 이미지 사이에 간격을 주기 위해 Padding 추가
                                Padding(padding: EdgeInsets.all(1.0)),
                                SizedBox(
                                  width: 70.0,
                                  height: 70.0,
                                  child: Image.network('https://t1.daumcdn.net/cfile/tistory/99D789415DB79FE813', fit: BoxFit.cover,),
                                ),
                                // 이미지 사이에 간격을 주기 위해 Padding 추가
                                Padding(padding: EdgeInsets.all(1.0)),
                                SizedBox(
                                  width: 70.0,
                                  height: 70.0,
                                  child: Image.network('https://t1.daumcdn.net/cfile/tistory/99D789415DB79FE813', fit: BoxFit.cover,),
                                )
                              ],
                            ),
                            // 글자 사이에 간격을 주기 위해 Padding 추가
                            Padding(padding: EdgeInsets.all(4.0)),
                            Text('Facebook 친구'),
                            // 글자 사이에 간격을 주기 위해 Padding 추가
                            Padding(padding: EdgeInsets.all(4.0)),
                            RaisedButton(
                              child: Text('팔로우'),
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                              // RaisedButton 은 onPressed 정의 안해주면 경고뜸. 경고 방지하고 싶으면 onPressed: () {}, 해주면 됨.
                              onPressed: () {},
                            ),
                            // 글자 사이에 간격을 주기 위해 Padding 추가
                            Padding(padding: EdgeInsets.all(4.0)),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
