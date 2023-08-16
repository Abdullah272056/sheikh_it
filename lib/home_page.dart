
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'home_page_controller.dart';


class HomePage extends StatelessWidget {

  final homePageController = Get.put(HomePageController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 55),
                  child:  Row(
                    children: [
                      Expanded(child: Image.asset(
                        "assets/images/bg.jpg",
                        fit: BoxFit.cover,
                      ))
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 20,
                  child:Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60.0),
                          color: Colors.black,
                          border: Border.all(
                            color: Colors.white38, // Border color
                            width: 2.5,         // Border width
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60.0),
                          child: Container(
                            height: 120,
                            width: 120,
                            child:Obx(() => FadeInImage.assetNetwork(
                              fit: BoxFit.cover,
                              placeholder: 'assets/images/loading.jpg',
                              image:
                              "https://fnfbuy.bizoytech.com/public/frontend/profile/${homePageController.imageLink.value}",
                              imageErrorBuilder: (context, url, error) =>
                                  Image.asset(
                                    'assets/images/loading.jpg',
                                    fit: BoxFit.cover,
                                  ),
                            )),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: InkWell(
                            onTap: (){
                              homePageController.openBottomSheet() ;
                            },
                            child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    border: Border.all(
                                      color: Colors.white38, // Border color
                                      width: 2.0,         // Border width
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                ),
                                child: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 14,
                                )
                            )


                        ),



                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }




  @override
  Widget build1(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 55),
                  child:  Row(
                    children: [
                      Expanded(child: Image.asset(
                        "assets/images/loading.png",
                        fit: BoxFit.cover,
                      ))
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0, // Adjusted position, no longer negative
                  left: 20,
                  child:Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60.0),

                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60.0),
                            color: Colors.black26,

                            border: Border.all(
                              color: Colors.blue, // Border color
                              width: 2.0,         // Border width
                            ),),
                          height: 120,
                          width: 120,

                          child: InkResponse(
                            child: Obx(() => FadeInImage.assetNetwork(
                              fit: BoxFit.cover,
                              placeholder: 'assets/images/images.jpeg',
                              image:
                              "https://fnfbuy.bizoytech.com/public/frontend/profile/" +
                                  homePageController.imageLink.value,
                              imageErrorBuilder: (context, url, error) =>
                                  Image.asset(
                                    'assets/images/images.jpeg',
                                    fit: BoxFit.cover,
                                  ),
                            )),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -6, // Adjusted position, no longer negative
                        right: -6, // Adjusted position, no longer negative
                        child: IconButton(
                          onPressed: () {
                            homePageController.showToastShort("sdgf");
                          },
                          icon: Icon(
                            Icons.camera_alt,
                            color: Colors.black,
                            size: 27,
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildImageSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        Stack(
          children: [
            InkResponse(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60.0),
                child: Container(
                    height: 120,
                    width: 120,
                    color: Colors.black26,
                    child:InkResponse(
                      child: Obx(() => FadeInImage.assetNetwork(
                        fit: BoxFit.cover,
                        placeholder: 'assets/images/images.jpeg',
                        image: "https://fnfbuy.bizoytech.com/public/frontend/profile/"+homePageController.imageLink.value,
                        imageErrorBuilder: (context, url, error) => Image.asset(
                          'assets/images/images.jpeg',
                          fit: BoxFit.cover,
                        ),
                      )),
                    )),
              ),

            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 80,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    IconButton(
                        onPressed: () {
                         // homePageController.openBottomSheet();
                         },
                        icon: Icon(
                          Icons.camera_alt,
                          color: Colors.black,
                          size: 27,
                        ))
                  ],
                ),
              ],
            )
          ],
        ),


      ],
    );
  }




}

