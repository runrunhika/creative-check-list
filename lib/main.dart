import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> listitems = [
    'Buy Apples',
    'Study Physics',
    'Push one Rank in Apex Legends',
    'Finish the Home Work in Jave',
    'Subscribe Am I Worthy Youtube channel',
    'Make sure to dislike the unworthy contents'
  ];

  List<Color> color = [
    Colors.green,
    Colors.blueAccent,
    Colors.red,
    Colors.orange,
    Colors.purple,
    Colors.pink,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 550,
          width: 440,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)]),
          child: Column(
            children: [
              Container(
                height: 120,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 15),
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(8))),
                alignment: Alignment(-1.0, 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "To Do",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Column(
                children: listitems
                    .map((text) => CustomCheckList(text,
                        color: color[listitems.indexOf(text)]))
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCheckList extends StatefulWidget {
  final String text;
  final Color color;

  const CustomCheckList(this.text, {required this.color});

  @override
  _CustomCheckListState createState() => _CustomCheckListState();
}

class _CustomCheckListState extends State<CustomCheckList> {
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: widget.color.withOpacity(.3),
        hoverColor: widget.color.withOpacity(.1),
        highlightColor: widget.color.withOpacity(.2),
        onTap: () {
          setState(() {
            isDone = !isDone;
          });
        },
        child: Container(
          height: 65,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Row(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 375),
                curve: Curves.easeInOutCubic,
                margin: EdgeInsets.only(right: 20),
                height: isDone ? 22 : 24,
                width: isDone ? 22 : 24,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(
                      width: 1.5,
                      color:
                          isDone ? widget.color.withOpacity(.5) : widget.color,
                    )),
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 375),
                  curve: Curves.easeInCubic,
                  opacity: isDone ? 1 : 0,
                  child: Icon(
                    Icons.check_rounded,
                    size: 17,
                    color: widget.color,
                  ),
                ),
              ),
              Stack(
                children: [
                  Align(
                    alignment: Alignment(0, 0),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 375),
                      height: 1.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: widget.color),
                      width: isDone ? widget.text.length * 6.5 : 0,
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0),
                    child: AnimatedPadding(
                      padding: EdgeInsets.only(left: isDone ? 0 : 10),
                      duration: Duration(milliseconds: 375),
                      curve: Curves.easeInCubic,
                      child: Text(
                        widget.text,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.2,
                            color: isDone ? Colors.black : widget.color),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
