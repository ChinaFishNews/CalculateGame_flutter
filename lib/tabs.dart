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

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Flutter App'),
  //     ),
  //     body: _pages[_curentIndex],
  //     bottomNavigationBar: BottomNavigationBar(
  //       fixedColor: Colors.red,
  //       currentIndex: _curentIndex,
  //       type: BottomNavigationBarType.fixed,
  //       onTap: (index) {
  //         print('点击了$index');
  //         setState(() {
  //           _curentIndex = index;
  //         });
  //       },
  //       items: [
  //         BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
  //         BottomNavigationBarItem(icon: Icon(Icons.category), label: '分类'),
  //         BottomNavigationBarItem(icon: Icon(Icons.message), label: '消息'),
  //         BottomNavigationBarItem(icon: Icon(Icons.settings), label: '设置'),
  //         BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
  //       ],
  //     ),
  //     floatingActionButton: Container(
  //       height: 60,
  //       width: 60,
  //       padding: EdgeInsets.all(5),
  //       margin: EdgeInsets.only(top: 5),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(30),
  //       ),
  //       child: FloatingActionButton(
  //         backgroundColor: _curentIndex == 2 ? Colors.red : Colors.blue,
  //         child: Icon(Icons.add),
  //         onPressed: () {
  //           setState(() {
  //             _curentIndex = 2;
  //           });
  //         },
  //       ),
  //     ),
  //     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.red,
        title: Text('Flutter App'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
                // flex: 1,
                child: UserAccountsDrawerHeader(
              accountName: const Text("fish"),
              accountEmail: const Text("fishnewsdream@gmail.com"),
              otherAccountsPictures: [
                Image.network("xxx"),
                Image.network("xxx"),
                Image.network("xxx"),
              ],
              currentAccountPicture:
                  const CircleAvatar(backgroundImage: NetworkImage("xxx")),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage("xxx"))),
            )),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.people),
              ),
              title: Text("个人中心"),
            ),
            const Divider(),
            const ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.settings),
              ),
              title: Text("系统设置"),
            ),
            const Divider(),
          ],
        ),
      ),
      body: _pages[_curentIndex],
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.red,
          currentIndex: _curentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _curentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: "消息"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "设置"),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: "用户")
          ]),
      floatingActionButton: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: FloatingActionButton(
            backgroundColor: _curentIndex == 2 ? Colors.red : Colors.blue,
            child: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                _curentIndex = 2;
              });
            }),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, //配置浮动按钮的位置
    );
  }
}
