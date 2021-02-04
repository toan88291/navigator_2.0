import 'dart:async';
import 'package:example_navigator_20/screens/authorization/sign_in/sign_in_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';
part 'navigator_state.dart';

class NaCubit extends Cubit<NaState> {
  NaCubit() : super(InitState());

  static NaCubit of(BuildContext context) {
    return BlocProvider.of<NaCubit>(context);
  }

  void push(Widget child) {
    List<Page> pages = [...state.data.pages];
    pages.add(MaterialPage(
      child: child,
      key: Key('$child'),
      name: '$child',
    ));
    emit(ChangeState(data: state.data.copyWith(
      pages: pages
    )));
  }

  void pop(BuildContext context) {
    List<Page> pages = [...state.data.pages];
    pages.removeLast();
    emit(ChangeState(data: state.data.copyWith(
      pages: pages,
    )));
  }


  Future<dynamic> pushThen(Widget child) async {
    List<Page> pages = [...state.data.pages];
    pages.add(MaterialPage(
      child: child,
      key: Key('$child'),
      name: '$child',
    ));
    emit(ChangeState(data: state.data.copyWith(
      pages: pages,
        boolResult: Completer<dynamic>()
    )));
    return state.data.boolResult.future;
  }

  void popValue(BuildContext context,dynamic value) {
    if (state.data.boolResult != null) {
      List<Page> pages = [...state.data.pages];
      pages.removeLast();
      state.data.boolResult.complete(value);
      emit(ChangeState(data: state.data.copyWith(
          pages: pages,
      )));
    }
  }

  void replace(Widget child) {
    List<Page> pages = [...state.data.pages];
    assert(pages.isNotEmpty);
    pages.removeLast();
    pages.add(MaterialPage(
      child: child,
      key: UniqueKey(),
      name: '$child',
    ));
    emit(ChangeState(data: state.data.copyWith(
        pages: pages
    )));
  }

  void changeNavigator(Widget child) {
    List<Page> pages = [];
    pages.add(MaterialPage(
      child: child,
      key: Key('$child'),
      name: '$child',
    ));
    emit(ChangeState(data: state.data.copyWith(
        pages: pages
    )));
  }

  void didPop(Page page, dynamic result) {
    List<Page> pages = [...state.data.pages];
    pages.remove(page);
    if (page is ResultablePage) {
      _setResult(result);
    }
    emit(ChangeState(data: state.data.copyWith(
        pages: pages
    )));
  }

  void _setResult(dynamic result) {
    if (result is bool && state.data.boolResult != null) {
      state.data.boolResult.complete(result);
    }
  }

}

class ResultablePage extends MaterialPage {
  const ResultablePage({
    @required Widget child,
    LocalKey key,
    String name,
  }) : super(
    key: key,
    name: name,
    child: child,
  );
}

