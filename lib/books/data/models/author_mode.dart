import '../../domain/entities/authot_entity.dart';

class AuthorModel extends AuthorEntity {
  const AuthorModel({
    required super.name,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) => AuthorModel(
        name: json['name'],
      );
}
