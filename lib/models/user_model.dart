class UserModel {
  String id;
  String user;
  String password;
  String type;
  String token;
  String idCode;
  String firstName;
  String lastName;
  String address;
  String phone;
  String lat;
  String lng;
  String lastupdate;

  UserModel(
      {this.id,
      this.user,
      this.password,
      this.type,
      this.token,
      this.idCode,
      this.firstName,
      this.lastName,
      this.address,
      this.phone,
      this.lat,
      this.lng,
      this.lastupdate});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['User'];
    password = json['Password'];
    type = json['Type'];
    token = json['Token'];
    idCode = json['idCode'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    address = json['Address'];
    phone = json['Phone'];
    lat = json['Lat'];
    lng = json['Lng'];
    lastupdate = json['lastupdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['User'] = this.user;
    data['Password'] = this.password;
    data['Type'] = this.type;
    data['Token'] = this.token;
    data['idCode'] = this.idCode;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['Address'] = this.address;
    data['Phone'] = this.phone;
    data['Lat'] = this.lat;
    data['Lng'] = this.lng;
    data['lastupdate'] = this.lastupdate;
    return data;
  }
}

