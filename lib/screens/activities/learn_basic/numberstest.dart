import 'dart:math';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';
import 'package:word_search/word_search.dart';


class NumberTest extends StatefulWidget {
  const NumberTest({Key key}) : super(key: key);

  @override
  _NumberTestState createState() => _NumberTestState();
}

enum TtsState { playing, stopped }

class _NumberTestState extends State<NumberTest> {
  // sent size to our widget
  GlobalKey<_WordFindWidgetState> globalKey = GlobalKey();

  // make list question for puzzle
  // make class 1st
 
   List<WordFindQues> listQuestions = [
      
  WordFindQues(
        question: "What is this number?",
        answer: "three",
       image:
            "assets/image/three.png",
      ),
      WordFindQues(
        question: "What is this number?",
        answer: "seven",
       image:
            "assets/image/sevn.png",
      ),
   
       WordFindQues(
        question: "What is this number?",
        answer: "one",
        image:
            "assets/image/one.png",
      ),
      WordFindQues(
        question: "What is this number?",
        answer: "four",
        image:
            "assets/image/four.png",
      ),
      WordFindQues(
        question: "My mother's sister is my?",
        answer: "nine",
        image:
            "assets/image/nine.png",
      ),
        WordFindQues(
        question: "What is this number?",
        answer: "six",
        image:
            "assets/image/six.png",
      )

    ];
  @override
  void initState() {
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.pinkAccent.shade100,
          child: Column(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      color: Colors.pinkAccent.shade100,
                      // lets make our word find widget
                      // sent list to our widget
                      child: WordFindWidget(
                        constraints.biggest,
                        listQuestions.map((ques) => ques.clone()).toList(),
                        key: globalKey,
                      ),
                    );
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  
                  globalKey.currentState.generatePuzzle(
                    loop: listQuestions.map((ques) => ques.clone()).toList(),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Reload",
                        style: TextStyle(color: Colors.blue),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.autorenew,
                        color: Colors.blue,
                      )
                    ],
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// make statefull widget name WordFindWidget
class WordFindWidget extends StatefulWidget {
  Size size;
  List<WordFindQues> listQuestions;
  WordFindWidget(this.size, this.listQuestions, {Key key}) : super(key: key);

  @override
  _WordFindWidgetState createState() => _WordFindWidgetState();
}

class _WordFindWidgetState extends State<WordFindWidget> {
  Size size;
  List<WordFindQues> listQuestions;
  int indexQues = 0;
  int hintCount = 0;

