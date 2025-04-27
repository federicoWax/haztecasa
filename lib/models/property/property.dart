import "package:mapbox_maps_flutter/mapbox_maps_flutter.dart";

enum PropertyAge {
  none(0),
  preSale(1),
  openNewHouse(2);

  final int valor;
  const PropertyAge(this.valor);
}

class Property {
  final String id;
  final String type;
  final int? salient;
  final String category;
  final String image;
  final int status;
  final List<String> images;
  final String? video;
  final String state;
  final String city;
  final String neighborhood;
  final String description;
  final double dimension;
  final double construction;
  final int price;
  final int bedrooms;
  final int floor;
  final int? locationRange;
  final int? furniture;
  final String? propertyNumber;
  final String? street;
  final int? postalCode;
  final int? privacy;
  final PropertyAge? propertyAge;
  final int? negotiable;
  final bool? remate;
  final int? cars;
  final Position? position;
  final double baths;
  final String amenities;
  final String userImage;
  final String userName;
  final String userDate;
  final String extraInfo;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String profileId;

  //local to widget props
  bool? isFavorite;

  Property({
    required this.id,
    required this.type,
    this.salient,
    required this.category,
    required this.image,
    required this.status,
    required this.images,
    this.video,
    required this.state,
    required this.city,
    required this.neighborhood,
    required this.description,
    required this.dimension,
    required this.construction,
    required this.price,
    required this.bedrooms,
    required this.floor,
    this.locationRange,
    this.furniture,
    this.propertyNumber,
    this.street,
    this.postalCode,
    this.privacy,
    this.propertyAge,
    this.negotiable,
    this.remate,
    this.cars,
    this.position,
    required this.baths,
    required this.amenities,
    required this.userImage,
    required this.userName,
    required this.userDate,
    required this.extraInfo,
    required this.createdAt,
    required this.updatedAt,
    required this.profileId,

    //local to widget props
    this.isFavorite,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json["id"] as String,
      type: json["type"] as String,
      salient: json["salient"] as int?,
      category: json["category"] as String,
      image: json["image"] as String,
      status: json["status"] as int,
      images: List<String>.from(json["images"] ?? []),
      video: json["video"] as String?,
      state: json["state"] as String,
      city: json["city"] as String,
      neighborhood: json["neighborhood"] as String,
      description: json["description"] as String,
      dimension: json["dimension"] as double,
      construction: json["construction"] as double,
      price: json["price"] as int,
      bedrooms: json["bedrooms"] as int,
      floor: json["floor"] as int,
      locationRange: json["locationRange"] as int?,
      furniture: json["furniture"] as int?,
      propertyNumber: json["propertyNumber"] as String?,
      street: json["street"] as String?,
      postalCode: json["postalCode"] as int?,
      privacy: json["privacy"] as int?,
      propertyAge: json["propertyAge"] as PropertyAge?,
      negotiable: json["negotiable"] as int?,
      remate: json["remate"] != null && json["remate"] == 1,
      cars: json["cars"] as int?,
      position:
          json["latitude"] != null && json["longitude"] != null ? Position(double.parse(json["longitude"]), double.parse(json["latitude"])) : null,
      baths: double.parse(json["baths"].toString()),
      amenities: json["amenities"] as String,
      userImage: json["userImage"] as String,
      userName: json["userName"] as String,
      userDate: json["userDate"] as String,
      extraInfo: json["extraInfo"] as String,
      createdAt: DateTime.parse(json["createdAt"] as String),
      updatedAt: DateTime.parse(json["updatedAt"] as String),
      profileId: json["profileId"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "type": type,
      "salient": salient,
      "category": category,
      "image": image,
      "status": status,
      "images": images,
      "video": video,
      "state": state,
      "city": city,
      "neighborhood": neighborhood,
      "description": description,
      "dimension": dimension,
      "construction": construction,
      "price": price,
      "bedrooms": bedrooms,
      "floor": floor,
      "locationRange": locationRange,
      "furniture": furniture,
      "propertyNumber": propertyNumber,
      "street": street,
      "postalCode": postalCode,
      "privacy": privacy,
      "propertyAge": propertyAge,
      "negotiable": negotiable,
      "remate": remate,
      "cars": cars,
      "latitude": position?.lat,
      "longitude": position?.lng,
      "baths": baths.toString(),
      "amenities": amenities,
      "userImage": userImage,
      "userName": userName,
      "userDate": userDate,
      "extraInfo": extraInfo,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
      "profileId": profileId,
    };
  }
}

List<Property> listPropertyDummy = [
  Property(
    id: "1",
    type: "Casa",
    category: "Casa",
    image:
        "https://media.istockphoto.com/id/2170236823/photo/new-suburban-houses.jpg?s=1024x1024&w=is&k=20&c=t-6H8Rb6EIVrMShNPf0aEyU_qQD2epMpk2jOln2Nsew=",
    status: 1,
    images: ["https://images.unsplash.com/photo-1601758123927-4c3f8b2a5d0e", "https://images.unsplash.com/photo-1601758123927-4c3f8b2a5d0e"],
    state: "Estado de México",
    city: "Toluca",
    neighborhood: "Centro",
    description: "Casa en venta en el centro de Toluca, Estado de México.",
    dimension: 120,
    construction: 100,
    price: 2000000,
    bedrooms: 3,
    floor: 2,
    baths: 2,
    amenities: "Cocina, Sala, Comedor, Jardín",
    userImage: "https://images.unsplash.com/photo-1601758123927-4c3f8b2a5d0e",
    userName: "Juan Pérez",
    userDate: "2023-10-01",
    extraInfo: "Casa con excelente ubicación y precio.",
    profileId: "12345",

    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    position: Position(19.2923, -99.6572),
    remate: true,
    propertyAge: PropertyAge.openNewHouse, // Toluca coordinates
  ),
  Property(
    id: "2",
    type: "Departamento",
    category: "Departamento",
    image:
        "https://media.istockphoto.com/id/2175973654/photo/modern-backyard-with-small-house-and-patio-furniture-at-sunset.jpg?s=1024x1024&w=is&k=20&c=k2BPlmaHpQLUJm20T8tKr5sDdRiDe-AFa9-1s9wj4Xc=",
    status: 1,
    images: ["https://images.unsplash.com/photo-1601758123927-4c3f8b2a5d0e", "https://images.unsplash.com/photo-1601758123927-4c3f8b2a5d0e"],
    state: "Ciudad de México",
    city: "CDMX",
    neighborhood: "Polanco",
    description: "Departamento en venta en Polanco, Ciudad de México.",
    dimension: 80,
    construction: 70,
    price: 5000000,
    bedrooms: 2,
    floor: 5,
    baths: 2,
    amenities: "Cocina, Sala, Comedor, Gimnasio",
    userImage: "https://images.unsplash.com/photo-1601758123927-4c3f8b2a5d0e",
    userName: "María López",
    userDate: "2023-10-01",
    extraInfo: "Departamento con vista al parque.",
    profileId: "12346",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    position: Position(19.4326, -99.1332),
    propertyAge: PropertyAge.preSale,
  ),
  Property(
    id: "21",
    type: "Casa",
    category: "Residencial",
    image: "https://images.unsplash.com/photo-1600585154340-be6161a56a0c",
    status: 1,
    images: ["https://images.unsplash.com/photo-1572120360610-d971b9d7767c", "https://images.unsplash.com/photo-1568605114967-8130f3a36994"],
    state: "Nuevo León",
    city: "Monterrey",
    neighborhood: "San Jerónimo",
    description: "Residencia moderna con acabados de lujo en San Jerónimo.",
    dimension: 250,
    construction: 230,
    price: 7500000,
    bedrooms: 4,
    floor: 2,
    baths: 3,
    amenities: "Alberca, Terraza, Cocina integral",
    userImage: "https://randomuser.me/api/portraits/men/21.jpg",
    userName: "Carlos Ramírez",
    userDate: "2024-03-15",
    extraInfo: "Incluye sistema inteligente de seguridad y domótica.",
    profileId: "user21",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    position: Position(25.6866, -100.3161),
  ),
  Property(
    id: "22",
    type: "Departamento",
    category: "Lujo",
    image: "https://images.unsplash.com/photo-1568605114967-8130f3a36994",
    status: 1,
    images: ["https://images.unsplash.com/photo-1599423300746-b62533397364", "https://images.unsplash.com/photo-1556912998-6b388285f5b4"],
    state: "Querétaro",
    city: "Querétaro",
    neighborhood: "Juriquilla",
    description: "Penthouse en Juriquilla con vista panorámica.",
    dimension: 180,
    construction: 180,
    price: 6200000,
    bedrooms: 3,
    floor: 10,
    baths: 2,
    amenities: "Roof garden, Gimnasio, Vigilancia 24h",
    userImage: "https://randomuser.me/api/portraits/women/22.jpg",
    userName: "Fernanda Torres",
    userDate: "2024-02-10",
    extraInfo: "Ideal para ejecutivos o familias pequeñas.",
    profileId: "user22",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    position: Position(20.7036, -100.4376),
    remate: true,
  ),
  Property(
    id: "23",
    type: "Casa",
    category: "Campestre",
    image: "https://images.unsplash.com/photo-1507089947368-19c1da9775ae",
    status: 1,
    images: ["https://images.unsplash.com/photo-1507089947368-19c1da9775ae", "https://images.unsplash.com/photo-1553583204-9c5f5c9b4a2d"],
    state: "Chiapas",
    city: "San Cristóbal de las Casas",
    neighborhood: "Barrio El Cerrillo",
    description: "Casa campestre rodeada de naturaleza.",
    dimension: 300,
    construction: 180,
    price: 2800000,
    bedrooms: 3,
    floor: 1,
    baths: 2,
    amenities: "Chimenea, Jardín amplio, Huerto",
    userImage: "https://randomuser.me/api/portraits/men/23.jpg",
    userName: "Luis Hernández",
    userDate: "2024-01-20",
    extraInfo: "Ambiente tranquilo, ideal para descansar.",
    profileId: "user23",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    position: Position(16.7370, -92.6376),
  ),
];
