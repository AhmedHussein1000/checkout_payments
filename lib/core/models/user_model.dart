class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String? address;
  final String? city;
  final String? country;
  final String? postalCode;
  final String? state;

  const UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    this.address,
    this.city,
    this.country,
    this.postalCode,
    this.state,
  });

  String get fullName => '$firstName $lastName';

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone_number': phoneNumber,
      'address': address,
      'city': city,
      'country': country,
      'postal_code': postalCode,
      'state': state,
    };
  }

  // For Paymob shipping data format
  Map<String, dynamic> toShippingData() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone_number': phoneNumber,
      'street': address ?? 'NA',
      'city': city ?? 'NA',
      'country': country ?? 'NA',
      'postal_code': postalCode ?? 'NA',
      'state': state ?? 'NA',
    };
  }
}
