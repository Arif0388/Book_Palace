class PlaceModel {
  String placeName;
  String placeImage;
  String hotelId;
  List<dynamic> hotels;

  PlaceModel(
  {
    required this.hotels,
    required this.placeImage,
    required this.placeName,
   required this.hotelId,
}
);
}