import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zest_medical/core/constants/app_constants_keys.dart';

class CacheHelper {
  static Box? user;
  static Box? appSettings;
  static Box? payments;
  static Box? recentSearch;
  static Box? chatMessages;
  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    return Hive.init(dir.path);
  }

  static Future<Box> userBox() async {
    return user = await Hive.openBox("user");
  }

  static bool isLoggedIn() {
    return user!.get(ApiKeys.token) != null;
  }

  static Future<Box> appSettingsBox() async {
    return appSettings = await Hive.openBox("systemSettings");
  }

  static Future<Box> userPaymentsBox() async {
    return payments = await Hive.openBox("userPayments");
  }

  static Future<Box> recentSearchBox() async {
    return recentSearch = await Hive.openBox("recentSearch");
  }

  static Future<Box> chatMessageBox() async {
    return chatMessages = await Hive.openBox("chat_box");
  }
}
