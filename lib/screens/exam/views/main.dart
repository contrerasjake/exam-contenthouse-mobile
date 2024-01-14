import 'package:flutter/material.dart';
import 'package:mobile_exam/core/app/view.dart' as base;
import 'package:mobile_exam/screens/exam/components/counter.dart';

class ViewState extends base.ViewState {
  @override
  Widget content(BuildContext context) {
    final arg = context.arguments;
    final Map<String, dynamic> data = arg!['data'];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const SizedBox(height: 20),
          Image.network(
            data['image'],
            fit: BoxFit.fitHeight,
            height: 200,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
            errorBuilder: (context, exception, stackTrace) {
              return Text(
                exception.toString(),
                textAlign: TextAlign.center,
              );
            },
          ),
          const SizedBox(height: 20),
          Text(data['message']),
          const SizedBox(height: 20),
          const Counter(),
        ],
      ),
    );
  }
}
