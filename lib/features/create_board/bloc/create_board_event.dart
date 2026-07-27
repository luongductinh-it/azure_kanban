import 'package:flutter/material.dart';

abstract class CreateBoardEvent {}

class CreateBoardSubmitted extends CreateBoardEvent {
  final String name;
  final String decription;
  final Color backgroundColor;
  final bool isPrivate;

  CreateBoardSubmitted({
    required this.name,
    required this.decription,
    required this.backgroundColor,
    required this.isPrivate,
  });
}
