import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: JankenPage());
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  // 自分が選んだ手（初期値は✊）
  String myHand = '✊';
  // コンピュータが選んだ手（初期値は✊）
  String computerHand = '✊';
  // 結果
  String result = '引き分け';

  void selectHand(String selectedHand) {
    myHand = selectedHand;
    generateComputerHand();
    judge();
    setState(() {});
  }

  void generateComputerHand() {
    final randomNumber = Random().nextInt(3);
    computerHand = randomNumberToHand(randomNumber);
  }

  String randomNumberToHand(int randomNumber) {
    switch (randomNumber) {
      case 0:
        return '✊';
      case 1:
        return '✌️';
      case 2:
        return '🖐️';
      default:
        return '✊';
    }
  }

  void judge() {
    if (myHand == computerHand) {
      result = '引き分け';
    } else if (myHand == '✊' && computerHand == '✌️' ||
        myHand == '✌️' && computerHand == '🖐️' ||
        myHand == '🖐️' && computerHand == '✊') {
      result = '勝ち';
    } else {
      result = '負け';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('じゃんけん'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                result,
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 64),
              Text(
                computerHand,
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 64),
              Text(
                myHand,
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      selectHand('✊');
                    },
                    child: Text('✊'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      selectHand('✌️');
                    },
                    child: Text('✌️'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      selectHand('🖐️');
                    },
                    child: Text('🖐️'),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
