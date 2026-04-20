import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget homeWidgetCard(String text, {bool isError = false}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isError ? Colors.red.shade50 : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isError ? Colors.red : Colors.black,
          height: 1.5,
        ),
      ),
    );
  }