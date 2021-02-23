import 'package:flutter/material.dart';

class Account {
  final String name;
  final String email;
  final String date;
  final String hour;

  Account({
    @required this.name,
    @required this.email,
    this.date,
    this.hour,
  });
}
