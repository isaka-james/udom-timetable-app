import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'models/splash_model.dart';
import 'provider/splash_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key})
      : super(
    key: key,
  );

  @override
  SplashScreenState createState() => SplashScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashProvider(),
      child: SplashScreen(),
    );
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      NavigatorService.popAndPushNamed(
        AppRoutes.firstUserScreen,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 97.h,
            vertical: 55.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Spacer(
                flex: 57,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgImage7,
                height: 156.v,
                width: 157.h,
                alignment: Alignment.center,
                onTap: () {
                  onTapImgImagesevenone(context);
                },
              ),
              SizedBox(height: 40.v),
              Container(
                width: 214.h,
                margin: EdgeInsets.only(left: 20.h),
                child: Text(
                  "msg_get_notified_each".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyLargeBlack900,
                ),
              ),
              Spacer(
                flex: 42,
              ),
              Padding(
                padding: EdgeInsets.only(right: 43.h),
                child: Text(
                  "lbl_made_in_cive".tr,
                  style: CustomTextStyles.titleLargeBlack900Light,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Navigates to the firstUserScreen when the action is triggered.
  onTapImgImagesevenone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.firstUserScreen,
    );
  }
}

