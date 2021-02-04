import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/dashboard_cubit.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with AutomaticKeepAliveClientMixin{

  final cubit = DashboardCubit();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<DashboardCubit, DashboardState>(
      cubit: cubit..getProfile(),
      builder: (context, state) {
        return state.when(init: () {
          return Container(
            color: Colors.white,
          );
        }, loading: () {
          return Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }, loaded: (data) {
          print(data);
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: ListView(
              shrinkWrap: true,
              children: [
                Text(
                  data?.username ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20
                  ),
                ),
                const SizedBox(height: 12,),
                Text(
                  data?.email ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20
                  ),
                ),
                const SizedBox(height: 12,),
                Text(
                  data?.twoFactorToken?.status ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20
                  ),
                ),
                const SizedBox(height: 12,),
              ],
            ),
          );
        });
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
