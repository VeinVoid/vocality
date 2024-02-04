import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocality/config/themes.dart';
import 'package:vocality/global/controllers/music_controller.dart';
import 'package:vocality/global/widgets/bottom_sheet.dart';
import 'package:vocality/views/home_page/home_controller.dart';

class HomeComponentTwo extends StatelessWidget {
  const HomeComponentTwo({
    super.key,
    required this.statusConnection,
    required this.musicData,
    required this.favouriteData,
    required this.homePageController,
    required this.musicController
  });

  final bool statusConnection;
  final List musicData;
  final List favouriteData;
  final HomePageController homePageController;
  final MusicController musicController;

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
                  child: GestureDetector(
                    onLongPress: () => Get.bottomSheet(
                      bottomSheet(
                        height: height * 0.20,
                        onTap: () { homePageController.addFavoutite(
                            musicData: musicData[index]
                          );
                          musicController.getFavouriteData();
                          Get.back();
                        },
                        title: musicData[index].title
                      ),
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                    ),
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
                              File(musicData[index].cover),
                              fit: BoxFit.cover,
                            ) : Image.network(
                              musicData[index].cover,
                              fit: BoxFit.cover,
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
                    child: GestureDetector(
                      onLongPress: () => Get.bottomSheet(
                        bottomSheet(
                          height: height * 0.20,
                          onTap: () { homePageController.addFavoutite(
                              musicData: shuffledMusicData[index]
                            );
                            musicController.getFavouriteData();
                            Get.back();
                          },
                          title: shuffledMusicData[index].title
                        ),
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                      ),
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
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: !statusConnection ? Image.file(
                                File(shuffledMusicData[index].cover),
                                fit: BoxFit.cover,
                              ) : Image.network(
                                shuffledMusicData[index].cover,
                                fit: BoxFit.cover,
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
              itemCount: favouriteData.length,
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
                          child: favouriteData[index].cover.endsWith('.png') ? Image.file(
                            File(favouriteData[index].cover),
                            fit: BoxFit.cover,
                          ) : Image.network(
                            favouriteData[index].cover,
                            fit: BoxFit.cover,
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
                          favouriteData[index].title,
                          overflow: TextOverflow.ellipsis,
                          style: tsGeneral14(
                            isHaighlight: true
                          ),
                        ),
                      ),
                      Text(
                        favouriteData[index].artist_name,
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