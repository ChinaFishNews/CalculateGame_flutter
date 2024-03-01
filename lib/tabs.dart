import 'package:flutter/material.dart';
import 'package:my_app/items.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _curentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    CategoryPage(),
    MessagePage(),
    SettingPage(),
    UserPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: _pages[_curentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        currentIndex: _curentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          print('点击了$index');
          setState(() {
            _curentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: '分类'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: '消息'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '设置'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
        ],
      ),
      floatingActionButton: Container(
        height: 60,
        width: 60,
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: FloatingActionButton(
          backgroundColor: _curentIndex == 2 ? Colors.red : Colors.blue,
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              _curentIndex = 2;
            });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
