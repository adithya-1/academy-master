import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:academy_manager/pages/splash.dart';

class Attendance extends StatefulWidget {
  Attendance({
    Key key,
    this.userId,
  }) : super(key: key);
  final String userId;

  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: Text("Attendance Page"),
      ),
    );
  }
}
