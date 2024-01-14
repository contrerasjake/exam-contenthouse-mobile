import 'package:flutter/material.dart';
import 'package:mobile_exam/core/app/bloc.dart' as base;
import 'package:mobile_exam/core/app/view.dart';

import 'views/error.dart' as error_view;
import 'views/loading.dart' as loading_view;
import 'views/main.dart' as main_view;

export 'package:provider/provider.dart';

extension Extension on BuildContext {
  Bloc get bloc => read<Bloc>();
}

class Bloc extends base.Bloc {
  Bloc(BuildContext context)
      : super(loading_view.ViewState(), context: context);

  @override
  void init() async {
    final arg = context.arguments;
    final data = arg?['data'];

    if (data['status_code'] != 200) {
      emit(error_view.ViewState());
    } else {
      emit(main_view.ViewState());
    }
  }
}
