import 'package:flutter/material.dart';

class QuestionAnswerPage extends StatelessWidget {
  final String prompt;
  final int passedColor;
  final String promptType;

  const QuestionAnswerPage({
    required this.prompt,
    required this.passedColor,
    required this.promptType,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                promptType,
                style: TextStyle(
                  color: Color(passedColor), 
                  fontWeight: FontWeight.w700,
                  fontSize: 22
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10), 
              child: Text(
                'Prompt: $prompt',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 10), 
                child: TextField(
                  maxLines: null,
                  style: TextStyle(
                    fontSize: 20,
                  ), 
                  decoration: InputDecoration(
                    hintText: 'Write...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Are you sure you are ready to submit?"),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center, 
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ], 
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(110,45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Submit",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}