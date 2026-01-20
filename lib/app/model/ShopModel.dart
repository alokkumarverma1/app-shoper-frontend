class ShopModel {
    final int? id;
  final String shopName;
  final String location;
  final int number;
  final String email;
  final String? category;

  ShopModel({required this.shopName,required this.number,required this.email,required this.location, this.category,this.id});

  Map<String,dynamic> getJson(){
    return{
      "id" : id,
      "shopName" : shopName,
      "location" : location,
      "number" : number,
      "mail" : email,
      "category" : category,
    };
  }

  factory ShopModel.fromJson(Map<String,dynamic> json){
    return ShopModel(
      id: json["id"],
        shopName:json["shopName"],
        number: json["number"],
        email: json["email"],
        location: json["location"],
      category: json["category"],
    );
  }


}