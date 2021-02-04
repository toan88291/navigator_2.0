import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'application.dart';
import 'common/app_session.dart';
import 'data/cubit/app_cubit.dart';
import 'data/cubit/navigator/navigator_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSession().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: (context) => AppCubit(),
        ),
        BlocProvider<NaCubit>(
          create: (context) => NaCubit(),
        )
      ],
      child: Application(),
    );
  }
}
