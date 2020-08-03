import 'dart:core';

//this class is for the different types of locations to be viewed
class DestinationModel {
  final String id;
  final String title;
  final String description;
  final List<String> imgAssetsPath;

  DestinationModel({
    this.id,
    this.title,
    this.description,
    this.imgAssetsPath,
  });
}
//this is for the locactions class (the list to add more or less)
final List<DestinationModel> travelDestinations = [
  DestinationModel(
    id: 'Capetown',
    title: 'Cape',
    description:
    'Capetown is one of thee best locations if you are deciding to visit South Africa, From the culture to the iconic table mountain',
    imgAssetsPath: [
      'assets/capetown.jpg',
      'assets/kos.jpg',
      'assets/london.jpg',
      'assets/paris.jpg',
    ],
  ),
  DestinationModel(
    id: 'Kos',
    title: 'Kos',
    description:
    'Kos is a small island in greece but has alot to offer, perhaps not to live but definetly for tourists',
    imgAssetsPath: [
      'assets/kos.jpg',
      'assets/capetown.jpg',
      'assets/london.jpg',
      'assets/paris.jpg',
    ],

  ),
  DestinationModel(
    id: 'London',
    title: 'London',
    description:
    'Ahh London, the heart of the United Kingdom, this is defiently a place to visit',
    imgAssetsPath: [
      'assets/london.jpg',
      'assets/capetown.jpg',
      'assets/kos.jpg',
      'assets/paris.jpg',
    ],

  ),
  DestinationModel(
    id: 'Paris',
    title: 'Paris',
    description:
    'Paris, the city of love, Defiently take your partner here for a romantic getaway',
    imgAssetsPath: [
      'assets/paris.jpg',
      'assets/capetown.jpg',
      'assets/kos.jpg',
      'assets/london.jpg',
    ],

  ),
];