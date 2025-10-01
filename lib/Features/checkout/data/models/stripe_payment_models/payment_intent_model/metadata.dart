class Metadata {
  final Map<String, dynamic> data;

  Metadata({this.data = const {}});

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(data: Map<String, dynamic>.from(json));
  }

  Map<String, dynamic> toJson() => data;
}
