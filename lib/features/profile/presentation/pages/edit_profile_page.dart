import 'package:ez_booking/controller/edit_profile.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/widget/app_dropdown.dart';
import 'package:ez_booking/core/widget/app_elevated_button.dart';
import 'package:ez_booking/core/widget/app_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserFormController>(
      init: UserFormController(),
      builder: (_) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white, title: const Text('Edit Profile')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _.formKey,
            child: Column(
              children: [
                Expanded(
                  child: Column(
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
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP4fNghY7Kx6eP79gmdp6YhesUm6GZGL53Rw&s',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(2),
                                      height: AppDimens.space35,
                                      width: AppDimens.space35,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.primary,
                                          border: Border.all(
                                              color: Colors.white, width: 1.5)),
                                      child: const Icon(
                                        Icons.camera_alt_outlined,
                                        color: Colors.white,
                                        size: AppDimens.imageSize20,
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(AppDimens.borderRadius15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: AppTextFormField(
                                    controller: _.nameController,
                                    hint: 'First name',
                                  ),
                                ),
                                const Gap(AppDimens.space15),
                                Expanded(
                                  child: AppTextFormField(
                                    hint: 'Last name',
                                    controller: _.nameController,
                                  ),
                                ),
                              ],
                            ),
                            const Gap(AppDimens.space15),
                            AppTextFormField(
                              controller: _.userNameController,
                              hint: 'Phone number',
                              enable: false,
                            ),
                            const Gap(AppDimens.space15),
                            InkWell(
                              onTap: () async {
                                await pickDate(context, _);
                              },
                              child: AppTextFormField(
                                hint: 'Date of birth',
                                enable: false,
                                controller: _.dobCtrl,
                              ),
                            ),
                            const Gap(AppDimens.space15),
                            AppTextFormField(
                              hint: 'Email',
                              controller: _.emailCtrl,
                              validator: (value) {
                                if (!value!.isEmail) {
                                  return 'Please enter valid email';
                                }
                              },
                            ),
                            const Gap(AppDimens.space15),
                            AppTextFormField(
                              hint: 'Username',
                              controller: _.userNameController,
                            ),
                            const Gap(AppDimens.space15),
                            Obx(
                              () => AppDropdown(
                                hintText: 'Gender',
                                borderColor: AppColors.borderColor,
                                items: const [
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
                                value: _.gender.value == -1
                                    ? null
                                    : _.gender.value,
                                onChanged: (int? newGender) {
                                  if (newGender != null) {
                                    _.gender.value = newGender;
                                  }
                                },
                              ),
                            ),
                            const Gap(AppDimens.space15),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => _.isLoading.value
                      ? const CircularProgressIndicator()
                      : AppElevatedButton(
                          height: AppDimens.buttonHeight,
                          fontColor: Colors.white,
                          text: 'Save Changes',
                          width: double.infinity,
                          onTap: () async {
                            if (_.formKey.currentState!.validate()) {
                              await _.submitForm();
                            }
                          },
                        ),
                ),
                Gap(AppDimens.space15),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> pickDate(BuildContext context, UserFormController _) async {
    var response = await showDatePicker(
        context: context,
        firstDate: DateTime(1910),
        lastDate: DateTime(2006),
        initialDate: _.dob.value,
        currentDate: _.dob.value);
    if (response != null) {
      _.dob.value = response;
      _.dobCtrl.text = DateFormat('dd-MM-yyy').format(response);
    }
  }
}
