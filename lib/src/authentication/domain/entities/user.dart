import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String createAt;
  final String avatar;

  const User({
    required this.id,
    required this.name,
    required this.createAt,
    required this.avatar,
  });

  @override
  List<Object?> get props => [id];

  const User.empty()
      : this(
          id: 1,
          name: "_empty.name",
          createAt: "_empty.createAt",
          avatar: "_empty.avatar",
        );

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
