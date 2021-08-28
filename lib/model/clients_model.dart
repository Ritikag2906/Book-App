import 'dart:convert';

class Client {
  String id;
  String name;
  String company;
  String orderId;
  String invoicepaid;
  String invoicePending;
  Client({
    required this.id,
    required this.name,
    required this.company,
    required this.orderId,
    required this.invoicepaid,
    required this.invoicePending,
  });

  @override
  String toString() {
    return 'Client(id: $id, name: $name, company: $company, orderId: $orderId, invoicepaid: $invoicepaid, invoicePending: $invoicePending)';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'company': company,
      'orderId': orderId,
      'invoicepaid': invoicepaid,
      'invoicePending': invoicePending,
    };
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      id: map['id'],
      name: map['name'],
      company: map['company'],
      orderId: map['orderId'],
      invoicepaid: map['invoicepaid'],
      invoicePending: map['invoicePending'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Client.fromJson(String source) => Client.fromMap(json.decode(source));
}
