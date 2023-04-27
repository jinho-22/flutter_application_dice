import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_dice/dice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Dice dice = Dice(size: 100);

  @override
  Widget build(BuildContext context) {
    late Timer timer;
    int resultNum = 0;

    void start() {
      timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
        dice.shake();
        resultNum = dice.dice[0];
      });
    }

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Flexible(
                flex: 2,
                child: Center(
                  child: Text(
                    '$resultNum',
                    style: const TextStyle(color: Colors.black, fontSize: 60),
                  ),
                )),
            const Flexible(
                flex: 1,
                child: Center(
                  child: Text(
                    '결과',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                )),
            Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    IconButton(
                        iconSize: 100,
                        onPressed: null,
                        icon: Icon(
                          Icons.play_circle,
                          size: 50,
                        )),
                    IconButton(
                        iconSize: 100,
                        onPressed: null,
                        icon: Icon(
                          Icons.check_circle_outline,
                          size: 50,
                        ))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
