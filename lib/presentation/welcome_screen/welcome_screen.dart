import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import ChangeNotifierProvider
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import 'models/welcome_model.dart';
import 'provider/welcome_provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  WelcomeScreenState createState() => WelcomeScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WelcomeProvider(),
      child: WelcomeScreen(),
    );
  }
}

class WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  // Function to handle button click and navigate to home screen
  void _onButtonPressed() {
    Navigator.pushNamed(context, AppRoutes.homeScreen);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 55.h,
            vertical: 70.v,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 59,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgImage9,
                height: 218.v,
                width: 320.h,
              ),
              SizedBox(height: 15.v),
              SizedBox(
                width: 196.h,
                child: Text(
                  "msg_hurry_up_lecture".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyLarge16,
                ),
              ),
              Spacer(
                flex: 40,
              ),
              CustomElevatedButton(
                text: "lbl_let_s_go".tr,
                margin: EdgeInsets.only(
                  left: 34.h,
                  right: 6.h,
                ),
                alignment: Alignment.centerRight,
                onPressed: _onButtonPressed, // Call the function on button press
              )
            ],
          ),
        ),
      ),
    );
  }
}

