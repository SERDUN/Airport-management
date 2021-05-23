import 'dart:collection';

import 'package:Aevius/domain/utils/utils.dart';


abstract class Failure {
  String getMessage();
}

//// General failures
class ServerFailure extends Failure {
  final int statusCode;
  final dynamic data;
  final String statusMessage;

  String _displayFailure = "Something happened";
  bool _isFailureParsed = false;

  ServerFailure(this.statusCode, this.data, this.statusMessage);

  bool parseError() {
    if (isNullOrEmpty(data)) {
      if (!isNullOrEmpty(statusMessage)) {
        _displayFailure = statusMessage;
        if (statusCode != null) {
          _displayFailure =
              _displayFailure + "\n\nCode: " + statusCode.toString();
        }

        _isFailureParsed = true;
      }
    } else {
      if (data is String) {
        _displayFailure = data + "\n\nCode: " + statusCode.toString();
      } else {
        try {
          if (data is LinkedHashMap) {
            var mapError = (data as Map);
            if (mapError.containsKey("noConnection")) {
              _displayFailure = "No internet connection";
            } else {
              var list = mapError.entries.toList();
              _displayFailure = list.first.value;
            }
          } else {
            var dataParsed = data
                .toString()
                .replaceAll("{", "")
                .replaceAll("}", "")
                .replaceAll("[", "")
                .replaceAll("]", "");
            _displayFailure = dataParsed + "\n\nCode: " + statusCode.toString();
          }
        } catch (e) {
          _displayFailure =
              statusMessage ?? "" + "\n\nCode: " + statusCode.toString();
        }
      }
    }

    return _isFailureParsed;
  }

  @override
  String getMessage() {
    print("HttpException: "+_displayFailure);
    return _displayFailure;
  }
}
//
