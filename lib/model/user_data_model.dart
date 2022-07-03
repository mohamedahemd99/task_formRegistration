class UserDataModel {
  String? fullName;
  String? idType;
  String? personalID;
  String? gender;
  String? birthDate;
  String? personalAddress;
  String? city;
  String? region;
  String? mobile;
  String? password;
  String? profileImageUrl;
  String? mainSpeciality;
  String? subSpeciality;
  String? scientificDegree;
  String? certificatesUrl;
  String? licenseUrl;
  String? videoUrl;
  String? voiceUrl;
  String? email;

  UserDataModel({
    this.fullName,
    this.idType,
    this.personalID,
    this.gender,
    this.birthDate,
    this.personalAddress,
    this.city,
    this.region,
    this.mobile,
    this.profileImageUrl,
    this.password,
    this.mainSpeciality,
    this.subSpeciality,
    this.scientificDegree,
    this.certificatesUrl,
    this.licenseUrl,
    this.videoUrl,
    this.voiceUrl,
    this.email,
  });

  UserDataModel.fromJson(Map<String, dynamic> json) {
    fullName = json["fullName"];
    idType = json["idType"];
    email = json["email"];
    personalID = json["personalID"];
    gender = json["gender"];
    birthDate = json["birthDate"];
    personalAddress = json["personalAddress"];
    city = json["city"];
    region = json["region"];
    mobile = json["mobile"];
    profileImageUrl = json["profileImageUrl"];
    password = json["password"];
    mainSpeciality = json['mainSpeciality'];
    subSpeciality = json['subSpeciality'];
    scientificDegree = json['scientificDegree'];
    certificatesUrl = json['certificatesUrl'];
    licenseUrl = json['licenseUrl'];
    videoUrl = json['videoUrl'];
    voiceUrl = json['voiceUrl'];
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'idType': idType,
      'personalID': personalID,
      'gender': gender,
      'email': email,
      'birthDate': birthDate,
      'personalAddress': personalAddress,
      'city': city,
      'region': region,
      'mobile': mobile,
      'profileImageUrl': profileImageUrl,
      'password': password,
      'mainSpeciality': mainSpeciality,
      'subSpeciality': subSpeciality,
      'scientificDegree': scientificDegree,
      'certificatesUrl': certificatesUrl,
      'licenseUrl': licenseUrl,
      'videoUrl': videoUrl,
      'voiceUrl': voiceUrl,
    };
  }
}
