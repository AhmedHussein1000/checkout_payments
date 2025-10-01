class PaymobOrderShippingDataInputModel {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;

  PaymobOrderShippingDataInputModel({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
  });

  factory PaymobOrderShippingDataInputModel.fromJson(
    Map<String, dynamic> json,
  ) => PaymobOrderShippingDataInputModel(
    firstName: json['first_name'] as String?,
    lastName: json['last_name'] as String?,
    phoneNumber: json['phone_number'] as String?,
    email: json['email'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'first_name': firstName,
    'last_name': lastName,
    'phone_number': phoneNumber,
    'email': email,
  };
}
