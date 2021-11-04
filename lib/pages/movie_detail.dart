import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_redesign/pages/dashboard.dart';

class MovieDetail extends StatelessWidget {
  final String image;
  final String title;
  final String rating;

  const MovieDetail({
    Key? key,
    required this.image,
    required this.title,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/images/background.png",
            ),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(image),
                      ),
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: BlurContainer(
                                height: true,
                                child: SvgPicture.asset(
                                    "assets/images/arrow_back.svg"),
                              ),
                            ),
                            BlurContainer(
                              height: true,
                              child: SvgPicture.asset(
                                  "assets/images/Download.svg"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "2021 . Action Adventure . Samurai",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          letterSpacing: 0.1,
                          fontSize: 10,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: mqWidgth * 0.1),
                        child: MaterialButton(
                          height: 60,
                          minWidth: double.infinity,
                          onPressed: () {},
                          color: const Color(0xffE11D24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/images/play-arrow.svg"),
                              const SizedBox(
                                width: 20.0,
                              ),
                              const Text(
                                "Watch Now",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Description(
              rating: rating,
              title: title,
            ),
          ],
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  final String title;
  final String rating;
  const Description({
    Key? key,
    required this.title,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, mqHeight * 0.2 - 60),
      child: Container(
        height: mqWidgth * 0.3,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(19, 18, 18, 0.3),
              Color.fromRGBO(19, 18, 18, 0),
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 15.0,
              sigmaY: 15.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: mqHeight * 0.2 + 10,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontFamily: "Nexa Bold",
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const BlurContainer(
                      child: Text(
                        "Popukar among friend",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                        ),
                      ),
                      height: false,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const BlurContainer(
                      child: Text(
                        "16+",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                        ),
                      ),
                      height: false,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    BlurContainer(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/Star 2.svg",
                            height: 20,
                          ),
                          Text(
                            rating,
                            style: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      height: false,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BlurContainer extends StatelessWidget {
  final bool height;
  final Widget? child;
  const BlurContainer({Key? key, required this.child, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ? 60 : 30,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(196, 196, 196, 0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 15.0,
            sigmaY: 15.0,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
