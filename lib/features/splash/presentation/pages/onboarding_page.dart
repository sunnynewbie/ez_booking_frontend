import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_font.dart';
import 'package:ez_booking/features/splash/presentation/pages/location_page.dart';
import 'package:ez_booking/features/widget/custom_button.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {

  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        children: [
          SafeArea(
            child: Container(
              child: Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    Container(
                      // height: size.height * 0.6,
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        children: [
                          showRow(size, size.height * 0.12, size.width * 0.4,
                              AppAssets.onboarding_4, AppAssets.onboarding_3),
                          showRow(size, size.height * 0.22, size.width * 0.4,
                              AppAssets.onboarding_5, AppAssets.onboarding_1),
                          showRowWithGradient(size, size.height * 0.2, size.width * 0.4,
                              AppAssets.onboarding_6, AppAssets.onboarding_2),
                        ],
                      ),
                    ),
                    Container(
                      // height: size.height * 0.373,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.012,
                          ),
                          Container(
                            width: size.width * 0.7,
                            padding: EdgeInsets.only(top: size.height * 0.02),
                            child: 
                            Text(
                              'Welcome to Fyndio Made for Everyone!',
                              style: TextStyle(
                                fontFamily: AppFont.lexend,
                                fontSize: size.height * 0.03,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            width: size.width * 0.9,
                            child: Text(
                              'Lorem ipsum dolor sit amet consectetur. Nisi arcu sed nec ut est. Nibh ut aliquet enim nunc dignissim pellentesque cursus vel.',
                              style: TextStyle(
                                fontFamily: AppFont.lexend,
                                fontSize: size.height * 0.018,
                                color: Colors.black45,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          CustomButtom(text: 'Get Started', height: size.height * 0.06, width: size.width * 0.85)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Container(
              color: Colors.white,
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                    Container(
                      width: size.width * 0.85,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Setup your location',
                        style: TextStyle(
                          fontFamily: AppFont.lexend,
                          fontSize: size.height * 0.035,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    Container(
                      width: size.width * 0.85,
                      child: Text('Lorem ipsum dolor sit amet consectetur. Viverra tortor nunc lectus nibh sed vitae eget. ',
                      style: TextStyle(
                        fontSize: size.height * 0.018,
                        fontFamily: AppFont.lexend,
                        color: Colors.black45
                        ),
                      ),
                    ),
                    SizedBox(
                      height:  size.height * 0.07,
                    ),
                    Container(
                      child: Image.asset(AppAssets.Rectangle_20764),
                    ),
                    SizedBox(
                      height: size.height * 0.07,
                    ),
                    Text(
                      'Enter Loction Manually',
                      style: TextStyle(
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primary,
                        fontFamily: AppFont.lexend,
                        decoration: TextDecoration.underline
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    CustomButtom(text: 'Allow Device Location', height: size.height * 0.06, width: size.width * 0.85)
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  
                  Container(
                    
                    padding: EdgeInsets.only(left: size.width * 0.04),
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                      color: AppColors.primary
                    ),
                    child: Text(
                      'Adajan, Surat',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    
                  ),
                  SizedBox(
                    height: size.height * 0.25,
                  ),
                  Container(
                    child: Image.asset(
                      AppAssets.location
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(size.width * 0.05),
                    child: Column(
                      children: [
                        Text(
                          'Unavailable in this region',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: AppFont.lexend,
                            fontSize: size.height * 0.025,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        Text('Our team is hard at work to bring exciting events to your area soon',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: size.height * 0.02
                        ),
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        CustomButtom(text: 'Try Other Location', height: size.height*0.06, width: size.width * 0.85)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const LocationPage()
        ],
      ),
    );
  }

  Widget showRow(
      var size, double height, double width, String imgPath1, String imgPath2) {
    return Container(
      padding: EdgeInsets.only(
        bottom: size.height * 0.013,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.width * 0.03),
            ),
            child: Image.asset(
              imgPath1,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: size.width * 0.04,
          ),
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.width * 0.03),
            ),
            child: Image.asset(
              imgPath2,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
  Widget showRowWithGradient(
      var size, double height, double width, String imgPath1, String imgPath2) {
    return Container(
      padding: EdgeInsets.only(
        bottom: size.height * 0.013,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         ShaderMask(
          shaderCallback: (rect){
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.white, Colors.transparent]
            ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height * 1));
          },
          blendMode: BlendMode.dstIn,
          child:  Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.width * 0.03),
            ),
            child: Image.asset(
              imgPath1,
              fit: BoxFit.fill,
            ),
          ),
         ),
          SizedBox(
            width: size.width * 0.04,
          ),
          ShaderMask(
          shaderCallback: (rect){
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.white, Colors.transparent]
            ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height * 1));
          },
          blendMode: BlendMode.dstIn,
          child:  Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.width * 0.03),
            ),
            child: Image.asset(
              imgPath2,
              fit: BoxFit.fill,
            ),
          ),
         ),
        ],
      ),
    );
  }
}
