import 'package:flutter/material.dart';

// 변경 필요하므로 StatefulWidget 으로 생성
// stful 입력 후 엔터
class AccountPage extends StatefulWidget {

  // 파이어베이스 로그인 시 로그인 정보 전달 , 생성자 추가.
  // final FirebaseUser user; - import 필요
  // AccountPage(this.user)

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      // 액션버튼 추가
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.exit_to_app),
          // IconButton onPressed 구성해줘야됨. 일단 아무것도 안할 경우 onPressed: () {} 입력하면 됨
          onPressed: () {
            // 로그아웃 추가
            // FirebaseAuth.instance.signOut();
            // _googleSignIn.sighOut();
          },
        )
      ],

    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        // 열이 가운데가 아니라 맨 위에 붙을 수 있도록 지정
        crossAxisAlignment: CrossAxisAlignment.start,
        // 열이 전체적으로 골고루 퍼짐. 간격 유지함
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              // 이미지 겹치기 위해 Stack 감싸기
              Stack(
                children: <Widget>[
                  SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('https://t1.daumcdn.net/cfile/tistory/99D789415DB79FE813'),
                      // 파이어베이스 로그인 시 유저 이미지 불러오기
                      // backgroundImage: NetworkImage(widget.user.photoUrl),
                    ),
                  ),
                  // 플러스 이미지 아이콘을 Container 로 감싼다. Container 크기는 이미지와 똑같이 해주고 그안의 플러스 이미지 아이콘을 위치 조정한다.
                  // SizedBox 앞에 Alt Enter 누르고 Container 로 감싼다.
                  // Container는 SizedBox 필요 없이 바로 크기 정할 수 있다.
                  Container(
                    width: 80.0,
                    height: 80.0,
                    // 위치 콘테이너 기준으로 오른쪽 아래에 플러스 이미지 버튼 위치 조정
                    alignment: Alignment.bottomRight,
                    // 플러스 아이콘 주위로 흰띠를 두르기위해 Stack 안에 크기가 조금더 큰 흰색 바탕 이미지를 추가한다.
                    child: Stack(
                      // 센터로 지정해줘야지 두 이미지가 정중앙에 배치가 된다.
                      alignment: Alignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 28.0,
                          height: 28.0,
                          child: FloatingActionButton(onPressed: null,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 25.0,
                          height: 25.0,
                          child: FloatingActionButton(onPressed: null,
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              // 파이어베이스 로그인 시 유저 정보 불러오기
//            Text(user.displayName),
              Text('이름',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              )
            ],
          ),
          Text('0\n게시물',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
          Text('0\n팔로워',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
          Text('0\n팔로잉',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
