import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import '../../core/app_export.dart';
import 'models/home_model.dart';
import 'provider/home_provider.dart';

import '../../data/database_helper.dart';

import 'package:intl/intl.dart'; // Import package for date and time formatting
import 'dart:math';

// Function to get current time in the specified format
String getCurrentTime() {
  return DateFormat('hh:mm a').format(DateTime.now());
}

// Define the list of colors
List<Color> amazingColors = [
  Color(0XFFFF7F50), // Coral
  Color(0XFF50C878), // Emerald
  Color(0XFFE0115F), // Ruby
  Color(0XFFFFD700), // Gold
  Color(0XFF9966CC), // Amethyst
  Color(0XFF40E0D0), // Turquoise
  Color(0XFFDC143C), // Crimson
  Color(0XFFFFBF00), // Amber
  Color(0XFFE6E6FA), // Lavender
  Color(0XFFFF00FF), // Magenta
];

// Function to get a random color from the list without repeating
Color getRandomColor() {
  int index = Random().nextInt(amazingColors.length);
  Color color = amazingColors[index];
  return color;
}

// Function to check if current time is within the given time range
bool isCurrentTimeInRange(String? startTime, String? endTime) {
  if (startTime == null || endTime == null) {
    return false; // If either start or end time is null, return false
  }

  // Convert AM/PM markers to uppercase
  startTime = startTime.toUpperCase();
  endTime = endTime.toUpperCase();

  // Parse start and end time strings into DateTime objects
  DateTime parsedStartTime = _parseTime(startTime);
  DateTime parsedEndTime = _parseTime(endTime);

  // Get current time as a DateTime object
  DateTime currentTime = DateTime.now();

  // Calculate adjusted time for comparison (12-hour to 24-hour format)
  DateTime adjustedStartTime = DateTime(currentTime.year, currentTime.month,
      currentTime.day, parsedStartTime.hour, parsedStartTime.minute);
  DateTime adjustedEndTime = DateTime(currentTime.year, currentTime.month,
      currentTime.day, parsedEndTime.hour, parsedEndTime.minute);

  // Adjust end time if it's before the start time (to handle cases crossing midnight)
  if (adjustedEndTime.isBefore(adjustedStartTime)) {
    adjustedEndTime = adjustedEndTime.add(Duration(days: 1));
  }

  // Compare current time with adjusted start and end times
  return currentTime.isAfter(adjustedStartTime) &&
      currentTime.isBefore(adjustedEndTime);
}

// Function to parse time string into DateTime object
DateTime _parseTime(String timeString) {
  int hours = int.parse(timeString.substring(0, 2));
  int minutes = int.parse(timeString.substring(3, 5));

  if (timeString.endsWith('PM') && hours < 12) {
    hours += 12;
  } else if (timeString.endsWith('AM') && hours == 12) {
    hours = 0;
  }

  return DateTime(0, 0, 0, hours, minutes);
}




