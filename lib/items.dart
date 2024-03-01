import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('cell1'),
        ),
        ListTile(
          title: Text('cell2'),
        ),
        ListTile(
          title: Text('cell3'),
        ),
        ListTile(
          title: Text('cell4'),
        ),
        ListTile(
          title: Text('cell5'),
        ),
        ListTile(
          title: Text('cell6'),
        ),
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('首页'),
    );
  }
}

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessageState();
}

class _MessageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('消息'),
    );
  }
}

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPage();
}

class _UserPage extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('用户'),
    );
  }
}
