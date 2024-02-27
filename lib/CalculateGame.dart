import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class CalculateGame extends StatefulWidget {
  const CalculateGame({super.key});

  @override
  State<CalculateGame> createState() => _HomePageState();
}

class _HomePageState extends State<CalculateGame> {
  StreamController<int> _inputController = StreamController.broadcast();
  StreamController<int> _scoreController = StreamController.broadcast();
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
            stream: _scoreController.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                score += (snapshot.data as int? ?? 0);
                return Text("得分:$score");
              }
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return const Text("监听中");
            }),
      ),
      body: Stack(
        children: [
          ...List.generate(5, (index) {
            return Game(
              inutController: _inputController,
              scoreController: _scoreController,
            );
          }),
          KeyPad(
            inputController: _inputController,
          ),
        ],
      ),
    );
  }
}

class Game extends StatefulWidget {
  final StreamController<int> inutController;
  final StreamController<int> scoreController;
  const Game(
      {super.key, required this.inutController, required this.scoreController});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> with SingleTickerProviderStateMixin {
  late int a, b;
  late double x;
  late AnimationController _animationController;
  late Color color;

// 重置
  void reset() {
    a = Random().nextInt(5) + 1;
    b = Random().nextInt(5);
    x = Random().nextDouble() * 320;
    color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  @override
  void initState() {
    super.initState();
    reset();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: Random().nextInt(5000) + 5000),
    );
    _animationController.forward(); // 开始动画
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // 监听动画执行完成
        reset();
        widget.scoreController.add(-1); //最底部减去1分
        _animationController.forward(from: 0.0); // 重新执行一次动画
      }
    });
    // 监听键盘按键
    widget.inutController.stream.listen((event) {
      if (a + b == event) {
        reset();
        widget.scoreController.add(3);
        _animationController.forward(from: 0.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return Positioned(
            top: Tween(begin: -50.0, end: 560.0)
                .animate(_animationController)
                .value,
            left: x,
            child: Container(
                padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Text(
                  "$a+$b=?",
                  style: TextStyle(fontSize: 24),
                )));
      },
    );
  }
}

class KeyPad extends StatelessWidget {
  final StreamController<int> inputController;
  const KeyPad({super.key, required this.inputController});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: Colors.white,
          child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 5 / 2,
              shrinkWrap: true,
              children: List.generate(9, (index) {
                return TextButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all(RoundedRectangleBorder()),
                        backgroundColor: MaterialStateProperty.all(
                            Colors.primaries[index][300])),
                    onPressed: () {
                      inputController.add(index + 1);
                    },
                    child: Text(
                      '${index + 1}',
                      style: Theme.of(context).textTheme.headline4,
                    ));
              })),
        ));
  }
}
