import 'dart:math';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project2022/view/screens/user/conExperts.dart';
import 'package:sizer/sizer.dart';
import 'package:project2022/constants/colors.dart';
import '../../../Logic/Api/Controllers/ExpertController.dart';
import '../../../Logic/STM/controller/localController.dart';
import '../../../constants/fonts.dart';
import '../../../constants/images.dart';
import '../../../constants/routes.dart';
import '../../../main.dart';
import 'package:project2022/constants/routes.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MainScreen extends StatelessWidget {

  String? path = sharedPref?.getString("path");

  List titles = [
    'Medical',
    'professional',
    'Mental',
    'familial',
    'Business',
  ];

  List rates = [
    '8',
    '7.5',
    '9',
    '5',
    '10',
  ];

  List images = [
    Images.medical,
    Images.proffisional,
    Images.mental,
    Images.family,
    Images.business,
  ];

  @override
  Widget build(BuildContext context) {
    localController controller = Get.find();
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SafeArea(
            child: Container(
              height: 37.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      Images.two,
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.sp),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 8.h,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 6.w),
                            child: CircleAvatar(
                              radius: 20.sp,
                              foregroundImage:
                              path == null ? null : FileImage(File(path!)),
                            )),
                        Padding(
                          padding: EdgeInsets.only(left:3.w),
                          child: Text(
                            '${sharedPref?.getString("name")}',
                            style: TextStyle(
                              letterSpacing: 0.8,
                              fontWeight: FontWeight.bold,
                              fontFamily: Fonts.g,
                              fontSize: 20.sp,
                              color: Color(color.blue),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 3.h,),
                Padding(
                  padding: EdgeInsets.only(
                    right: 15.w,
                  ),
                  child: Text(
                    'Appoitment with \n a expert',
                    style: TextStyle(
                      letterSpacing: 0.8,
                      fontFamily: Fonts.c,
                      fontSize: 30.sp,
                      color: Color(color.blue),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 2.h, left: 7.w),
                      height: 6.5.h,
                      width: 85.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          15.sp,
                        ),
                        color: Colors.white.withOpacity(0.60),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 4.w),
                        child: Row(
                          children: [
                            Icon(Icons.search),
                            Text('Serach for experts'),
                            SizedBox(
                              width: 32.4.w,
                            ),
                            Container(
                              height: 6.5.h,
                              width: 15.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(15.sp),
                                ),
                                color: Color(color.blue),
                              ),
                              child: Icon(
                                Icons.tune,
                                size: 25.sp,
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6.h,
                ),
                Container(
                  height: 50.h,
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (c, i) {
                        return Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(
                                left: 5.w,
                              ),
                              child: Text(
                                'How can we help you ?',
                                style: TextStyle(
                                  fontFamily: Fonts.h,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.sp,
                                  color: Color(color.blue),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: 2.w,
                              ),
                              margin: EdgeInsets.only(
                                left: 1.w,
                                right: 1.w,
                              ),
                              height: 14.h,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (c, i) {
                                  return InkWell(
                                    radius: 5.sp,
                                    borderRadius: BorderRadius.circular(50.sp),
                                    onTap: () {
                                      sharedPref?.setString(
                                          "consulting_name", titles[i]);
                                      sharedPref?.setInt("consulting", i + 1);
                                      Get.to(ConExperts());
                                      print(i);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        left: 3.w,
                                        right: 3.w,
                                        top: 2.h,
                                        bottom: 2.h,
                                      ),
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          15.sp,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.20),
                                            blurRadius: 10,
                                            spreadRadius: 1,
                                          ),
                                        ],
                                        color: Color(color.white),
                                      ),
                                      child: Stack(
                                        alignment: Alignment.topCenter,
                                        children: [
                                          Lottie.asset(
                                            images[i],
                                            alignment: Alignment.center,
                                            height: 7.h,
                                          ),
                                          Positioned(
                                            bottom: 12,
                                            child: Text(
                                              titles[i],
                                              style: TextStyle(
                                                fontFamily: Fonts.a,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10.sp,
                                                color: Color(color.blue),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    width: 1.w,
                                  );
                                },
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(
                                top: 1.h,
                                left: 5.w,
                              ),
                              child: Text(
                                'Popular Experts ',
                                style: TextStyle(
                                  fontFamily: Fonts.h,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.sp,
                                  color: Color(color.blue),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: 1.w,
                                right: 1.w,
                              ),
                              margin: EdgeInsets.only(
                                left: 1.w,
                                right: 1.w,
                                top: 0.5.h,
                              ),
                              height: 32.h,
                              child:  StatefulBuilder(
                                builder: (context, setState) {
                                  return  FutureBuilder<dynamic>(
                                    future: ExpertController.getexperts(),
                                    builder:
                                        (context, AsyncSnapshot<dynamic> snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else {
                                        return GridView.builder(
                                          itemCount: snapshot.data[0].length,
                                          padding: EdgeInsets.only(
                                            top: 2.h,
                                            left: 3.w,
                                            right: 3.w,
                                          ),
                                          gridDelegate:
                                          SliverWovenGridDelegate.count(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 8,
                                            crossAxisSpacing: 8,
                                            pattern: [
                                              WovenGridTile(1),
                                              WovenGridTile(
                                                5 / 7,
                                                crossAxisRatio: 0.9,
                                                alignment:
                                                AlignmentDirectional.centerEnd,
                                              ),
                                            ],
                                          ),
                                          itemBuilder: (context, index) {
                                            return ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(10.sp),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      "https://picsum.photos/${Random().nextInt(20) + 100}/${Random().nextInt(30) + 80}",
                                                    ),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Colors.transparent,
                                                        Colors.black
                                                            .withOpacity(0.75),
                                                      ],
                                                      begin: Alignment.topCenter,
                                                      end: Alignment.bottomCenter,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        10.sp),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 5.w,
                                                      bottom: 2.h,
                                                    ),
                                                    child: Stack(
                                                      alignment:
                                                      Alignment.bottomLeft,
                                                      children: [
                                                        Positioned(
                                                          top: 2.h,
                                                          right: 4.w,
                                                          child: Icon(
                                                            Icons.favorite,
                                                            color: Color(color.red),
                                                            size: 20.sp,
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 2.5.h,
                                                          right: 16.w,
                                                          child: Text(
                                                            '${snapshot.data[0][index]["name"]}',
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 15.sp,
                                                              fontFamily: Fonts.a,
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          right: 16.w,
                                                          child: Text(
                                                            '${snapshot.data[0][index]['address']}',
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 10.sp,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }
                                    },
                                  );
                                },
                              ),

                            ),
                          ],
                        );
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
