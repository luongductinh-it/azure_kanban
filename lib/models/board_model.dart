import 'package:cloud_firestore/cloud_firestore.dart';

class BoardModel {
  final String id;
  final String name;
  final String decriptions;
  final int backgroundColorValue;
  final bool isPrivate;
  final DateTime createAt;
  final String ownerId;
  final List<String> users;
  BoardModel({
    required this.id,
    required this.name,
    required this.decriptions,
    required this.backgroundColorValue,
    required this.isPrivate,
    required this.createAt,
    required this.ownerId,
    required this.users,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'decriptions': decriptions,
      'backgroundColorValue': backgroundColorValue,
      'isPrivate': isPrivate,
      'createAt': createAt,
      'ownerId': ownerId,
      'users': users,
    };
  }

  factory BoardModel.fromMap(Map<String, dynamic> map, String documentId) {
    return BoardModel(
      id: map['id'] ?? '',
      name:  map['name'] ?? '' ,
      decriptions: map['decriptions'] ?? '',
      backgroundColorValue: map['backgroundColorValue'] ?? 0xFFFFFFFF,
      isPrivate: map['isPrivate'] ?? false,
      createAt: (map['createAt'] as Timestamp).toDate(),
      ownerId: map['ownerId'] ?? '' ,
      users: List<String>.from(map['users'] ?? []),
    );
  }
}