class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: HomeScreen(),
    );
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat("EEEE, yyyy MMMM d").format(DateTime.now());
    final int id = 1; // Replace this with your actual ID

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 21.0,
                vertical: 35.0,
              ),
              decoration: BoxDecoration(color: Color(0xFFF5F5F5)), // Assuming AppDecoration.fillGray is grey
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Today",
                          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold), // Assuming CustomTextStyles.headlineLargeBlack900
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.notificationScreen,
                              arguments: id,
                            );
                          },
                          child: Image.asset(
                            ImageConstant.bellImage,
                            height: 24.0,
                            width: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Padding(
                    padding: EdgeInsets.only(left: 23.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formattedDate,
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600), // Assuming CustomTextStyles.titleLargeBlack900SemiBold
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 27.0, top: 7.0, bottom: 9.0),
                          child: Image.asset(
                            ImageConstant.imgImage10,
                            height: 15.0,
                            width: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.0),
                    child: _buildCalendar(context),
                  ),
                  SizedBox(height: 32.0),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                   // height: double.infinity,
                  decoration: BoxDecoration(color: Color(0xFFF5F5F5)), // Assuming AppDecoration.fillGray is grey
                  child: _buildFullsingle(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }





  Widget _buildCalendar(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return Container(
          height: 78.v,
          width: 326.h,
          margin: EdgeInsets.only(left: 25.h),
          child: EasyDateTimeLine(
            initialDate: provider.selectedDate ?? DateTime.now(),
            locale: 'en_US',
            headerProps: EasyHeaderProps(
              selectedDateFormat: SelectedDateFormat.fullDateDMY,
              monthPickerType: MonthPickerType.switcher,
              showHeader: false,
            ),
            dayProps: EasyDayProps(
              width: 71.h,
              height: 77.v,
            ),
            onDateChange: (selectedDate) {
              provider.updateSelectedDate(selectedDate);
            },
            // itemBuilder: (context, dayNumber, dayName, monthName, fullDate,
            //     isSelected) {
            //   return isSelected
            //       ? Container(
            //     width: 71.h,
            //     padding: EdgeInsets.symmetric(
            //       horizontal: 21.h,
            //       vertical: 8.v,
            //     ),
            //     decoration: BoxDecoration(
            //       color: theme.colorScheme.primary.withOpacity(0.78),
            //       borderRadius: BorderRadius.circular(
            //         10.h,
            //       ),
            //     ),
            //     child: Column(
            //       mainAxisSize: MainAxisSize.min,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Text(
            //           dayNumber.toString(),
            //           style: CustomTextStyles.titleLargeSemiBold
            //               .copyWith(
            //             color: theme.colorScheme.onPrimary,
            //           ),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.only(bottom: 10.v),
            //           child: Text(
            //             dayName.toString(),
            //             style: CustomTextStyles.labelLargeOnPrimary
            //                 .copyWith(
            //               color: theme.colorScheme.onPrimary,
            //             ),
            //           ),
            //         )
            //       ],
            //     ),
            //   )
            //       : Container(
            //     width: 71.h,
            //     padding: EdgeInsets.symmetric(
            //       horizontal: 21.h,
            //       vertical: 8.v,
            //     ),
            //     decoration: BoxDecoration(
            //       color: appTheme.gray100,
            //       borderRadius: BorderRadius.circular(
            //         10.h,
            //       ),
            //     ),
            //     child: Column(
            //       mainAxisSize: MainAxisSize.min,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Text(
            //           dayNumber.toString(),
            //           style: CustomTextStyles.titleLargeBlack900
            //               .copyWith(
            //             color: appTheme.black900.withOpacity(0.7),
            //           ),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.only(bottom: 10.v),
            //           child: Text(
            //             dayName.toString(),
            //             style: theme.textTheme.labelLarge!.copyWith(
            //               color: appTheme.black900.withOpacity(0.5),
            //             ),
            //           ),
            //         )
            //       ],
            //     ),
            //   );
            // },
          ),
        );
      },
    );
  }


  Widget _buildFullsingle(BuildContext context) {
    // Fetch the selected date from the provider
    DateTime selectedDate =
        Provider.of<HomeProvider>(context).selectedDate ?? DateTime.now();

    print("selectedDate was found!");
    print(selectedDate);
    // Fetch blocks data from the database for the selected date
    Future<List<Map<String, String?>>> timetableData =
    DatabaseHelper.instance.queryTimetableForDate(selectedDate);

    String currentTime = getCurrentTime();
    bool isActiveFound = false;
    bool isFutureFound = false;

    return FutureBuilder<List<Map<String, String?>>>(
      future: timetableData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator()); // Display a loading indicator while fetching data
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}')); // Display an error message if fetching data fails
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No data available')); // Display a message if no data is available
        } else {
          List<Map<String, String?>> filteredBlocks = []; // Initialize an empty list to store filtered blocks

          // Process the fetched data
          List<Map<String, String?>> timetableData = snapshot.data!;
          // Filter blocks to include only those in current time or pending
          filteredBlocks = timetableData.where((block) {
            bool isCurrent = isCurrentTimeInRange(block['time_start'] ?? '', block['time_end'] ?? '');
            if (isCurrent) {
              isActiveFound = true; // Set flag if an active block is found
            } else {
              DateTime endTime = _parseTime(block['time_end'] ?? '');
              DateTime currentTimeParsed = _parseTime(currentTime);
              if (endTime.isAfter(currentTimeParsed)) {
                isFutureFound = true; // Set flag if a future block is found
              }
            }
            return isActiveFound || (isFutureFound && !isActiveFound) || isCurrent; // Include if active, future, or current
          }).toList();

          // If no active blocks found and future blocks found, display only future blocks
          if (!isActiveFound && isFutureFound) {
            filteredBlocks = timetableData.where((block) {
              DateTime endTime = _parseTime(block['time_end']!);
              DateTime currentTimeParsed = _parseTime(currentTime);
              return endTime.isAfter(currentTimeParsed);
            }).toList();
          }

          // If no active or future blocks found, display all blocks
          if (!isActiveFound && !isFutureFound) {
            filteredBlocks = timetableData;
          }

          return Column(
            children: filteredBlocks.map((block) {
              // Build widgets for filtered blocks
              return Padding(
                padding: EdgeInsets.only(bottom: 16, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 22),
                        child: _buildTimebesides(
                          context,
                          time1: block['time_start'] ?? '',
                          time2: block['time_end'] ?? '',
                        ),
                      ),
                    ),
                    Container(
                      height: isCurrentTimeInRange(block['time_start'] ?? '', block['time_end'] ?? '') ? 180 : 155,
                      width: 14,
                      margin: EdgeInsets.only(left: 18),
                      decoration: BoxDecoration(
                        color: isCurrentTimeInRange(block['time_start'] ?? '', block['time_end'] ?? '')
                            ? Theme.of(context).colorScheme.primary.withOpacity(0.9)
                            : getRandomColor(),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: 155,
                        child: _buildColumnSession(
                          context,
                          coarseText: block['coarse_short'] ?? '',
                          coarseFull: block['timetable'] ?? '',
                          programmes: block['classes'] ?? '',
                          venue: block['venue'] ?? '',
                          link: int.parse(block['id']??'0'), // Always set link to '1'
                          status: isCurrentTimeInRange(block['time_start']??'', block['time_end']??''),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }


  /// Common widget
  Widget _buildTimebesides(BuildContext context,
      {required String time1, required String time2}) {
    return Column(
      children: [
        Text(
          time1,
          style: theme.textTheme.bodyMedium!.copyWith(
            color: appTheme.black900,
          ),
        ),
        SizedBox(height: 55.v),
        Text(
          time2,
          style: theme.textTheme.bodyMedium!.copyWith(
            color: appTheme.black900,
          ),
        )
      ],
    );
  }

  Widget _buildColumnSession(BuildContext context,
      {required String coarseText,
      required String coarseFull,
      required String programmes,
      required String venue,
      required bool status,
      required int link}) {
    Color containerColor =
        status ? Theme.of(context).colorScheme.primary : Color(0XFFFFFFFF);
    Color counterColor =
        status ? Color(0XFFFFFFFF) : Colors.black.withOpacity(0.5);

    return GestureDetector(
      onTap: () {
       // int id = 123; // Replace 123 with the actual id value
        Navigator.pushNamed(
          context,
          AppRoutes.actionScreen,
          arguments: link,
        );

      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 11.h,
          vertical: 10.v,
        ),
        decoration: BoxDecoration(
          color: containerColor,
        ).copyWith(
          borderRadius: BorderRadiusStyle.customBorderLR15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 2.h),
              child: Text(
                coarseText,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: counterColor,
                    ),
              ),
            ),
            SizedBox(height: 4.v),
            Text(
              coarseFull,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: status
                        ? Theme.of(context).colorScheme.onPrimary
                        : Colors.black.withOpacity(0.5),
                  ),
            ),
            SizedBox(height: 7.v),
            Padding(
              padding: EdgeInsets.only(left: 2.h),
              child: Text(
                programmes,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: status
                          ? Theme.of(context).colorScheme.onPrimary
                          : Colors.black.withOpacity(0.5),
                    ),
              ),
            ),
            SizedBox(height: 7.v),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 16.h),
                child: Text(
                  venue,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: status
                            ? Theme.of(context).colorScheme.onPrimary
                            : Colors.black.withOpacity(0.5),
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
