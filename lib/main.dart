import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:neon_student/injection.dart' as di;
import 'package:neon_student/utils/constants/bloc_providers.dart';
import 'package:neon_student/utils/constants/index.dart';
import 'package:neon_student/utils/constants/router_config.dart';

void main() async {
  await dotenv.load(fileName: '.env.dev');
  di.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: BlocProviders.blocProviders,
          child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            behavior: HitTestBehavior.opaque,
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: GoRouteInformation.router,
              title: "Neon Student",
            ),
          ),
        );
      },
    );
  }
}
