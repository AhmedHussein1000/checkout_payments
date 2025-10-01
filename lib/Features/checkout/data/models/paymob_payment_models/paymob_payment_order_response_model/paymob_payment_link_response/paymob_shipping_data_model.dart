class PaymobShippingDataModel {
  int? id;
  String? firstName;
  String? lastName;
  String? street;
  String? building;
  String? floor;
  String? apartment;
  String? city;
  String? state;
  String? country;
  String? email;
  String? phoneNumber;
  String? postalCode;
  String? extraDescription;
  String? shippingMethod;
  int? orderId;
  int? order;

  PaymobShippingDataModel({
    this.id,
    this.firstName,
    this.lastName,
    this.street,
    this.building,
    this.floor,
    this.apartment,
    this.city,
    this.state,
    this.country,
    this.email,
    this.phoneNumber,
    this.postalCode,
    this.extraDescription,
    this.shippingMethod,
    this.orderId,
    this.order,
  });

  factory PaymobShippingDataModel.fromJson(Map<String, dynamic> json) =>
      PaymobShippingDataModel(
        id: json['id'] as int?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        street: json['street'] as String?,
        building: json['building'] as String?,
        floor: json['floor'] as String?,
        apartment: json['apartment'] as String?,
        city: json['city'] as String?,
        state: json['state'] as String?,
        country: json['country'] as String?,
        email: json['email'] as String?,
        phoneNumber: json['phone_number'] as String?,
        postalCode: json['postal_code'] as String?,
        extraDescription: json['extra_description'] as String?,
        shippingMethod: json['shipping_method'] as String?,
        orderId: json['order_id'] as int?,
        order: json['order'] as int?,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'first_name': firstName,
    'last_name': lastName,
    'street': street,
    'building': building,
    'floor': floor,
    'apartment': apartment,
    'city': city,
    'state': state,
    'country': country,
    'email': email,
    'phone_number': phoneNumber,
    'postal_code': postalCode,
    'extra_description': extraDescription,
    'shipping_method': shippingMethod,
    'order_id': orderId,
    'order': order,
  };
}
