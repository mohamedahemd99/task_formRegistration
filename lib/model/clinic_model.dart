class Clinic {
  String? clinicName;
  String? clinicAddress;
  String? clinicPhone;

  Clinic({this.clinicName, this.clinicAddress, this.clinicPhone});

  Clinic.fromJson(Map<String, dynamic> json) {
    clinicName = json['clinicName'];
    clinicAddress = json['clinicAddress'];
    clinicPhone = json['clinicPhone'];
  }

  Map<String, dynamic> toJson() {
    return {
      'clinicAddress': clinicAddress,
      'clinicName': clinicName,
      'clinicPhone': clinicPhone,
    };
  }
}
