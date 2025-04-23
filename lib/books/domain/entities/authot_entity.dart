import 'package:equatable/equatable.dart';

class AuthorEntity extends Equatable {
  final String name;

  const AuthorEntity({
    required this.name,
  });

  @override
  List<Object?> get props => [
        name,
      ];
}