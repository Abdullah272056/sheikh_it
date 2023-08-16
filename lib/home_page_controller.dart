
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;


class HomePageController extends GetxController {


  var token="120|wR9S7ho3dcnD6jjpWW3h6zwfcvp4HQMoh1gjTuD1".obs;
  var imageLink="".obs;

  PickedFile? _fornt_imageFile;
  final ImagePicker _fornt_picker=ImagePicker();
  File? fornt_imageFile;


  @override
  void onInit() {
    super.onInit();
    getUserAccountDetails(token.value);

  }




  void openBottomSheet(){
    Get.bottomSheet(
        Container(
          height: 100,
          width: Get.size.width,
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Column(
            children: [
              Text("Choose",
                  style: const TextStyle(
                    fontFamily: 'PT-Sans',
                    fontSize: 18,
                    // color: Colors.black,
                  )
              ),
              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: TextButton.icon(     // <-- TextButton
                    onPressed: () {

                      Get.back();
                      takeImage(ImageSource.camera);
                    },
                    icon: Icon(
                      Icons.camera,
                      size: 30.0,
                    ),
                    label: Text('Camera',
                        style: const TextStyle(
                          fontFamily: 'PT-Sans',
                          fontSize: 18,
                          // color: Colors.black,
                        )
                    ),
                  ),),
                  Expanded(child: TextButton.icon(     // <-- TextButton
                    onPressed: () {

                      Get.back();
                      takeImage(ImageSource.gallery);
                    },
                    icon: Icon(
                      Icons.image,
                      size: 30.0,
                    ),
                    label: Text('Gallery',style: const TextStyle(
                      fontFamily: 'PT-Sans',
                      fontSize: 18,
                      // color: Colors.black,
                    ),),
                  ),)




                ],
              )
            ],
          ),

        ),


        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        isScrollControlled: true


      //  resizeToAvoidBottomInset: false
      // isScrollControlled: true,
    );
  }



  void takeImage(ImageSource source)async{
    final pickedFile= await _fornt_picker.getImage(source: source);
    _fornt_imageFile=pickedFile!;
    fornt_imageFile = File(pickedFile.path);
    final bytes = File(_fornt_imageFile!.path).readAsBytesSync();

    String img64 = base64Encode(bytes);

    _uploadImage(
        fontImage: fornt_imageFile!,
      token: token.value,
    );




  }


  ///upload image
  _uploadImage({
    required File fontImage,
    required String token,
  }) async {

    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {


        try {
          showLoadingDialog("Uploading...");
          var headers = {
            'Authorization': 'Bearer '+token,
          };

          var request = http.MultipartRequest('POST', Uri.parse('https://fnfbuy.bizoytech.com/api/profile-photo'));
          request.files.add(await http.MultipartFile.fromPath('image', fontImage.path));
          request.headers.addAll(headers);

          http.StreamedResponse response = await request.send();

           final res = await http.Response.fromStream(response);


        //  _showToast(response.statusCode.toString());
          if (response.statusCode == 200) {
            Get.back();
            var data = jsonDecode(res.body);
            showToastShort("Image Saved Successfully!");
            getUserAccountDetails( token);

          }
          if (response.statusCode == 404) {
            var data = jsonDecode(res.body);
            showToastShort(data["message"]["image"]["0"]);
           // getUserBillingInfoList(token);
          }
          else {
            print(response.reasonPhrase);
          }
        } catch (e) {
       //   Navigator.of(context).pop();
          print(e.toString());
        }
      }
    } on SocketException catch (_) {
      Fluttertoast.cancel();
      showToastShort("No Internet Connection!");
    }
  }

  void getUserAccountDetails(String token) async{
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        showLoadingDialog("loading");
        //_showToast(token);
        try {

          var response = await get(

            Uri.parse('https://fnfbuy.bizoytech.com/api/account/get-account-details'),
            headers: {
              'Authorization': 'Bearer '+token,

              //'Content-Type': 'application/json',
            },
          );

        //  showToastShort(response.statusCode.toString()) ;
          Get.back();
          if (response.statusCode == 200) {

            var addressResponseData = jsonDecode(response.body);

            imageLink(addressResponseData["data"]["image"].toString());

          }
          else {
            // Fluttertoast.cancel();
            showToastShort("failed try again!");
          }
        } catch (e) {
          // Fluttertoast.cancel();
        }
      }
    } on SocketException {
      Fluttertoast.cancel();
      // _showToast("No Internet Connection!");
    }
  }


  showToastShort(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0);
  }

}

void showLoadingDialog(String message) {

  Get.defaultDialog(
      title: '',
      titleStyle: TextStyle(fontSize: 0),
      // backgroundColor: Colors.white.withOpacity(.8),
      content: Wrap(
        children: [
          Container(
            alignment: Alignment.center,
            // margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20, bottom: 20),
            child:Column(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height:50,
                  width: 50,
                  margin: EdgeInsets.only(top: 10),
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.deepOrangeAccent,
                    color: Colors.green,
                    strokeWidth: 6,
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 10),
                  child:Text(
                    message,
                    style: const TextStyle(fontSize: 25,),
                  ),
                ),

              ],
            ),
          )
        ],
        // child: VerificationScreen(),
      ),
      barrierDismissible: false,
      radius: 10.0);
}
