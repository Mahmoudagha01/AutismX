class SigninModel {
  String success;
  Data data;
  String message;

  SigninModel({this.success, this.data, this.message});

  SigninModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['success'] =success;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  Parent parent;
  String token;

  Data({this.parent, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    parent =
        json['parent'] != null ? new Parent.fromJson(json['parent']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.parent != null) {
      data['parent'] = this.parent.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Parent {
  int id;
  String firstName;
  String secondName;
  String phone;
  String email;
  String address;
  String password;
  String childName;
  int childAge;
  String childImage;
  String childGender;
  String createdAt;
  String updatedAt;

  Parent(
      {this.id,
      this.firstName,
      this.secondName,
      this.phone,
      this.email,
      this.address,
      this.password,
      this.childName,
      this.childAge,
      this.childImage,
      this.childGender,
      this.createdAt,
      this.updatedAt});

  Parent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    secondName = json['secondName'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    password = json['password'];
    childName = json['child_name'];
    childAge = int.parse(json['child_age'].toString());
    childImage = json['child_image'];
    childGender = json['child_gender'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['secondName'] = this.secondName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['address'] = this.address;
    data['password'] = this.password;
    data['child_name'] = this.childName;
    data['child_age'] = this.childAge;
    data['child_image'] = this.childImage;
    data['child_gender'] = this.childGender;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
