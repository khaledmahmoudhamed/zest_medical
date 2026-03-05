import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/cache/hive.dart';
import 'package:zest_medical/core/utils/app_router.dart';
import 'package:zest_medical/data/services/service_locator.dart';
import 'package:zest_medical/logic/auth_cubit/auth_cubit.dart';
import 'package:zest_medical/logic/medical_cubit/medical_cubit.dart';
import 'package:zest_medical/logic/navigate_cubit.dart';
import 'package:zest_medical/logic/toggle/toggle_icon_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceLocator();
  await CacheHelper.init();
  await CacheHelper.userBox();
  await CacheHelper.appSettingsBox();
  await CacheHelper.userPaymentsBox();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext p1, Orientation p2, ScreenType p3) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => getIt<AuthCubit>()),
            BlocProvider(create: (context) => ToggleIconCubit()),
            BlocProvider(create: (context) => NavigatorCubit()),
            BlocProvider(create: (context) => MedicalCubit()),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: .fromSeed(seedColor: Colors.deepPurple),
            ),
            navigatorKey: AppRouter.navigatorState,
            initialRoute: AppRouter.initial,
            onGenerateRoute: AppRouter.generateRoute,
          ),
        );
      },
    );
  }
}
