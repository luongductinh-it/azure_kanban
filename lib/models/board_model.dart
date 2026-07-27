class BoardModel {
  final String id;
  final String name;
  final String decription;
  final int backgroundColorValue;
  final bool isPrivate;
  final DateTime createAt;
  final String ownerId;
  final List<String> users;
  BoardModel({
    required this.id,
    required this.name,
    required this.decription,
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
      'decription': decription,
      'backgroundColorValue': backgroundColorValue,
      'isPrivate': isPrivate,
      'createAt': createAt,
      'ownerId': ownerId,
      'users': users,
    };
  }
}
