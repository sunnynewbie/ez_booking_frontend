import 'package:ez_booking/controller/edit_profile.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/config/app_font.dart';
import 'package:ez_booking/core/widget/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatefulWidget {
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final UserFormController controller = Get.put(UserFormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          AppBar(backgroundColor: Colors.white, title: Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                    height: 95,
                    width: 95,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [
                          Colors.blue.withOpacity(0.2),
                          Colors.white
                        ])),
                        child: ClipOval(
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP4fNghY7Kx6eP79gmdp6YhesUm6GZGL53Rw&s'
                            , fit: BoxFit.cover,
                            ),
                        ),
                  ),
                  Positioned(
                      right: MediaQuery.of(context).size.width * 0,
                      top: MediaQuery.of(context).size.width * 0.15,
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(2),
                            height: AppDimens.space35,
                            width: AppDimens.space35,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primary,
                                border: Border.all(
                                    color: Colors.white, width: 1.5)),
                            child: Icon(
                              Icons.camera,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(AppDimens.borderRadius15),
              child: Column(
                children: [
                  TextField(
                    controller: controller.nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.grey[400]!,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.black, width: 1.2),
                      ),
                      focusColor: Colors.black,
                      hintText: 'Enter Name',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                      // labelText: 'Full Name',
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: controller.userNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.grey[400]!,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.black, width: 1.2),
                      ),
                      focusColor: Colors.black,
                      hintText: 'Enter User-Name',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                      // labelText: 'Full Name',
                    ),
                  ),
                  SizedBox(height: 16),
                  Obx(
                    () => Container(
                      padding: EdgeInsets.all(AppDimens.space10),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                          color: AppColors.textGrey
                        )
                      ),
                      child: DropdownButton<int>(
                        style: TextStyle(
                          fontFamily: AppFont.lexend,
                          color: Colors.black
                        ),
                        value: controller.gender.value,
                        onChanged: (int? newGender) {
                          if (newGender != null) {
                            controller.gender.value = newGender;
                          }
                        },
                        items: [
                          DropdownMenuItem(
                            value: 1,
                            child: Text('Male'),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text('Female'),
                          ),
                          DropdownMenuItem(
                            value: 3,
                            child: Text('Other'),
                          ),
                        ],
                        // decoration: InputDecoration(
                        //   labelText: 'Gender',
                        //   border: OutlineInputBorder(),
                        // ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Obx(
                    () => controller.isLoading.value
                        ? CircularProgressIndicator()
                        : AppElevatedButton(
                          height: AppDimens.buttonHeight,
                          fontColor: Colors.white,
                          text: 'Save Changes',
                          width: double.infinity,
                            onTap: () async {
                              await controller.submitForm();
                            },
                            
                          ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
