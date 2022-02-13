import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:academy_manager/pages/splash.dart';

class FeedBack extends StatefulWidget {
  FeedBack({
    Key key,
    this.userId,
  }) : super(key: key);
  final String userId;
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Text("FeedBack Page"),
      ),
    );
  }
}
