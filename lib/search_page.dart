import 'package:flutter/material.dart';
import 'package:instagram_clon/create_page.dart';

// 변경 필요하므로 StatefulWidget 으로 생성
// stful 입력 후 엔터
class SearchPage extends StatefulWidget {


  // 파이어베이스 로그인 시 로그인 정보 전달 , 생성자 추가.
  // final FirebaseUser user; - import 필요
  // SearchPage(this.user)


  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (counter) => CreatePage()));
              // 파이어베이스 로그인 시 정보 추가
              // MaterialPageRoute(builder: (counter) => CreatePage(widget.user)));
        },
        child: Icon(Icons.create),
        backgroundColor: Colors.blue,
      ),
    );
  }
  
  Widget _buildBody() {
    
    // 파이어베이스에 저장된 이미지 불러오기!!
    // 스트림빌더 타입 설정 안해도 됨
//     return StreamBuilder( // - Alt Enter 하면 builder 자동 생성
//       // Stream<QuerySnapshot> 을 받는 것임. 스트림 받는 것.
//       // post 컬렉션 밑에 파일이 변동있을시 스트림이 들어오는 것임.
//         stream: Firestore.instance.collection('post').snapshots(),
//         // snapshot이 데이터 정보를 가지고 있는지 유무를 알 수 있음.
//         builder : (BuildContext context, AsycSnapshot snapshot) {
//           if(snapshot.hasData) {
//             return Center(child: CircularProgressIndicator());
//           }
//           // documents 는 컬렉션의 문서가 다 들어오는 것임.
//           // documents 가 null 일 경우 ?? 뒤에 해주겠다는 뜻임
//           var items = snapshot.data.documents ?? [];
//
//           // 그리드뷰
//           return GridView.builder(
//              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                  // 열 갯수 3개
//                  crossAxisCount: 3,
//                  // 이미지 비율 정사각형 형태
//                  childAspectRatio: 1.0,
//                  // 아이템 별 띠 공간 생성 위 옆
//                  mainAxisSpacing: 1.0,
//                  crossAxisSpacing: 1.0),
//              // 그리드뷰 아이템 다섯개로 정해줄 수 있다.
//              itemCount: items.length,
//              itemBuilder: (context, index) {
//                return _buildListItem(context, items[index]);
//               });
//         },
//     );


    // 그리드뷰
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // 열 갯수 3개
          crossAxisCount: 3,
          // 이미지 비율 정사각형 형태
          childAspectRatio: 1.0,
          // 아이템 별 띠 공간 생성 위 옆
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0),
        // 그리드뷰 아이템 다섯개로 정해줄 수 있다.
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildListItem(context, index);
        });
  }

  // 파라미터 타입 생략 가능!!
  // 파이어베이스에 업로드 된 이미지 표시하기
//  Widget _buildListItem(BuildContext context, document) {
//    return Image.network(
//      document['photoUrl'],
//      fit: BoxFit.cover,);
//  }

  Widget _buildListItem(BuildContext context, int index) {
    return Image.network(
      'https://t1.daumcdn.net/cfile/tistory/99D789415DB79FE813',
      fit: BoxFit.cover,);
  }
}
