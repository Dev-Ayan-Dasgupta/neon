import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:neon_student/injection.dart' as di;
import 'package:neon_student/presentation/bloc/index.dart';

class BlocProviders {
  static List<BlocProvider> blocProviders = [
    BlocProvider<CheckBoxBloc>(
      create: (context) => di.locator<CheckBoxBloc>(),
    ),
    BlocProvider<ShowHideBloc>(
      create: (context) => di.locator<ShowHideBloc>(),
    ),
    BlocProvider<LoginBloc>(
      create: (context) => di.locator<LoginBloc>(),
    ),
    // BlocProvider<ToggleListitemsBloc>(
    //   create: (context) => di.locator<ToggleListitemsBloc>(),
    // ),
  ];
}
