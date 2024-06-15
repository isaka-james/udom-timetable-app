import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import 'models/first_user_model.dart';
import 'provider/first_user_provider.dart';
import '../../data/database_helper.dart'; // Import the DatabaseHelper class

class FirstUserScreen extends StatefulWidget {
  const FirstUserScreen({Key? key}) : super(key: key);

  @override
  FirstUserScreenState createState() => FirstUserScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FirstUserProvider(),
      child: FirstUserScreen(),
    );
  }
}

class FirstUserScreenState extends State<FirstUserScreen> {
  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  // Initialize the database and populate it with sample data
  void _initializeDatabase() async {
    // Initialize the database helper
    DatabaseHelper databaseHelper = DatabaseHelper.instance;
    //
    // // Call migrateDownDatabase to delete existing data
    // await databaseHelper.migrateDownDatabase();

    // Call onCreate to create tables
    await databaseHelper.database;

    // Populate the database with sample data
    await databaseHelper.populateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgTwospheres,
                height: 228.v,
                width: 222.h,
                alignment: Alignment.centerLeft,
              ),
              SizedBox(height: 85.v),
              CustomImageView(
                imagePath: ImageConstant.imgImage8,
                height: 258.v,
                width: 292.h,
              ),
              SizedBox(height: 85.v),
              SizedBox(
                width: 247.h,
                child: Text(
                  "msg_design_specifically".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              SizedBox(height: 54.v),
              CustomElevatedButton(
                width: 280.h,
                text: "lbl_get_started".tr,
                onPressed: () {
                  onTapGetstarted(context);
                },
              ),
              SizedBox(height: 5.v)
            ],
          ),
        ),
      ),
    );
  }

  /// Navigates to the welcomeScreen when the action is triggered.
  onTapGetstarted(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.welcomeScreen,
    );
  }
}
