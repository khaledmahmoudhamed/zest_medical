import 'package:flutter/material.dart';
import '../../presentaion/view/auth/forget_password/screens/add_face_id.dart';
import '../../presentaion/view/auth/forget_password/screens/forget_password.dart';
import '../../presentaion/view/auth/forget_password/screens/otp_verification.dart';
import '../../presentaion/view/auth/login/screens/login_screen.dart';
import '../../presentaion/view/auth/register/screens/register_screen.dart';
import '../../presentaion/view/bottom_nav_bar/bottom_nav_bar_holder.dart';
import '../../presentaion/view/profile/profile_items/screens/appointments.dart';
import '../../presentaion/view/profile/profile_items/screens/medical_records.dart';
import '../../presentaion/view/profile/profile_items/screens/payment_screen.dart';
import '../../presentaion/view/profile/profile_items/screens/personal_information.dart';
import '../../presentaion/view/profile/settings/screens/faq_screen.dart';
import '../../presentaion/view/profile/settings/screens/language_screen.dart';
import '../../presentaion/view/profile/settings/screens/notification_screen.dart';
import '../../presentaion/view/profile/settings/screens/security_screen.dart';
import '../../presentaion/view/profile/settings/screens/settings.dart';
import '../../presentaion/view/splash_on_boarding/on_boarding_screen.dart';
import '../../presentaion/view/splash_on_boarding/splash_screen.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();
  static const initial = '/';
  static const onBoardingScreen = '/onBoardingScreen';
  static const login = '/loginScreen';
  static const register = '/registerScreen';
  static const forgetPassword = '/forgetPassword';
  static const otpVerification = '/otpVerification';
  static const faceId = '/faceId';
  static const screenHolder = '/screensHolder';
  static const settingScreen = '/settingScreen';
  static const notification = '/notification';
  static const faq = '/faq';
  static const security = '/security';
  static const language = '/language';
  static const personalInformation = '/personalInformation';
  static const medicalRecords = '/medicalRecords';
  static const appointments = '/appointments';
  static const paymentScreen = '/paymentScreen';
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initial:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case forgetPassword:
        return MaterialPageRoute(builder: (_) => ForgetPassword());
      case otpVerification:
        return MaterialPageRoute(builder: (_) => OtpVerification());
      case faceId:
        return MaterialPageRoute(builder: (_) => AddFaceIdScreen());
      case screenHolder:
        return MaterialPageRoute(builder: (_) => BottomNavBarHolder());
      case settingScreen:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      case notification:
        return MaterialPageRoute(builder: (_) => NotificationScreen());
      case faq:
        return MaterialPageRoute(builder: (_) => FaqScreen());
      case security:
        return MaterialPageRoute(builder: (_) => SecurityScreen());
      case language:
        return MaterialPageRoute(builder: (_) => LanguageScreen());
      case personalInformation:
        return MaterialPageRoute(builder: (_) => PersonalInformationScreen());
      case medicalRecords:
        return MaterialPageRoute(builder: (_) => MedicalRecordsScreen());
      case appointments:
        return MaterialPageRoute(builder: (_) => AppointmentsScreen());
      case paymentScreen:
        return MaterialPageRoute(builder: (_) => PaymentScreen());
      default:
        return errorModel();
    }
  }

  static Route errorModel() {
    return MaterialPageRoute(
      builder: (_) => Center(child: Text("Route Error")),
    );
  }
}
