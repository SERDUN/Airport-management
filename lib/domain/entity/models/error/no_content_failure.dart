import 'failures.dart';

class NoContentFailure extends Failure {

  NoContentFailure();

  @override
  String getMessage() {
    return "No content";
  }
}
