import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final DateTime createAt;
  final String avatar;

  const User({
    required this.id,
    required this.name,
    required this.createAt,
    required this.avatar,
  });

  @override
  List<Object?> get props => [id];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      createAt: json['createAt'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'createAt': createAt,
      'avatar': avatar,
    };
  }
}
