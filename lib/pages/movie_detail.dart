import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            image: AssetImage(
              "assets/images/background.png",
            ),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Expanded(
              flex: 3,
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
                          child: SvgPicture.asset("assets/images/Download.svg"),
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
                    "2021. Action Adventure . Samurai",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 0.1,
                      fontSize: 10,
                    ),
                  ),
                  MaterialButton(
                    height: 60,
                    minWidth: double.infinity,
                    onPressed: () {},
                    color: const Color(0xffE11D24),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlurContainer extends StatelessWidget {
  final bool height;
  final Widget? child;
  const BlurContainer({
    Key? key,
    required this.height,
    required this.child,
  }) : super(key: key);

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
