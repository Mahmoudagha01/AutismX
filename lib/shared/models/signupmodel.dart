import 'package:autismx/shared/models/signinmodel.dart';

class SignupModel {
  String success;
  Parent data;
  String message;

  SignupModel({this.success, this.data, this.message});

  SignupModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Parent.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}
