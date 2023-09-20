import 'package:animationpr/Model/detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/themprovider.dart';

class Detils_Page extends StatefulWidget {
  const Detils_Page({super.key});

  @override
  State<Detils_Page> createState() => _Detils_PageState();
}

class _Detils_PageState extends State<Detils_Page> {
  @override
  Widget build(BuildContext context) {
    Details D2 = ModalRoute.of(context)!.settings.arguments as Details;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 1,
          width: MediaQuery.of(context).size.width / 1,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    (Provider.of<themeprovider>(context, listen: true)
                                .theme
                                .isdark ==
                            true)
                        ? 'Asset/Images/background2.jpg'
                        : 'Asset/Images/background1.jpg'),
                fit: BoxFit.fill),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Planets",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      Provider.of<themeprovider>(context, listen: false)
                          .changetheme();
                    },
                    icon: Icon(
                      (Provider.of<themeprovider>(context, listen: true)
                                  .theme
                                  .isdark ==
                              false)
                          ? Icons.sunny
                          : Icons.brightness_4,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              height: 100,
            )),
            Text(D2.Name)
          ],
        ),
      ],
    ));
  }
}
