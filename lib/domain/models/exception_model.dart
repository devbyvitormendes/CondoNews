class ExceptionModel {
  final int status;
  final String message;

  ExceptionModel({required this.status, required this.message});

  factory ExceptionModel.fromJson(Map<String, dynamic> json) {
    return ExceptionModel(
      status: json['status'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
    };
  }

  factory ExceptionModel.fromMap(Map<String, dynamic> json) {
    switch (json) {
      case {
          'status': final int status,
          'message': final String message,
        }:
        return ExceptionModel(
          status: status,
          message: message,
        );
      case _:
        throw ArgumentError('JSON inválido');
    }
  }
}