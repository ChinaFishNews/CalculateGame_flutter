import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        Row(
          children: [
            Text(
              '热搜',
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
        Divider(
          height: 20,
        ),
        SizedBox(
          height: 5,
        ),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            Button(text: '女装', onpressed: () {}),
            Button(text: '笔记本', onpressed: () {}),
            Button(text: '玩具', onpressed: () {}),
            Button(text: '时尚', onpressed: () {}),
            Button(text: '男装', onpressed: () {}),
            Button(text: '手机', onpressed: () {}),
            Button(text: '家电', onpressed: () {}),
            Button(text: '情趣', onpressed: () {}),
            Button(text: '数码', onpressed: () {}),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Text(
              '历史记录',
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
        Divider(
          height: 20,
        ),
        Column(
          children: [
            ListTile(
              title: Text('女装'),
            ),
            Divider(),
            ListTile(
              title: Text('数码'),
            ),
            Divider(),
            ListTile(
              title: Text('母婴'),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: OutlinedButton.icon(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black26)),
            onPressed: () {
              print('清空历史记录');
            },
            icon: Icon(Icons.delete),
            label: Text('清空历史记录'),
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class Button extends StatelessWidget {
  String text;
  void Function()? onpressed;
  Button({super.key, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Color.fromARGB(241, 223, 219, 219)),
            foregroundColor: MaterialStateProperty.all(Colors.black)),
        onPressed: onpressed,
        child: Text(text));
  }
}
