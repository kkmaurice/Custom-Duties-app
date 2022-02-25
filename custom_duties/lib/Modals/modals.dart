// To parse this JSON data, do
//
//     final empty = emptyFromJson(jsonString);

import 'dart:convert';

List<Products> productFromJson(String str) => List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productToJson(List<Products> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
    Products({
        required this.id,
        required this.chscode,
        required this.cdescription,
        required this.cqty,
        required this.crate,
    });

    int id;
    String chscode;
    String cdescription;
    String cqty;
    String crate;

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["Id"],
        chscode: json["chscode"],
        cdescription: json["cdescription"],
        cqty: json["cqty"],
        crate: json["crate"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "chscode": chscode,
        "cdescription": cdescription,
        "cqty": cqty,
        "crate": crate,
    };

  static fetchProducts() {}
}
