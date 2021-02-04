import 'package:example_navigator_20/data/cubit/navigator/navigator_cubit.dart';
import 'package:example_navigator_20/utils/common.dart';
import 'package:example_navigator_20/utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeApp extends StatefulWidget {
  static const ROUTE_NAME = 'HomeApp';
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  static const TAG = 'HomeApp';
  NaCubit cubit;
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (cubit == null) cubit = BlocProvider.of<NaCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NaCubit, NaState>(
      cubit: cubit,
      builder: (context, state) {
        print('Route --> ${state.data.pages.toString()}');
        return NavigatorPage(
          pages: state.data.pages,
          navigatorKey: CommonApp().navigationKey,
          navigatorCubit: cubit,
        );
      }
    );
  }
}
