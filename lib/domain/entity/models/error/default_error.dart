import 'failures.dart';

class ErrorMessage extends Failure {
  final String message;

  ErrorMessage(this.message);

  @override
  String getMessage() {
    return message;
  }
}
