import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_font.dart';
import 'package:ez_booking/features/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerifiationPage extends StatelessWidget {
  const VerifiationPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SafeArea(
            child: Column(
              children: [
                Container(
                  color: const Color.fromARGB(92, 251, 222, 255),
                  padding: EdgeInsets.only(top: size.height * 0.05),
                  height: size.height * 0.19,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width * 0.55,
                        height: size.width * 0.3,
                        // color: Colors.red,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                child: GestureDetector(
                                  child: Icon(Icons.arrow_back),
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  )
                                ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Verify OTP',
                                style: TextStyle(
                                    fontFamily: AppFont.lexend,
                                    fontSize: size.height * 0.019,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'OTP Sent To XXXXXXXXXX',
                                style: TextStyle(
                                    fontFamily: AppFont.lexend,
                                    fontSize: size.height * 0.016,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width * 0.3,
                        height: size.width * 0.3,
                        child: Image.asset(AppAssets.mobile_password,
                            fit: BoxFit.cover),
                        // color: Colors.amber,
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: size.width * 0.08),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.06,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Enter The OTP Sent To",
                          style: TextStyle(
                            fontFamily: AppFont.lexend,
                            fontSize: size.height * 0.023,
                            color: Colors.black,
                            // fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "+91 XXXXXXXXXX",
                          style: TextStyle(
                            fontFamily: AppFont.lexend,
                            fontSize: size.height * 0.023,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.025),
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: Colors.black45,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Verification Code"),
                            content: Text('Code entered is $verificationCode'),
                          );
                        });
                  }, // end onSubmit
                ),
                SizedBox(height: size.height * 0.02),
                Container(
                  alignment: Alignment.centerLeft,
                  width: size.width * 0.8,
                  child: Text(
                    "Did't get the OTP? Resend in 00:30",
                    style: TextStyle(
                      fontFamily: AppFont.lexend,
                      fontSize: size.height * 0.015,
                      color: Colors.black45,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03,),
                CustomButtom(text: "Verify OTP", height: size.height * 0.06, width: size.width * 0.85)
              ],
            ),
          )
        ],
      ),
    ));
  }
}
