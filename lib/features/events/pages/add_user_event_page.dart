import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/widget/app_elevated_button.dart';
import 'package:ez_booking/core/widget/app_textform_field.dart';
import 'package:ez_booking/features/events/controller/add_user_event_controller.dart';
import 'package:ez_booking/features/events/controller/event_summery_args.dart';
import 'package:ez_booking/model/params/add_user_param.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddUserEventPage extends StatelessWidget {
  final AddUserParam param;
  final VoidCallback onContinue;

  const AddUserEventPage(
      {super.key, required this.param, required this.onContinue});

  @override
  Widget build(BuildContext context) {

    return GetBuilder(
      init: AddUserEventController(addUserParam: param),
      builder: (_) => Form(
        key: _.formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: AppDimens.space20,
                ),
                child: Obx(
                  () => Column(
                    children: _.users.indexed.map(
                      (e) {
                        var user = e.$2;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap(AppDimens.space15),
                            Text(
                              'User detail(${user.isChild ? 'Child' : 'Adult'})',
                              style: context.md14.weigh500,
                            ),
                            Gap(AppDimens.space15),
                            Row(
                              children: [
                                Expanded(
                                  child: AppTextFormField(
                                    hint: 'First name',
                                    controller: user.fNameCtrl,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter first name';
                                      }
                                    },
                                  ),
                                ),
                                Gap(AppDimens.space15),
                                Expanded(
                                  child: AppTextFormField(
                                    hint: 'Last name',
                                    controller: user.lNameCtrl,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter last name';
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Gap(AppDimens.space10),
                            AppTextFormField(
                              hint: 'Phone number',
                              controller: user.phoneCtrl,
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter phone number';
                                }
                                if(value.length<10){
                                  return 'Please enter valid phone number';
                                }
                              },
                            ),
                            Gap(AppDimens.space10),
                            AppTextFormField(
                              hint: 'Email ID',
                              keyboardType: TextInputType.emailAddress,
                              controller: user.emailCtrll,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return null;
                                }
                                if (!value!.isEmail) {
                                  return 'Please enter email';
                                }
                                return null;
                              },
                            ),
                            Gap(AppDimens.space10),
                            InkWell(
                              onTap: () async {
                                var response = await showDatePicker(
                                    context: context,
                                    firstDate: DateTime(1910),
                                    lastDate: DateTime(2006),
                                    initialDate: user.dob,
                                    currentDate: user.dob);
                                if (response != null) {
                                  _.users[e.$1].dob = response;
                                  _.users[e.$1].dobCtrl.text =
                                      DateFormat('dd-MM-yyy').format(response);
                                  _.users.refresh();
                                }
                              },
                              child: AppTextFormField(
                                hint: 'Date of birth',
                                enable: false,
                                controller: user.dobCtrl,
                                suffixIconSize:
                                    BoxConstraints(maxHeight: 20, maxWidth: 30),
                                suffixIcon: Padding(
                                  padding: EdgeInsets.only(
                                    right: AppDimens.space10,
                                  ),
                                  child: Image.asset(
                                    AppAssets.calenderIcon,
                                    width: AppDimens.imageSize24,
                                    height: AppDimens.imageSize24,
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ),
            AppElevatedButton(
              text: "Continue",
              width: double.maxFinite,
              onTap: () {
                if (_.formKey.currentState!.validate()) {
                  onContinue.call();
                   }
              },
            ),
            const Gap(
              AppDimens.space20,
            ),
          ],
        ),
      ),
    );
  }
}
