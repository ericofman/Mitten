import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: StoreHomePage(),
    );
  }
}

class StoreHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String assetName = 'assets/choose.svg';

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          previousPageTitle: '',
          onPressed: () {},
        ),
        middle: const Text('Choose Fast'),
      ),
      child: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [const Color(0xFFEFEEF3), const Color(0xFFFFFFFF)],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 50,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color(0xFFE0DCF8),
                              const Color(0xFFF6F6F6)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        width: 112,
                        height: 112,
                      ),
                    ),
                    SvgPicture.asset(
                      assetName,
                      width: 121,
                      height: 141,
                    )
                  ],
                ),
              ),
              Text(
                "Choose an intermittent\n fasting style",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w700,
                  fontSize: 22.0,
                  letterSpacing: 0.32,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Choose a fasting style that you can stick with",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w300,
                  fontSize: 11.0,
                  color: const Color(0xFF9F9F9F),
                  letterSpacing: 0.34,
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  children: <Widget>[
                    drawCard(context, 8, true),
                    SizedBox(height: 15),
                    drawCard(context, 6, false),
                    SizedBox(height: 15),
                    drawCard(context, 4, false),
                    SizedBox(height: 15),
                    drawCard(context, 0, false),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container drawCard(BuildContext context, int eatingWindow, bool popular) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: Offset(0, 3),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width - 50,
      height: 121,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: isPopular(popular),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(29),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFFB883EA),
                        const Color(0xFFD9B1FF)
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "$eatingWindow",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Hours",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 7.0,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal),
                      ),
                    ],
                  ),
                  width: 30,
                  height: 30,
                ),
              ),
              Text(
                "${24 - eatingWindow}:$eatingWindow",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "OpenSans",
                  fontSize: 21.0,
                  letterSpacing: 0.34,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(69, 10, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "A ${24 - eatingWindow} hour fast with an $eatingWindow hour\nfeeding window.",
                  style: TextStyle(
                    color: Color(0xFF9E9E9E),
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w100,
                    fontSize: 14.0,
                    letterSpacing: 0.34,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container isPopular(bool popular) {
    if (popular == true) {
      return Container(
        decoration: BoxDecoration(
            color: const Color(0xFF9892FD),
            borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(15.0),
              bottomRight: const Radius.circular(15.0),
            )),
        height: 17,
        width: 136,
        child: Center(
          child: Text(
            "MOST POPULAR",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.w700,
              fontSize: 7.0,
              color: Colors.white,
              letterSpacing: 0.34,
            ),
          ),
        ),
      );
    } else {
      return Container(
        height: 17,
      );
    }
  }
}
