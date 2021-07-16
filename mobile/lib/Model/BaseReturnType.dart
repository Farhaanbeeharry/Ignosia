import 'package:ignosia/Model/BaseClass.dart';

class BaseReturnType<T> extends ReturnModel {
  dynamic data;
  String sQryResult;
  dynamic additionalData;
  String errorMessage;
  String oneTimeToken;
  int totalItems;
  String mapServerResponse;

  T processedData;
  T processedAdditionalData;

  bool isValid;

  @override
  BaseReturnType cast(Map<String, dynamic> json) {
    this.data = json['data'];
    this.sQryResult = json['sQryResult'];
    this.additionalData = json['additionalData'];
    this.errorMessage = json['errorMessage'];
    this.oneTimeToken = json['oneTimeToken'];
    this.totalItems = json['totalItems'];
    this.mapServerResponse = json['MapServerResponse'];
    this._checkResponse();
    return this;
  }

  List<String> _invalidError = ["unauthorized", "invalidtoken", "timeout"];
  List<String> _invalidSQuery = ["invalidtoken", "timeout"];

  _checkResponse() {
    this.isValid = true;
    if (this.errorMessage != null && this._invalidError.indexOf(this.errorMessage.toLowerCase()) > -1) this.isValid = false;
    if (this.sQryResult != null && this._invalidSQuery.indexOf(this.sQryResult.toLowerCase()) > -1) this.isValid = false;
  }
}

class MasterDataItems<T> {
  List<T> data;
}
