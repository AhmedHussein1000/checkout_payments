class PaymobMerchantModel {
  int? id;
  DateTime? createdAt;
  List<dynamic>? phones;
  List<dynamic>? companyEmails;
  String? companyName;
  String? state;
  String? country;
  String? city;
  String? postalCode;
  String? street;

  PaymobMerchantModel({
    this.id,
    this.createdAt,
    this.phones,
    this.companyEmails,
    this.companyName,
    this.state,
    this.country,
    this.city,
    this.postalCode,
    this.street,
  });

  factory PaymobMerchantModel.fromJson(Map<String, dynamic> json) =>
      PaymobMerchantModel(
        id: json['id'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        phones: json['phones'] as List<dynamic>?,
        companyEmails: json['company_emails'] as List<dynamic>?,
        companyName: json['company_name'] as String?,
        state: json['state'] as String?,
        country: json['country'] as String?,
        city: json['city'] as String?,
        postalCode: json['postal_code'] as String?,
        street: json['street'] as String?,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'created_at': createdAt?.toIso8601String(),
    'phones': phones,
    'company_emails': companyEmails,
    'company_name': companyName,
    'state': state,
    'country': country,
    'city': city,
    'postal_code': postalCode,
    'street': street,
  };
}
