import 'package:flutter/material.dart';

class AppBarPage extends StatefulWidget {
  const AppBarPage({super.key});

  @override
  State<AppBarPage> createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 9, vsync: this);
  }

  List<String> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
          ),
          onPressed: () {
            print('click');
          },
        ),
        backgroundColor: Colors.red,
        title: Text("Flutter App"),
        actions: [
          IconButton(
              onPressed: () {
                print('搜索图标');
              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                print('更多');
              },
              icon: Icon(Icons.more_horiz)),
        ],
        bottom: TabBar(
          isScrollable: true,
          indicatorColor: Colors.green,
          indicatorWeight: 2,
          indicatorPadding: EdgeInsets.all(5),
          labelColor: Colors.yellow,
          unselectedLabelColor: Colors.white,
          labelStyle: TextStyle(
            fontSize: 15,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12,
          ),
          indicator: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          controller: _tabController,
          tabs: [
            Tab(
              child: Text('关注'),
            ),
            Tab(
              child: Text('热门'),
            ),
            Tab(
              child: Text('视频'),
            ),
            Tab(
              child: Text('关注'),
            ),
            Tab(
              child: Text('热门'),
            ),
            Tab(
              child: Text('视频'),
            ),
            Tab(
              child: Text('关注'),
            ),
            Tab(
              child: Text('视频'),
            ),
            Tab(
              child: Text('热门'),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Text("我是关注"),
          Text("我是关注"),
          Text("我是关注"),
          Text("我是关注"),
          Text("我是关注"),
          Text("我是关注"),
          Text("我是关注"),
          ListView(
            children: [
              ListTile(
                title: Text('我是热门列表'),
              ),
              ListTile(
                title: Text('我是热门列表'),
              ),
              ListTile(
                title: Text('我是热门列表'),
              ),
              ListTile(
                title: Text('我是热门列表'),
              ),
              ListTile(
                title: Text('我是热门列表'),
              ),
              ListTile(
                title: Text('我是热门列表'),
              ),
              ListTile(
                title: Text('我是热门列表'),
              ),
              ListTile(
                title: Text('我是热门列表'),
              ),
            ],
          ),
          ListView(
            children: [
              ListTile(
                title: Text('我是视频列表'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
