import 'package:equatable/equatable.dart';

class Friend extends Equatable {
  int? id;
  String name;
  String avatar;
  String user;

  Friend({
    this.id,
    required this.name,
    required this.avatar,
    required this.user,
  });

  static Friend fromMap(Map<String, dynamic> registro) {
    return Friend(
      id: int.parse(registro["id"] as String),
      name: registro["name"] as String,
      avatar: registro["avatar"] as String,
      user: registro["user"] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "avatar": avatar,
      "user": user,
    };
  }

  @override
  String toString() {
    return "id: $id user: $user name: $name avatar: $avatar";
  }

  @override
  List<Object?> get props => [id, name, avatar, user];
}
