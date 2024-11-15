import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// StatefulWidget 클리스 - 상태를 관리, 표현
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// 부모 클래스에 상태를 접근하고 수정하는 등 역할 수정
class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {

  // 멤버 변부 선언
  late TabController _tabController;

  @override
  void initState() {
    // 메모리에 올라갈 때 단 한번 호출되는 메서드
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // 위젯이 제거될 때 호출 된다.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('TabBar Example'),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Home', icon: Icon(Icons.home),),
              Tab(text: 'Favorits', icon: Icon(Icons.star)),
              Tab(text: 'Settings', icon: Icon(Icons.settings)),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Center(
              child: Text('home'),
            ),
            Center(
              child: Text('favorits'),
            ),
            Center(
              child: Text('settings'),
            ),
          ],
        ),
      ),
    );
  }
}
