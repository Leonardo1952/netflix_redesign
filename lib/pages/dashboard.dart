import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:netflix_redesign/data/data.dart';

late double mqHeight;
late double mqWidgth;

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mqHeight = MediaQuery.of(context).size.height;
    mqWidgth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/images/background.png",
            ),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CurrentUser(),
                    const MyTextField(),
                    const ListTile(
                      leading: Text(
                        "Category",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      width: mqWidgth,
                      height: mqHeight * 0.1 + 20,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          reverse: true,
                          shrinkWrap: true,
                          itemCount: categoryList.length,
                          itemBuilder: (BuildContext context, int index) {
                            final CategoryModel category = categoryList[index];
                            return Category(
                              image: category.image,
                              name: category.name,
                            );
                          }),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image;
  final String name;

  const Category({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mqWidgth * 0.2,
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromRGBO(196, 196, 196, 0.1)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 30.0,
            sigmaY: 30.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                image,
                height: 30,
              ),
              Text(
                name,
                style: const TextStyle(
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    fontSize: 12.0,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CurrentUser extends StatelessWidget {
  const CurrentUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi, ${currentUser[0].name}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  fontFamily: "Nexa Bold",
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "See what's Next",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 24,
                  fontFamily: "Popppins",
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: const Color(0xffD3D6DA),
            backgroundImage: AssetImage(currentUser[0].image),
          ),
        ],
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mqHeight * 0.1 - 20,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 0.1),
          borderRadius: BorderRadius.circular(20.0)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10.0,
            sigmaY: 10.0,
          ),
          child: TextField(
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(
                  "assets/images/search.svg",
                ),
              ),
              hintText: "Search Movies",
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins",
                color: Color(0xff969696),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(
                  "assets/images/microphone.svg",
                ),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
