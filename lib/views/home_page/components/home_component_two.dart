import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocality/config/themes.dart';

class HomeComponentTwo extends StatelessWidget {
  const HomeComponentTwo({
    super.key,
    required this.statusConnection,
    required this.musicData
  });

  final bool statusConnection;
  final List musicData;

  @override
  Widget build(BuildContext context) {
    
    double width = MediaQuery.sizeOf(context).width;
    double height= MediaQuery.sizeOf(context).height;

    return Container(
      child: Column(
        children: [
          Container(
            width: width,
            height: height * 0.18,
            decoration: dnCircular(
              radiusCircular: 5, 
              colorCircular: Colors.black12
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "New Album",
                style: tsGeneral16(
                  isHaighlight: true
                ),
              ),
              Text(
                "See all",
                style: tsGeneral16(
                  isHaighlight: true
                ),
              )
            ],
          ),
          Obx(() => Container(
            width: width,
            height: height * 0.25,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: musicData.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                    left: index > 0 ? width * 0.05 : 0,
                  ),
                  height: height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: height * 0.01
                        ),
                        width: width * 0.3,
                        height: height * 0.14,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: !statusConnection ? Image.file(
                            File('/data/user/0/com.example.vocality/app_flutter/Cover/Ada.png'),
                            fit: BoxFit.cover,
                          ) : Image.network(
                            musicData[index].cover,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        width: width * 0.3,
                        height: height * 0.025,
                        margin: EdgeInsets.only(
                          top: height * 0.01
                        ),
                        child: Text(
                          musicData[index].title,
                          overflow: TextOverflow.ellipsis,
                          style: tsGeneral14(
                            isHaighlight: true
                          ),
                        ),
                      ),
                      Text(
                        musicData[index].artist_name,
                        style: tsGeneral12(
                          isHaighlight: true
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recenly",
                style: tsGeneral16(
                  isHaighlight: true
                ),
              ),
              Text(
                "See all",
                style: tsGeneral16(
                  isHaighlight: true
                ),
              )
            ],
          ),
          Obx(() {
            List shuffledMusicData = List.from(musicData);
            shuffledMusicData.shuffle();
            
            return Container(
              width: width,
              height: height * 0.25,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: shuffledMusicData.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                      left: index > 0 ? width * 0.05 : 0,
                    ),
                    height: height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: height * 0.01
                          ),
                          width: width * 0.3,
                          height: height * 0.14,
                          decoration: dnCircular(
                            radiusCircular: 5, 
                            colorCircular: Colors.black12
                          ),
                          child: !statusConnection ? Image.file(
                            File(shuffledMusicData[index].cover),
                            fit: BoxFit.cover,
                          ) : Image.network(
                            musicData[index].cover,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          width: width * 0.3,
                          height: height * 0.025,
                          margin: EdgeInsets.only(
                            top: height * 0.01
                          ),
                          child: Text(
                            shuffledMusicData[index].title,
                            overflow: TextOverflow.ellipsis,
                            style: tsGeneral14(
                              isHaighlight: true
                            ),
                          ),
                        ),
                        Text(
                          shuffledMusicData[index].artist_name,
                          style: tsGeneral12(
                            isHaighlight: true
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Favourite",
                style: tsGeneral16(
                  isHaighlight: true
                ),
              ),
              Text(
                "See all",
                style: tsGeneral16(
                  isHaighlight: true
                ),
              )
            ],
          ),
          Obx(() => Container(
            width: width,
            height: height * 0.25,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: musicData.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                    left: index > 0 ? width * 0.05 : 0,
                  ),
                
                  height: height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: height * 0.01
                        ),
                        width: width * 0.3,
                        height: height * 0.14,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: !statusConnection ? Image.file(
                            File('/data/user/0/com.example.vocality/app_flutter/Cover/Ada.png'),
                            fit: BoxFit.cover,
                          ) : Image.network(
                            musicData[index].cover,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        width: width * 0.3,
                        height: height * 0.025,
                        margin: EdgeInsets.only(
                          top: height * 0.01
                        ),
                        child: Text(
                          musicData[index].title,
                          overflow: TextOverflow.ellipsis,
                          style: tsGeneral14(
                            isHaighlight: true
                          ),
                        ),
                      ),
                      Text(
                        musicData[index].artist_name,
                        style: tsGeneral12(
                          isHaighlight: true
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          )),
        ],
      ),
    );
  }
}