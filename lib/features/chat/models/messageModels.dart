import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageModel {
  final String message;
  final String sender;
  final Timestamp time ;
  MessageModel({@required  this.time, @required this.message, @required this.sender});
}
