class PaymobAuthModel {
  String? token;

  PaymobAuthModel({this.token});

  factory PaymobAuthModel.fromJson(Map<String, dynamic> json) {
    return PaymobAuthModel(token: json['token'] as String?);
  }

  Map<String, dynamic> toJson() => {'token': token};
}
