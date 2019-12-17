import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Hero extends Equatable {
  final name, avatar;
  final bool isTaken;

  Hero({@required this.name, @required this.avatar, @required this.isTaken})
      : assert(name != null),
        assert(avatar != null),
        assert(isTaken != null);

  factory Hero.fromJson(dynamic json) => Hero(
      name: json['name'], avatar: json['avatar'], isTaken: json['isTaken']);

  Hero copyWith({String name, String avatar, bool isTaken}) {
    return Hero(
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
        isTaken: isTaken ?? this.isTaken);
  }

  @override
  List<Object> get props => [name, avatar, isTaken];
}
