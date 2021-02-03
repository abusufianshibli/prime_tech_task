
import 'dart:convert';

class ProductResponseModel {
  ProductResponseModel({
    this.success,
    this.requestTime,
    this.responseTime,
    this.requestUrl,
    this.message,
    this.payload,
    this.payloadType,
  });

  bool success;
  String requestTime;
  String responseTime;
  String requestUrl;
  List<String> message;
  List<Payload> payload;
  String payloadType;

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) => ProductResponseModel(
    success: json["success"] == null ? null : json["success"],
    requestTime: json["requestTime"] == null ? null : json["requestTime"],
    responseTime: json["responseTime"] == null ? null : json["responseTime"],
    requestUrl: json["requestURL"] == null ? null : json["requestURL"],
    message: json["message"] == null ? null : List<String>.from(json["message"].map((x) => x)),
    payload: json["payload"] == null ? null : List<Payload>.from(json["payload"].map((x) => Payload.fromJson(x))),
    payloadType: json["payloadType"] == null ? null : json["payloadType"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "requestTime": requestTime == null ? null : requestTime,
    "responseTime": responseTime == null ? null : responseTime,
    "requestURL": requestUrl == null ? null : requestUrl,
    "message": message == null ? null : List<dynamic>.from(message.map((x) => x)),
    "payload": payload == null ? null : List<dynamic>.from(payload.map((x) => x.toJson())),
    "payloadType": payloadType == null ? null : payloadType,
  };
}

class Payload {
  Payload({
    this.id,
    this.active,
    this.dateUpdated,
    this.sku,
    this.name,
    this.upc,
    this.description,
    this.type,
    this.hasVariants,
    this.assemblyId,
    this.kitId,
    this.sellingPrice,
    this.suggestedRetailPrice,
    this.cost,
    this.availableQuantity,
    this.totalQuantity,
    this.unitId,
    this.unitName,
    this.weight,
    this.taxable,
    this.dropShip,
    this.customField1,
    this.customField2,
    this.customField3,
    this.customField4,
    this.customField5,
    this.customField6,
    this.imageUrl,
  });

  int id;
  bool active;
  DateTime dateUpdated;
  String sku;
  String name;
  String upc;
  String description;
  Type type;
  bool hasVariants;
  int assemblyId;
  int kitId;
  double sellingPrice;
  double suggestedRetailPrice;
  double cost;
  double availableQuantity;
  double totalQuantity;
  int unitId;
  UnitName unitName;
  double weight;
  bool taxable;
  bool dropShip;
  String customField1;
  String customField2;
  String customField3;
  String customField4;
  String customField5;
  String customField6;
  String imageUrl;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    id: json["id"] == null ? null : json["id"],
    active: json["active"] == null ? null : json["active"],
    dateUpdated: json["date_updated"] == null ? null : DateTime.parse(json["date_updated"]),
    sku: json["sku"] == null ? null : json["sku"],
    name: json["name"] == null ? null : json["name"],
    upc: json["upc"] == null ? null : json["upc"],
    description: json["description"] == null ? null : json["description"],
    type: json["type"] == null ? null : typeValues.map[json["type"]],
    hasVariants: json["has_variants"] == null ? null : json["has_variants"],
    assemblyId: json["assembly_id"] == null ? null : json["assembly_id"],
    kitId: json["kit_id"] == null ? null : json["kit_id"],
    sellingPrice: json["selling_price"] == null ? null : json["selling_price"].toDouble(),
    suggestedRetailPrice: json["suggested_retail_price"] == null ? null : json["suggested_retail_price"].toDouble(),
    cost: json["cost"] == null ? null : json["cost"],
    availableQuantity: json["available_quantity"] == null ? null : json["available_quantity"],
    totalQuantity: json["total_quantity"] == null ? null : json["total_quantity"],
    unitId: json["unit_id"] == null ? null : json["unit_id"],
    unitName: json["unit_name"] == null ? null : unitNameValues.map[json["unit_name"]],
    weight: json["weight"] == null ? null : json["weight"],
    taxable: json["taxable"] == null ? null : json["taxable"],
    dropShip: json["drop_ship"] == null ? null : json["drop_ship"],
    customField1: json["custom_field1"] == null ? null : json["custom_field1"],
    customField2: json["custom_field2"] == null ? null : json["custom_field2"],
    customField3: json["custom_field3"] == null ? null : json["custom_field3"],
    customField4: json["custom_field4"] == null ? null : json["custom_field4"],
    customField5: json["custom_field5"] == null ? null : json["custom_field5"],
    customField6: json["custom_field6"] == null ? null : json["custom_field6"],
    imageUrl: json["image_url"] == null ? null : json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "active": active == null ? null : active,
    "date_updated": dateUpdated == null ? null : dateUpdated.toIso8601String(),
    "sku": sku == null ? null : sku,
    "name": name == null ? null : name,
    "upc": upc == null ? null : upc,
    "description": description == null ? null : description,
    "type": type == null ? null : typeValues.reverse[type],
    "has_variants": hasVariants == null ? null : hasVariants,
    "assembly_id": assemblyId == null ? null : assemblyId,
    "kit_id": kitId == null ? null : kitId,
    "selling_price": sellingPrice == null ? null : sellingPrice,
    "suggested_retail_price": suggestedRetailPrice == null ? null : suggestedRetailPrice,
    "cost": cost == null ? null : cost,
    "available_quantity": availableQuantity == null ? null : availableQuantity,
    "total_quantity": totalQuantity == null ? null : totalQuantity,
    "unit_id": unitId == null ? null : unitId,
    "unit_name": unitName == null ? null : unitNameValues.reverse[unitName],
    "weight": weight == null ? null : weight,
    "taxable": taxable == null ? null : taxable,
    "drop_ship": dropShip == null ? null : dropShip,
    "custom_field1": customField1 == null ? null : customField1,
    "custom_field2": customField2 == null ? null : customField2,
    "custom_field3": customField3 == null ? null : customField3,
    "custom_field4": customField4 == null ? null : customField4,
    "custom_field5": customField5 == null ? null : customField5,
    "custom_field6": customField6 == null ? null : customField6,
    "image_url": imageUrl == null ? null : imageUrl,
  };
}

enum Type { INVENTORY, KIT }

final typeValues = EnumValues({
  "Inventory": Type.INVENTORY,
  "Kit": Type.KIT
});

enum UnitName { N_A, EA }

final unitNameValues = EnumValues({
  "EA": UnitName.EA,
  "N/A": UnitName.N_A
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
