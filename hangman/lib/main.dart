import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HangMan());
  }
}

class HangMan extends StatefulWidget {
  HangMan({super.key});

  @override
  State<HangMan> createState() => _HangManState();
}

class _HangManState extends State<HangMan> {
  int tries = 0;
  int size = 0;
  int counter = 0;
  String word = '';
  List<String> letters = List.filled(100, '');

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Hangman',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.amber[500],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    onPressed: () {
                      generateWord();
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.green[500],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    onPressed: () {
                      restart();
                    },
                    child: Text(
                      'restart',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ]),
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/background.jpg',
            ),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [
              Color(0x00000001),
              Color(0x00000000),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            word != ''
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: width * 0.6,
                              child: tries == 0
                                  ? const Image(
                                      image: AssetImage(
                                      'images/HANG.png',
                                    ))
                                  : tries == 1
                                      ? const Image(
                                          image: AssetImage('images/H.png'))
                                      : tries == 2
                                          ? const Image(
                                              image:
                                                  AssetImage('images/HA.png'))
                                          : tries == 3
                                              ? const Image(
                                                  image: AssetImage(
                                                      'images/HAN.png'))
                                              : tries == 4
                                                  ? const Image(
                                                      image: AssetImage(
                                                          'images/HANGe.png'))
                                                  : tries == 5
                                                      ? const Image(
                                                          image: AssetImage(
                                                              'images/HANGM.png'))
                                                      : tries == 6
                                                          ? const Image(
                                                              image: AssetImage(
                                                                  'images/HANGMA.png'))
                                                          : const Image(
                                                              image: AssetImage(
                                                                  'images/rip.png')))
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          refreshLetters(width),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(10)),
                            width: width / 7,
                            child: TextButton(
                                onPressed: () {
                                  checkLetter('A');
                                },
                                child: const Text(
                                  'A',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(10)),
                            width: width / 7,
                            child: TextButton(
                                onPressed: () {
                                  checkLetter('B');
                                },
                                child: const Text(
                                  'B',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(10)),
                            width: width / 7,
                            child: TextButton(
                                onPressed: () {
                                  checkLetter('C');
                                },
                                child: const Text(
                                  'C',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(10)),
                            width: width / 7,
                            child: TextButton(
                                onPressed: () {
                                  checkLetter('D');
                                },
                                child: const Text(
                                  'D',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(10)),
                            width: width / 7,
                            child: TextButton(
                                onPressed: () {
                                  checkLetter('E');
                                },
                                child: const Text(
                                  'E',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(10)),
                            width: width / 7,
                            child: TextButton(
                                onPressed: () {
                                  checkLetter('F');
                                },
                                child: const Text(
                                  'F',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(10)),
                            width: width / 7,
                            child: TextButton(
                                onPressed: () {
                                  checkLetter('G');
                                },
                                child: const Text(
                                  'G',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(10)),
                            width: width / 7,
                            child: TextButton(
                                onPressed: () {
                                  checkLetter('H');
                                },
                                child: const Text(
                                  'H',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(10)),
                            width: width / 7,
                            child: TextButton(
                                onPressed: () {
                                  checkLetter('I');
                                },
                                child: const Text(
                                  'I',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(10)),
                            width: width / 7,
                            child: TextButton(
                                onPressed: () {
                                  checkLetter('J');
                                },
                                child: const Text(
                                  'J',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(10)),
                            width: width / 7,
                            child: TextButton(
                                onPressed: () {
                                  checkLetter('K');
                                },
                                child: const Text(
                                  'K',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(10)),
                            width: width / 7,
                            child: TextButton(
                                onPressed: () {
                                  checkLetter('L');
                                },
                                child: const Text(
                                  'L',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(10)),
                            width: width / 7,
                            child: TextButton(
                                onPressed: () {
                                  checkLetter('M');
                                },
                                child: const Text(
                                  'M',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(10)),
                            width: width / 7,
                            child: TextButton(
                                onPressed: () {
                                  checkLetter('N');
                                },
                                child: const Text(
                                  'N',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(10)),
                            width: width / 7,
                            child: TextButton(
                                onPressed: () {
                                  checkLetter('O');
                                },
                                child: const Text(
                                  'O',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(10)),
                            width: width / 7,
                            child: TextButton(
                                onPressed: () {
                                  checkLetter('P');
                                },
                                child: const Text(
                                  'P',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(10)),
                            width: width / 7,
                            child: TextButton(
                                onPressed: () {
                                  checkLetter('Q');
                                },
                                child: const Text(
                                  'Q',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(10)),
                            width: width / 7,
                            child: TextButton(
                                onPressed: () {
                                  checkLetter('R');
                                },
                                child: const Text(
                                  'R',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(10)),
                            width: width / 5,
                            child: TextButton(
                                onPressed: () {
                                  checkLetter('S');
                                },
                                child: const Text(
                                  'S',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(10)),
                            width: width / 5,
                            child: TextButton(
                                onPressed: () {
                                  checkLetter('T');
                                },
                                child: const Text(
                                  'T',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(10)),
                            width: width / 5,
                            child: TextButton(
                                onPressed: () {
                                  checkLetter('U');
                                },
                                child: const Text(
                                  'U',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(10)),
                            width: width / 5,
                            child: TextButton(
                                onPressed: () {
                                  checkLetter('V');
                                },
                                child: const Text(
                                  'V',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(10)),
                            width: width / 5,
                            child: TextButton(
                                onPressed: () {
                                  checkLetter('W');
                                },
                                child: const Text(
                                  'W',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(10)),
                            width: width / 5,
                            child: TextButton(
                                onPressed: () {
                                  checkLetter('X');
                                },
                                child: const Text(
                                  'X',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(10)),
                            width: width / 5,
                            child: TextButton(
                                onPressed: () {
                                  checkLetter('Y');
                                },
                                child: const Text(
                                  'Y',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(10)),
                            width: width / 5,
                            child: TextButton(
                                onPressed: () {
                                  checkLetter('Z');
                                },
                                child: const Text(
                                  'Z',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )
                : Container(
                    decoration: BoxDecoration(
                        color: Colors.amber[600],
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                        onPressed: () {
                          playgame();
                        },
                        child: Text(
                          'Play Game',
                          style: TextStyle(color: Colors.black),
                        )),
                  )
          ],
        ),
      ),
    );
  }

  void playgame() {
    generateWord();
  }

  void checkLetter(String letter) {
    int flag = 0;
    List<String> newLetters = word.split('');
    print(newLetters);
    for (int i = 0; i < newLetters.length; i++) {
      flag = 0;
      if (newLetters[i] == letter && letters[i] == '') {
        setState(() {
          letters[i] = letter;
          counter += 1;
          print(counter);
        });
        break;
      } else {
        flag = 1;
      }
    }
    if (counter == size) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: Color.fromARGB(255, 19, 19, 19),
            content: Container(
              decoration: BoxDecoration(),
              width: 200,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Congratulations , you win !',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            generateWord();
                          },
                          child: Text(
                            'Play Again',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
    if (tries >= 7) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: Color.fromARGB(255, 19, 19, 19),
            content: Container(
              decoration: BoxDecoration(),
              width: 200,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You failed !',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            generateWord();
                          },
                          child: Text(
                            'Play Again',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    print('flag = $flag');
    if (flag == 1) {
      setState(() {
        tries++;
        flag = 0;
      });
      print(tries);
    }
  }

  void generateWord() {
    for (int i = 0; i < word.length; i++) {
      setState(() {
        letters[i] = '';
        tries = 0;
        counter = 0;
      });
    }
    List<String> birds = ['sparrow', 'eagle', 'hawk', 'parrot', 'owl'];
    List<String> animals = ['lion', 'tiger', 'elephant', 'zebra', 'giraffe'];
    List<String> jobs = ['doctor', 'teacher', 'engineer', 'artist', 'chef'];
    List<String> flowers = ['rose', 'lily', 'sunflower', 'daisy', 'tulip'];
    List<String> trees = ['oak', 'pine', 'maple', 'cedar', 'birch'];
    List<List<String>> categories = [birds, animals, jobs, flowers, trees];
    List<String> selectedCategory =
        categories[Random().nextInt(categories.length)];
    String randomWord =
        selectedCategory[Random().nextInt(selectedCategory.length)];
    List<String> hint = [''];
    for (List<String> category in categories) {
      if (category.contains(randomWord)) {
        hint = category;
        break;
      }
    }
    String categoryName;
    if (hint == birds) {
      categoryName = 'Birds';
    } else if (hint == animals) {
      categoryName = 'Animals';
    } else if (hint == jobs) {
      categoryName = 'flowers';
    } else if (hint == trees) {
      categoryName = 'Trees';
    }
    setState(() {
      word = randomWord.toUpperCase();
      size = word.length;
      counter = 0;
      print(word);
      print(size);
    });
  }

  void restart() {
    for (int i = 0; i < word.length; i++) {
      setState(() {
        letters[i] = '';
        tries = 0;
        counter = 0;
      });
    }
  }

  Widget refreshLetters(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < size; i++)
          Container(
            width: width / 10,
            height: width / 10,
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.amber[300],
            ),
            child: Text(
              '${letters[i]}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}
