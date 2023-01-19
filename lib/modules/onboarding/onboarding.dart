import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sale_hunter/modules/sign_in/sign_in.dart';
import 'package:sale_hunter/shared/components/constants.dart';
import 'package:sale_hunter/shared/style/text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../settings/language.dart';





class Onboarding_Screen extends StatefulWidget {
  @override
  State<Onboarding_Screen> createState() => _Onboarding_ScreenState();
}

class _Onboarding_ScreenState extends State<Onboarding_Screen> {
  int currentIndex = 0;
  PageController _controller;
  var boardingController = PageController();

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _lang = Provider.of<Language>(context);

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Expanded(
          child: PageView.builder(
            physics: BouncingScrollPhysics(),
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemCount: boarding.length,
            controller: boardingController,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ///Skip
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(500, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Sign_In_Screen()),
                              );
                            },
                            child: Text(
                              '${boarding[index].skip}',
                              style: MyTextStyle.skip,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  ///Image
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                      width: 377.682373046875,
                      height: 377.682373046875,
                      child: Image(
                        image: AssetImage('${boarding[index].image}'),
                      ),
                    ),
                  ),

                  ///title
                  Text("${boarding[index].title}",
                      style: MyTextStyle.title),

                  ///description
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(60, 30, 60, 10),
                      child: Column(
                        children: [
                          Text("${boarding[index].descriotion}",
                              style: MyTextStyle.description),

                          ///SmoothPageIndecator
                          Expanded(
                            flex: 1,
                            child: SmoothPageIndicator(
                              count: boarding.length,
                              controller: boardingController,
                              effect: ExpandingDotsEffect(
                                dotColor: Color(0x4d707070),
                                dotHeight: 8.0,
                                dotWidth: 8.0,
                                spacing: 5.0,
                              ),
                            ),
                          ),

                          ///Buttom
                          Container(
                            width: 368,
                            height: 56,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                colors: [Color(0xff8743ff), Color(0xff4136f1)],
                                stops: [0, 1],
                                begin: Alignment(1.00, -0.00),
                                end: Alignment(-1.00, 0.00),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0x291466cc),
                                    offset: Offset(0, 15),
                                    blurRadius: 30,
                                    spreadRadius: 0)
                              ],
                            ),
                            child: TextButton(
                              onPressed: () {
                                boardingController.nextPage(
                                    duration: Duration(
                                      microseconds: 100,
                                    ),
                                    curve: Curves
                                        .fastLinearToSlowEaseIn);
                                if (currentIndex == 3) {
                                  // Navigate to next screen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Sign_In_Screen()),
                                  );
                                }
                                _controller.nextPage(
                                    duration:
                                        Duration(milliseconds: 100),
                                    curve: Curves.bounceIn);
                              },
                              child: Center(
                                child:
                                    Text('${boarding[index].tButton}',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Color(0xffffffff),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                        )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
