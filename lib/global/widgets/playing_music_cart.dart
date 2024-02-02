import 'package:flutter/material.dart';
import 'package:vocality/config/themes.dart';

Widget playingMusicCard({
  required double height, 
  required double width, 
}) {
  return Row(
    children: [
      Container(
        margin: EdgeInsets.only(
          top: height * 0.01
        ),
        width: width * 0.9,
        height: height * 0.09,
        decoration: dnCircular(
          radiusCircular: 5, 
          colorCircular: Colors.black12
        ),
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: height * 0.015
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: width * 0.035,
                ),
                width: width * 0.13,
                height: height,
                decoration: dnCircular(
                  radiusCircular: 5, 
                  colorCircular: Color.fromARGB(255, 255, 0, 0)
                )
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: width * 0.035
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'asas',
                      style: tsGeneral16(
                        isHaighlight: true
                      ),
                    ),
                    Text(
                      'asas',
                      style: tsGeneral14(
                        isHaighlight: true
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}