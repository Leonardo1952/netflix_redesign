import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_redesign/data/data.dart';
import 'package:netflix_redesign/pages/dashboard.dart';

class MyMovie extends StatelessWidget {
  const MyMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/background.png"),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/Image11.png"),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: moviesList.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    final MoviesModel movies = moviesList[index];
                    if (index == 0) {
                      return const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "My Movies",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 16,
                            fontFamily: "Nexa Bold",
                            color: Colors.white,
                          ),
                        ),
                      );
                    }

                    return Column(
                      children: [
                        Movie(
                          image: movies.image,
                          rating: movies.rating,
                          title: movies.title,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          const BlurContainer()
        ],
      ),
    );
  }
}

class Movie extends StatelessWidget {
  final String image;
  final String title;
  final String rating;

  const Movie({
    Key? key,
    required this.image,
    required this.title,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      height: mqHeight * 0.2,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(196, 196, 196, 0.1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 30.0,
            sigmaY: 30.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(image),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: "Nexa Bold",
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    const DiretorAndDuration(
                      title: "Keishi Ohtomo",
                      icon: "Assets/images/person-Icon.svg",
                    ),
                    const DiretorAndDuration(
                      title: "2 h 17 min",
                      icon: "Assets/imagesclock.svg",
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                width: mqWidgth * 0.1,
                margin: const EdgeInsets.only(right: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(8),
                  ),
                  color: Color(0xffffac0b),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      "assets/images/Star 3.svg",
                      height: 15,
                    ),
                    Text(
                      rating,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 11,
                        fontFamily: "Poppins",
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DiretorAndDuration extends StatelessWidget {
  final String title;
  final String icon;

  const DiretorAndDuration({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          height: 16,
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: "Poppins",
              fontSize: 11,
              fontStyle: FontStyle.normal,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class BlurContainer extends StatelessWidget {
  const BlurContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -mqWidgth * 0.1),
      transformHitTests: true,
      child: Container(
        height: mqWidgth * 0.2,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(19, 18, 18, 0.3),
              Color.fromRGBO(19, 18, 18, 0),
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 15.0,
              sigmaY: 15.0,
            ),
            child: Column(
              children: const [
                Text(
                  "Special For You ",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "The Queen's Gambit",
                  style: TextStyle(
                    fontFamily: "Nexa Bold",
                    fontSize: 24,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
