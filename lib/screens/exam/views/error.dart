import 'package:flutter/material.dart';
import 'package:mobile_exam/core/app/view.dart' as base;

class ViewState extends base.ViewState {
  @override
  Widget content(BuildContext context) {
    final arg = context.arguments;
    final Map<String, dynamic> data = arg!['data'];
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.warning_amber,
            color: Colors.red,
            size: 48,
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              data['error_message'],
              style: context.texts.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
