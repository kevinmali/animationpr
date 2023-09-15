import 'dart:math';

import 'package:flutter/material.dart';

class PlanetWidget extends StatefulWidget {
  String planetName;
  String image;
  String description;

  PlanetWidget(this.planetName, this.image, this.description);

  @override
  State<PlanetWidget> createState() => _PlanetWidgetState();
}

class _PlanetWidgetState extends State<PlanetWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 100, bottom: 30),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)),
              color: Colors.white,
              child: Container(
                width: double.infinity,
                height: size.height,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80,
                      ),
                      Text(
                        widget.planetName,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.description,
                        style: TextStyle(color: Colors.black54),
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: TweenAnimationBuilder(
              tween: Tween<double>(
                begin: 0,
                end: 2 * pi,
              ),
              duration: const Duration(seconds: 16),
              child: Hero(
                tag: 'hii',
                child: Image.asset(
                  widget.image,
                  width: 180,
                ),
              ),
              builder: (context, value, widget) {
                return Transform.rotate(
                  angle: value,
                  child: widget,
                );
              },
            ),
            //   child:
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              child: Container(
                width: 50,
                height: 50,
                child: Card(
                  color: Colors.yellow,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('Detils');
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
