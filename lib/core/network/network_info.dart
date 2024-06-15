// import 'package:flutter/material.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:timetable/main.dart';
//
// // For checking internet connectivity
// abstract class NetworkInfoI {
//   Future<bool> isConnected();
//
//   Future<ConnectivityResult> get connectivityResult;
//
//   Stream<ConnectivityResult> get onConnectivityChanged;
// }
//
// class NetworkInfo implements NetworkInfoI {
//   Connectivity connectivity;
//
//   static final NetworkInfo _networkInfo = NetworkInfo._internal(Connectivity());
//
//   factory NetworkInfo() {
//     return _networkInfo;
//   }
//
//   NetworkInfo._internal(this.connectivity) {
//     connectivity = this.connectivity;
//   }
//
//   ///checks internet is connected or not
//   ///returns [true] if internet is connected
//   ///else it will return [false]
//   @override
//   Future<bool> isConnected() async {
//     final result = await connectivity.checkConnectivity();
//     if (result != ConnectivityResult.none) {
//       return true;
//     }
//     return false;
//   }
//
//   // to check type of internet connectivity
//   @override
//   Future<ConnectivityResult> get connectivityResult async {
//     return connectivity.checkConnectivity();
//   }
//
//   //check the type on internet connection on changed of internet connection
//   @override
//   Stream<ConnectivityResult> get onConnectivityChanged =>
//       connectivity.onConnectivityChanged;
// }
//
// abstract class Failure {}
//
// // General failures
// class ServerFailure extends Failure {}
//
// class CacheFailure extends Failure {}
//
// class NetworkFailure extends Failure {}
//
// class ServerException implements Exception {}
//
// class CacheException implements Exception {}
//
// class NetworkException implements Exception {}
//
// ///can be used for throwing [NoInternetException]
// class NoInternetException implements Exception {
//   late String _message;
//
//   NoInternetException([String message = 'NoInternetException Occurred']) {
//     if (globalMessengerKey.currentState != null) {
//       globalMessengerKey.currentState!
//           .showSnackBar(SnackBar(content: Text(message)));
//     }
//     this._message = message;
//   }
//
//   @override
//   String toString() {
//     return _message;
//   }
// }
//
