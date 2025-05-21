class HotelModel {
  String hotelName;
  String hotelPrice;
  String hotelDesc;
  String hotelAddress;
  String hotelImage;
  bool isWifi;
  bool isHdtv;
  bool isKitchen;
  bool isBathroom;

  HotelModel(
      {
        required this.hotelDesc,
        required this.hotelAddress,
        required this.hotelName,
        required this.hotelImage,
        required this.hotelPrice,
        required this.isBathroom,
        required this.isHdtv,
        required this.isKitchen,
        required this.isWifi
     }
      );
}