import 'package:flutter/material.dart';
import 'package:instagram_clon/create_page.dart';

// 변경 필요하므로 StatefulWidget 으로 생성
// stful 입력 후 엔터
class SearchPage extends StatefulWidget {
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
        },
        child: Icon(Icons.create),
        backgroundColor: Colors.blue,
      ),
    );
  }
  
  Widget _buildBody() {
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

  Widget _buildListItem(BuildContext context, int index) {
    return Image.network(
      'https://t1.daumcdn.net/cfile/tistory/99D789415DB79FE813',
      fit: BoxFit.cover,);
  }
}
