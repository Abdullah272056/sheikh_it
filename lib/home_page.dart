
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'home_page_controller.dart';


class HomePage extends StatelessWidget {

  final homePageController = Get.put(HomePageController());


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:Column(
          children: [




           Container(
             height: 300,
             child:  Stack(
               clipBehavior: Clip.none,

               children: <Widget>[
                 // Row(
                 //   children: [
                 //     Expanded(child:Image.asset(
                 //       "assets/images/loading.png",
                 //       height: 200,
                 //       width: Get.width,
                 //       fit: BoxFit.cover,
                 //
                 //     ))
                 //   ],
                 // ),

                 Positioned.fill(
                   child: Image.asset(
                     "assets/images/loading.png",
                     fit: BoxFit.cover,
                   ),
                 ),
                 Positioned(
                   bottom: -50,
                   left: 20,

                   child:InkWell(
                     onTap: (){
                       homePageController.openBottomSheet();
                     },
                     child:Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
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
                     ),

                   ),



                 ),
               ],
             ),
           )
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

