import '../remote/errors.dart';

class ErrorMessageFactory {
  static String createMessage(Exception exception) {
    if (exception is NetworkNotAvailableException) {
      return exception.message.toString();
    } else if (exception is FailedResponseException) {
      return exception.message.toString();
    } else {
      return exception.toString();
    }
  }
}
