class ShopModel {

  final String shopName;
  final String location;
  final int number;
  final String mail;

  ShopModel({required this.shopName,required this.number,required this.mail,required this.location});

  Map<String,dynamic> getJson(){
    return{
      "shopName" : shopName,
      "location" : location,
      "number" : number,
      "mail" : mail,
    };
  }

}