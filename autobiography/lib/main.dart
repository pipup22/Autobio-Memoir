import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'question_answer_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyPage(title: 'Flutter Demo Home Page'),
      routes: {
        '/QuestionAnswerPage': (context) => const QuestionAnswerPage(
          prompt: '',
          passedColor: 0,
          promptType: '',
        ),
      },
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key, required this.title});
  final String title;
  @override
  MyPageState createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
  
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final headerBoxWidth = screenSize.width * 0.75;

    final questionBoxWidth = screenSize.width * 0.9;
    final questionBoxHeight = screenSize.height * 0.15;
    final qBoxLower1Width = questionBoxWidth * 0.92;
    final qBoxLower2Width = qBoxLower1Width * 0.92;
    final qboxstacktransformation = screenSize.height * 0.01;

    final seperator = screenSize.height * 0.03;

    const progressCircleDiameter = 50.0;
    const progressCircleStrokeWidth = 20.0;

    const storyColor = 0xFFff6961;
    const lessonsColor = 0xFF8FC6E9;
    const eventsColor = 0xFFFFE073;

    //the following variables will be grabbed from the backend
    //firstly, these assume that we want to split the questions
    //into these three categories, stories, lessons, and events
    //
    //and secondly, these are all just examples
    //the actual amounts/prompts are yet to be decided

    int storiesProgress = 4;
    int storiesCount = 8;

    int lessonsProgress = 1;
    int lessonsCount = 5;

    int eventsProgress = 3;
    int eventsCount = 10;

    const nextStory = 'How You Met Your Current Partner';
    const nextLesson = 'The Hardest Pill You Have Ever Had To Swallow';
    const nextEvent = 'How Covid-19 Affected Your Life';

    //stories questions stack
    final List<Widget> storiesStack = [
    Container( 
      height: questionBoxHeight,
      width: qBoxLower2Width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFF1F6F3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(1),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      transform: Matrix4.translationValues((questionBoxWidth - qBoxLower2Width)/2, qboxstacktransformation * 2, 0),
    ),
    Container(
      height: questionBoxHeight,
      width: qBoxLower1Width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFF1F6F3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(1),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      transform: Matrix4.translationValues((questionBoxWidth - qBoxLower1Width)/2, qboxstacktransformation, 0),
    ),
    GestureDetector( //top of list
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const QuestionAnswerPage(
              prompt: nextStory,
              passedColor: storyColor,
              promptType: 'Story',
            )
          ),
        );
      },
      child: Container(
        height: questionBoxHeight,
        width: questionBoxWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFFF1F6F3),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(1),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: questionBoxWidth * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Story',
                    style: TextStyle(
                      color: Color(storyColor), 
                      fontWeight: FontWeight.w700,
                      fontSize: 20
                    ),
                  ),
                  Text(
                    '#${(storiesProgress + 1).toString()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: questionBoxWidth * 0.4,
              child: const Text(
                nextStory,
                textAlign: TextAlign.center, 
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              width: questionBoxWidth * 0.3,
              child: const IconTheme(
                data: IconThemeData(
                  color: Color(storyColor),
                  size: 40,
                ),
                child: Icon(FontAwesomeIcons.pen),
              ),
            ),
          ],
        ),
      ),
    ),
  ];

  //lessons questions stack
  final List<Widget> lessonsStack = [
    Container( 
      height: questionBoxHeight,
      width: qBoxLower2Width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFF1F6F3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(1),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      transform: Matrix4.translationValues((questionBoxWidth - qBoxLower2Width)/2, qboxstacktransformation * 2, 0),
    ),
    Container(
      height: questionBoxHeight,
      width: qBoxLower1Width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFF1F6F3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(1),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      alignment: Alignment.center,
      transform: Matrix4.translationValues((questionBoxWidth - qBoxLower1Width)/2, qboxstacktransformation, 0),
    ),
    GestureDetector( //top of list
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const QuestionAnswerPage(
              prompt: nextLesson,
              passedColor: lessonsColor,
              promptType: 'Lesson',
            )
          ),
        );
      },
      child: Container(
        height: questionBoxHeight,
        width: questionBoxWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFFF1F6F3),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(1),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: questionBoxWidth * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Lesson',
                    style: TextStyle(
                      color: Color(lessonsColor), 
                      fontWeight: FontWeight.w700,
                      fontSize: 20
                    ),
                  ),
                  Text(
                    '#${(lessonsProgress + 1).toString()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: questionBoxWidth * 0.4,
              child: const Text(
                nextLesson,
                textAlign: TextAlign.center, 
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              width: questionBoxWidth * 0.3,
              child: const IconTheme(
                data: IconThemeData(
                  color: Color(lessonsColor),
                  size: 40,
                ),
              child: Icon(FontAwesomeIcons.pen),
              ),
            ),
          ],
        ),
      ),
    ),
  ];

  //events questions stack
  final List<Widget> eventsStack = [
    Container( 
      height: questionBoxHeight,
      width: qBoxLower2Width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFF1F6F3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(1),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      transform: Matrix4.translationValues((questionBoxWidth - qBoxLower2Width)/2, qboxstacktransformation * 2, 0),
    ),
    Container(
      height: questionBoxHeight,
      width: qBoxLower1Width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFF1F6F3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(1),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      alignment: Alignment.center,
      transform: Matrix4.translationValues((questionBoxWidth - qBoxLower1Width)/2, qboxstacktransformation, 0),
    ),
    GestureDetector( //top of list
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const QuestionAnswerPage(
              prompt: nextEvent,
              passedColor: eventsColor,
              promptType: 'Event',
            )
          ),
        );
      },
      child: Container(
        height: questionBoxHeight,
        width: questionBoxWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFFF1F6F3),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(1),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: questionBoxWidth * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Event',
                    style: TextStyle(
                      color: Color(eventsColor), 
                      fontWeight: FontWeight.w700,
                      fontSize: 20
                    ),
                  ),
                  Text(
                    '#${(eventsProgress + 1).toString()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: questionBoxWidth * 0.4,
              child: const Text(
                nextEvent,
                textAlign: TextAlign.center, 
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              width: questionBoxWidth * 0.3,
              child: const IconTheme(
                data: IconThemeData(
                  color: Color(eventsColor),
                  size: 40,
                ),
              child: Icon(FontAwesomeIcons.pen),
              ),
            ),
          ],
        ),
      ),
    ),
  ];

    return Scaffold(
      body: Container(
        width: screenSize.width,
        decoration: const BoxDecoration(
          color: Color(0xFF000000),
          /*image: DecorationImage(
            image: AssetImage('images/statspagebackground.png'),
            fit: BoxFit.cover,
          ),*/
          /*gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF7B707B), Color(0xFF19141A)], //background gradient
          ),*/
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25), 
              child: 
                Container( // progress box
                height: 175,
                width: headerBoxWidth,
                margin: EdgeInsets.only(top: seperator),
                decoration: BoxDecoration(
                  color: const Color(0xFF261F25).withOpacity(0.95),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.75),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row( //progress row
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column( //text column
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Stories', 
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Text(
                            '${storiesProgress.toString()}/${storiesCount.toString()}', 
                            style: const TextStyle(
                              color: Color(storyColor), 
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const Text('Lessons', 
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Text(
                            '${lessonsProgress.toString()}/${lessonsCount.toString()}', 
                            style: const TextStyle(
                              color: Color(lessonsColor), 
                              fontWeight: FontWeight.w700,
                              fontSize: 20
                              ),
                          ),
                        ),
                        const Text('Events', 
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Text(
                            '${eventsProgress.toString()}/${eventsCount.toString()}', 
                            style: const TextStyle(
                              color: Color(eventsColor), 
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack( //stories progress stack
                      alignment: AlignmentDirectional.center,
                      children: [
                        SizedBox(
                          width: progressCircleDiameter + progressCircleStrokeWidth * 4,
                          height: progressCircleDiameter + progressCircleStrokeWidth * 4,
                          child: CircularProgressIndicator(
                            value: storiesProgress/storiesCount, 
                            strokeWidth: progressCircleStrokeWidth, 
                            color: const Color(storyColor), 
                            backgroundColor: const Color(storyColor).withOpacity(0.1),                        
                          ),
                        ),
                        SizedBox(
                          width: progressCircleDiameter + progressCircleStrokeWidth * 2,
                          height: progressCircleDiameter + progressCircleStrokeWidth * 2,
                          child: CircularProgressIndicator(
                            value: lessonsProgress/lessonsCount, 
                            strokeWidth: progressCircleStrokeWidth, 
                            color: const Color(lessonsColor), 
                            backgroundColor: const Color(lessonsColor).withOpacity(0.1),
                          ),
                        ),
                        SizedBox(
                          width: progressCircleDiameter,
                          height: progressCircleDiameter,
                          child:  CircularProgressIndicator(
                            value: eventsProgress/eventsCount, 
                            strokeWidth: progressCircleStrokeWidth, 
                            color: const Color(eventsColor), 
                            backgroundColor: const Color(eventsColor).withOpacity(0.1),
                          ),
                        ),
                      ],
                    ),                                     
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: seperator),
              child: Stack( //stories stack
                children: storiesStack,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: seperator),
              child: Stack( //lessons stack
                children: lessonsStack,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: seperator),
              child: Stack( //events stack
                children: eventsStack,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: screenSize.width,
                  height: 70,
                  color: const Color(0xFF222222),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30), 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        IconTheme(
                          data: IconThemeData(
                            color: Color(0xFF666666),
                            size: 35,
                          ),
                          child: Icon(Icons.home),
                        ),
                        IconTheme(
                          data: IconThemeData(
                            color: Color(lessonsColor),
                            size: 35,
                          ),
                          child: Icon(FontAwesomeIcons.pen),
                        ),
                        IconTheme(
                          data: IconThemeData(
                            color: Color(0xFF666666),
                            size: 35,
                          ),
                          child: Icon(FontAwesomeIcons.list),
                        ),
                        IconTheme(
                          data: IconThemeData(
                            color: Color(0xFF666666),
                            size: 35,
                          ),
                          child: Icon(FontAwesomeIcons.gear),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
