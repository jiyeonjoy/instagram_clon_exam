import 'package:flutter/material.dart';
import 'package:instagram_clon/create_page.dart';
import 'package:instagram_clon/detail_post_page.dart';

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

    // json 형태로 저장.
  dynamic document = {
    'id' : 'choi',
    'photoUrl' : 'https://t1.daumcdn.net/cfile/tistory/99D789415DB79FE813',
    'contents' : '잘나오니?',
    'email' : 'choi02647@naver.com',
    'displayName' : '최지연',
    'userPhotoUrl' : 'https://t1.daumcdn.net/cfile/tistory/99D789415DB79FE813'
  };

    // 이미지 클릭시 이미지가 커지는 애니메이션이 생기면서 화면 이동하기 위한 위젯 Hero
    return Hero(
      // tag를 그냥 문자로 지정해주면 에러 뜸. 리스트 아이템의 Hero를 붙여주는 것이기 때문에 각각 다른 tag를 붙여줘야됨.
      // 따라서 리스트 아이템의 index를 태그로 붙여줌!!!!!!!!!!!!!!!
      tag: index,
      // Image.network 앞에 커서두고 Alt + Enter 누르면 뉴 위젯으로 감쌀 수 있음.
      // InkWell을 Material로 감싸줘야지 Hero 애니메이션 후 되돌아 왔을 때 에러가 안생김.
      child: Material(
        // InkWell 은 이미지 클릭시 물방울이 퍼지는 효과를 낼 수 있음.
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailPostPage(document, index);
            }));
          },
          child: Image.network(
            document['photoUrl'],
            fit: BoxFit.cover,),
        ),
      ),
    );
  }
}
