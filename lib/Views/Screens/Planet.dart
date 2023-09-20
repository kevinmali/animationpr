import 'dart:math';

import 'package:animationpr/Model/detail.dart';
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
        children: [],
      ),
    );
  }
}