  @override
  void initState() {
    super.initState();
    size = widget.size;
    listQuestions = widget.listQuestions;
    generatePuzzle();
    initTts();
    _speak("Welcome to the words test");
  }
@override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    WordFindQues currentQues = listQuestions[indexQues];
    // print(currentQues);

    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => generateHint(),
                  child: Row(
                    children: [
                   
                      Icon(
                        Icons.help_center_outlined,
                        size: 45,
                        color: Colors.yellow[200],
                      ),
                         Text("Get Hint",style: TextStyle(color:Colors.yellow[200] ,fontSize: 18),),
                    ],
                  ),
                ),
                IconButton(onPressed: (){_speak(currentQues.answer);}, icon: Icon(Icons.volume_up_outlined,size: 35,color:Colors.yellow[200]))
              ],
            
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => generatePuzzle(left: true),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 45,
                      color: Colors.yellow[200],
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _speak(currentQues.answer);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        height: 200,
                        alignment: Alignment.center,
                        child: Image.asset(
                          currentQues.image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => generatePuzzle(next: true),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 45,
                      color: Colors.yellow[200],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  currentQues.question ?? '',
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(onPressed: (){
                  
                 _speak(currentQues.question);
                }, icon: const Icon(Icons.volume_up_outlined,color: Colors.white,))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            alignment: Alignment.center,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: currentQues.puzzles.map((puzzle) {
                    Color color;

                    if (currentQues.isDone) {
                      color = Colors.green[300];
                    } else if (puzzle.hintShow) {
                      color = Colors.yellow[100];
                    } else if (currentQues.isFull) {
                      color = Colors.red;
                    } else {
                      color = const Color(0xff7EE7FD);
                    }

                    return InkWell(
                      onTap: () {
                        if (puzzle.hintShow || currentQues.isDone) return;

                        currentQues.isFull = false;
                        puzzle.clearValue();
                        setState(() {});
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: constraints.biggest.width / 7 - 6,
                        height: constraints.biggest.width / 7 - 6,
                        margin: const EdgeInsets.all(3),
                        child: Text(
                          (puzzle.currentValue ?? '').toUpperCase(),
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.lime[200],
                borderRadius: BorderRadius.circular(15)),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisCount: 8,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: 16,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                bool statusBtn = currentQues.puzzles
                        .indexWhere((puzzle) => puzzle.currentIndex == index) >=
                    0;

                return LayoutBuilder(
                  builder: (context, constraints) {
                    Color color =
                        statusBtn ? Colors.white70 : const Color(0xff7EE7FD);

                    return Container(
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          if (!statusBtn) setBtnClick(index);
                        },
                        child: SizedBox(
                          height: constraints.biggest.height,
                          child: Center(
                            child: Text(
                              currentQues.arrayBtns[index].toUpperCase(),
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void generatePuzzle({
    List<WordFindQues> loop,
    bool next = false,
    bool left = false,
  }) {
    if (loop != null) {
      indexQues = 0;
      listQuestions = <WordFindQues>[];
      listQuestions.addAll(loop);
    } else {
      if (next && indexQues < listQuestions.length - 1) {
        indexQues++;
      } else if (left && indexQues > 0) {
        indexQues--;
      } else if (indexQues >= listQuestions.length - 1) {
        return;
      }

      setState(() {});

      if (listQuestions[indexQues].isDone) return;
    }

    WordFindQues currentQues = listQuestions[indexQues];

    setState(() {});

    final List<String> wl = [currentQues.answer];

    final WSSettings ws = WSSettings(
      width: 16,
      height: 1,
      orientations: List.from([
        WSOrientation.horizontal,
      ]),
    );

    final WordSearch wordSearch = WordSearch();

    final WSNewPuzzle newPuzzle = wordSearch.newPuzzle(wl, ws);

    // check if got error generate random word
    if (newPuzzle.errors.isEmpty) {
      currentQues.arrayBtns = newPuzzle.puzzle.expand((list) => list).toList();
      currentQues.arrayBtns.shuffle(); // make shuffle so user not know answer

      bool isDone = currentQues.isDone;

      if (!isDone) {
        currentQues.puzzles = List.generate(wl[0].split("").length, (index) {
          return WordFindChar(
              correctValue: currentQues.answer.split("")[index]);
        });
      }
    }

    hintCount = 0; //number hint per ques we hit
    setState(() {});
  }

  generateHint() async {
    // let dclare hint
    WordFindQues currentQues = listQuestions[indexQues];

    List<WordFindChar> puzzleNoHints = currentQues.puzzles
        .where((puzzle) => !puzzle.hintShow && puzzle.currentIndex == null)
        .toList();

    if (puzzleNoHints.isNotEmpty) {
      hintCount++;
      int indexHint = Random().nextInt(puzzleNoHints.length);
      int countTemp = 0;
      // print("hint $indexHint");

      currentQues.puzzles = currentQues.puzzles.map((puzzle) {
        if (!puzzle.hintShow && puzzle.currentIndex == null) countTemp++;

        if (indexHint == countTemp - 1) {
          puzzle.hintShow = true;
          puzzle.currentValue = puzzle.correctValue;
          puzzle.currentIndex = currentQues.arrayBtns
              .indexWhere((btn) => btn == puzzle.correctValue);
        }

        return puzzle;
      }).toList();

      // check if complete

      if (currentQues.fieldCompleteCorrect()) {
        currentQues.isDone = true;

        setState(() {});

        await Future.delayed(const Duration(seconds: 1));
        generatePuzzle(next: true);
      }

     
      setState(() {});
    }
  }

  Future<void> setBtnClick(int index) async {
    WordFindQues currentQues = listQuestions[indexQues];

    int currentIndexEmpty =
        currentQues.puzzles.indexWhere((puzzle) => puzzle.currentValue == null);

    if (currentIndexEmpty >= 0) {
      currentQues.puzzles[currentIndexEmpty].currentIndex = index;
      currentQues.puzzles[currentIndexEmpty].currentValue =
          currentQues.arrayBtns[index];

      if (currentQues.fieldCompleteCorrect()) {
        currentQues.isDone = true;

        setState(() {});

        await Future.delayed(const Duration(seconds: 1));
        generatePuzzle(next: true);
      }
      setState(() {});
    }
  }
FlutterTts flutterTts;
  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;

  get isStopped => ttsState == TtsState.stopped;

 
initTts() {
    flutterTts = FlutterTts();

    flutterTts.setStartHandler(() {
      setState(() {
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        ttsState = TtsState.stopped;
      });
    });

    
  }

  
  Future _speak(String word) async {
   List<dynamic> languages = await flutterTts.getLanguages;

await flutterTts.setLanguage("en-US");

await flutterTts.setSpeechRate(0.5);

await flutterTts.setVolume(1.0);

await flutterTts.setPitch(1.0);

    await flutterTts.speak(word);
  }
}


class WordFindQues {
  String question;
  String image;
  String answer;
  bool isDone = false;
  bool isFull = false;
  List<WordFindChar> puzzles = <WordFindChar>[];
  List<String> arrayBtns = <String>[];

  WordFindQues({
    this.image,
    this.question,
    this.answer,
    this.arrayBtns,
  });

  void setWordFindChar(List<WordFindChar> puzzles) => this.puzzles = puzzles;

  void setIsDone() => isDone = true;

  bool fieldCompleteCorrect() {
    bool complete =
        puzzles.where((puzzle) => puzzle.currentValue == null).isEmpty;

    if (!complete) {
      isFull = false;
      return complete;
    }

    isFull = true;

    String answeredString =
        puzzles.map((puzzle) => puzzle.currentValue).join("");

    return answeredString == answer;
  }

  WordFindQues clone() {
    return WordFindQues(
      answer: answer,
      image: image,
      question: question,
    );
  }
}

class WordFindChar {
  String currentValue;
  int currentIndex;
  String correctValue;
  bool hintShow;

  WordFindChar({
    this.hintShow = false,
    this.correctValue,
    this.currentIndex,
    this.currentValue,
  });

  getCurrentValue() {
    if (correctValue != null) {
      return currentValue;
    } else if (hintShow) {
      return correctValue;
    }
  }

  void clearValue() {
    currentIndex = null;
    currentValue = null;
  }
}
