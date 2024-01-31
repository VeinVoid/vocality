import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vocality/config/themes.dart';

class HomeComponentOne extends StatelessWidget {
  const HomeComponentOne({super.key});

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.sizeOf(context).width;
    double height= MediaQuery.sizeOf(context).height;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hallo",
                style: tsGeneral16(),
              ), 
              Text(
                "Volico",
                style: tsHeader(),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: height * 0.002
                ),
                child: Row(
                  children: [
                    Container(
                      width: width * 0.14,
                      height: height * 0.008,
                      decoration: dnCircular(
                        radiusCircular: 15, 
                        colorCircular: generalColorDark
                      )
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: width * 0.005
                      ),
                      width: width * 0.02,
                      height: height * 0.008,
                      decoration: dnCircular(
                        radiusCircular: 15, 
                        colorCircular: generalColorGray
                      )
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: width * 0.005
                      ),
                      width: width * 0.02,
                      height: height * 0.008,
                      decoration: dnCircular(
                        radiusCircular: 15, 
                        colorCircular: generalColorGray
                      )
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: width * 0.005
                      ),
                      width: width * 0.02,
                      height: height * 0.008,
                      decoration: dnCircular(
                        radiusCircular: 15, 
                        colorCircular: generalColorGray
                      )
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: height * 0.015
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: width * 0.1,
                  height: width * 0.1,
                  decoration: dnCircular(
                    radiusCircular: 100, 
                    colorCircular: generalColorDark
                  ),
                ),
                SvgPicture.asset(
                  width: width * 0.06,
                  icNotification
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}