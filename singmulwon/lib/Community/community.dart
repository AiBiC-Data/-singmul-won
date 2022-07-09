// ignore_for_file: deprecated_member_use, prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:number_pagination/number_pagination.dart';

import './write_page.dart';
import './boast.dart';

class Community extends StatefulWidget {
  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  var selectedPageNumber = 1;

  Container boast_board() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.green),
          top: BorderSide(color: Colors.green),
          left: BorderSide(color: Colors.green),
          right: BorderSide(color: Colors.green),
        ),
      ),
      child: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width * 0.8,
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Boast(),
              ),
            );
          },
          child: Text(
            "<< 뽐내기 게시판 >>",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }

  Container category() => Container(
        margin: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: Text('꿀팁'),
            ),
            SizedBox(
              width: 40,
            ),
            TextButton(
              onPressed: () {
                setState(() {});
              },
              child: Text('질문'),
            ),
            SizedBox(
              width: 40,
            ),
            TextButton(
              style: ButtonStyle(),
              onPressed: () {},
              child: Text('나눔'),
            ),
          ],
        ),
      );

  Container community_edit() => Container(
        margin: EdgeInsets.fromLTRB(240, 10, 30, 0),
        child: TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => WritePage()));
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Icon(Icons.edit), Text(" 글쓰기")],
          ),
        ),
      );

  Expanded pagination() => Expanded(
        child: NumberPagination(
          onPageChanged: (int pageNumber) {
            //do somthing for selected page
            setState(
              () {
                selectedPageNumber = pageNumber;
              },
            );
          },
          threshold: 4,
          pageTotal: 100,
          pageInit: selectedPageNumber, // picked number when init page
          colorPrimary: Colors.white,
          colorSub: Colors.green,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("커뮤니티"),
        elevation: 0,
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          boast_board(), //뽐내기 게시판
          category(), //카테고리
          Expanded(
            flex: 6,
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                Card(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              height: 450.0,
                              child: Content(context),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 120,
          // ),
          community_edit(), //글쓰기 버튼
          pagination(), //하단 페이지바
        ],
      ),
    );
  }

  Widget Content(BuildContext context) {
    return Card(
      child: Column(children: [
        Container(
          padding:
              const EdgeInsets.only(top: 10, left: 16, right: 10, bottom: 12),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '다육이 Plant Care 꿀조합 찾았음',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        Divider(),
        Container(
          padding:
              const EdgeInsets.only(top: 10, left: 16, right: 10, bottom: 12),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '강낭콩 키우는 꿀팁',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        Divider(),
        Container(
          padding:
              const EdgeInsets.only(top: 10, left: 16, right: 10, bottom: 12),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '선인장 키울 때 세팅할 습도',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        Divider(),
        Container(
          padding:
              const EdgeInsets.only(top: 10, left: 16, right: 10, bottom: 12),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '<종합> 식물별 적정 습도. 조도',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        Divider(),
      ]),
    );
  }
}
