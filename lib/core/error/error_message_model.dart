import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String error, code, message;

  const ErrorMessageModel({
    required this.error,
    required this.code,
    required this.message,
  });

  @override
  List<Object?> get props => [
        error,
        code,
        message,
      ];

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        error: json["error"],
        code: json["code"],
        message: json["message"],
      );
}
