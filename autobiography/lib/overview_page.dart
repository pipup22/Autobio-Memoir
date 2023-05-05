import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OverviewPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final headerBoxWidth = screenSize.width * 0.75;
    final headerBoxHeight = screenSize.height * 0.25;

    return Scaffold(
      body: Container(
        height: headerBoxHeight,
        width: headerBoxWidth,
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
        child: Column( //top box / editing box
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10), 
              child: const Text(
                "My Novel",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: const Text(
                "My Example Title",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15), 
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: headerBoxWidth * 0.8,
                      margin: const EdgeInsets.only(bottom: 10),
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.5),
                        color: const Color(0xFF333333),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: headerBoxWidth / 3,
                          child: const Text(
                            '127 Pages',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: headerBoxWidth / 3,
                          child: const IconTheme(
                            data: IconThemeData(
                              color: Colors.grey,
                              size: 30,
                            ),
                            child: Icon(FontAwesomeIcons.penToSquare),
                          ),
                        ),
                        SizedBox(
                          width: headerBoxWidth / 3,
                          child: const Text(
                            '8 Chapters',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}