class OperatorAddModel {
  final bool? status;
  final String? msg;
  final OperatorData? data;

  OperatorAddModel({
    this.status,
    this.msg,
    this.data,
  });

  factory OperatorAddModel.fromJson(Map<String, dynamic> json) {
    return OperatorAddModel(
      status: json['status'],
      msg: json['msg'],
      data: json['data'] != null ? OperatorData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'msg': msg,
      'data': data?.toJson(),
    };
  }
}

// Data model class
class OperatorData {
  final City? city;
  final State? state;
  final Country? country;
  final String? id;
  final String? businessName;
  final String? fName;
  final String? lName;
  final String? appartmentNo;
  final String? businessAddress;
  final LocationAddress? locationAddress;
  final String? userStatus;
  final String? userType;
  final String? zipCode;
  final int? phone;
  final String? email;
  final String? password;
  final int? storeId;
  final String? approveStatus;
  final String? remark;
  final bool? isDeleted;
  final List<dynamic>? range;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final String? feature;
  final int? lastAssignMailNo;

  OperatorData({
    this.city,
    this.state,
    this.country,
    this.id,
    this.businessName,
    this.fName,
    this.lName,
    this.appartmentNo,
    this.businessAddress,
    this.locationAddress,
    this.userStatus,
    this.userType,
    this.zipCode,
    this.phone,
    this.email,
    this.password,
    this.storeId,
    this.approveStatus,
    this.remark,
    this.isDeleted,
    this.range,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.feature,
    this.lastAssignMailNo,
  });

  factory OperatorData.fromJson(Map<String, dynamic> json) {
    return OperatorData(
      city: json['city'] != null ? City.fromJson(json['city']) : null,
      state: json['state'] != null ? State.fromJson(json['state']) : null,
      country:
          json['country'] != null ? Country.fromJson(json['country']) : null,
      id: json['_id'],
      businessName: json['business_name'],
      fName: json['f_name'],
      lName: json['l_name'],
      appartmentNo: json['appartment_no'],
      businessAddress: json['business_address'],
      locationAddress: json['location_address'] != null
          ? LocationAddress.fromJson(json['location_address'])
          : null,
      userStatus: json['user_status'],
      userType: json['user_type'],
      zipCode: json['zip_code'],
      phone: json['phone'],
      email: json['email'],
      password: json['password'],
      storeId: json['store_id'],
      approveStatus: json['approve_status'],
      remark: json['remark'],
      isDeleted: json['isDeleted'],
      range: json['range'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
      feature: json['feature'],
      lastAssignMailNo: json['last_assing_mail_no'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city?.toJson(),
      'state': state?.toJson(),
      'country': country?.toJson(),
      '_id': id,
      'business_name': businessName,
      'f_name': fName,
      'l_name': lName,
      'appartment_no': appartmentNo,
      'business_address': businessAddress,
      'location_address': locationAddress?.toJson(),
      'user_status': userStatus,
      'user_type': userType,
      'zip_code': zipCode,
      'phone': phone,
      'email': email,
      'password': password,
      'store_id': storeId,
      'approve_status': approveStatus,
      'remark': remark,
      'isDeleted': isDeleted,
      'range': range,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
      'feature': feature,
      'last_assing_mail_no': lastAssignMailNo,
    };
  }
}

// City model class
class City {
  final int? cityId;
  final int? stateId;
  final String? name;

  City({this.cityId, this.stateId, this.name});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      cityId: json['city_id'],
      stateId: json['state_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city_id': cityId,
      'state_id': stateId,
      'name': name,
    };
  }
}

// State model class
class State {
  final int? stateId;
  final int? countryId;
  final String? name;

  State({this.stateId, this.countryId, this.name});

  factory State.fromJson(Map<String, dynamic> json) {
    return State(
      stateId: json['state_id'],
      countryId: json['country_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'state_id': stateId,
      'country_id': countryId,
      'name': name,
    };
  }
}

// Country model class
class Country {
  final int? countryId;
  final String? name;

  Country({this.countryId, this.name});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      countryId: json['country_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country_id': countryId,
      'name': name,
    };
  }
}

// LocationAddress model class
class LocationAddress {
  final List<AddressComponent>? addressComponents;
  final String? adrAddress;
  final String? businessStatus;
  final String? formattedAddress;
  final String? formattedPhoneNumber;
  final Geometry? geometry;
  final String? icon;
  final String? iconBackgroundColor;
  final String? iconMaskBaseUri;
  final String? internationalPhoneNumber;
  final String? name;
  final List<Photo>? photos;
  final String? placeId;
  final PlusCode? plusCode;
  final double? rating;
  final String? reference;
  final List<Review>? reviews;
  final List<String>? types;
  final String? url;
  final int? userRatingsTotal;
  final int? utcOffset;
  final String? vicinity;
  final String? website;
  final int? utcOffsetMinutes;

  LocationAddress({
    this.addressComponents,
    this.adrAddress,
    this.businessStatus,
    this.formattedAddress,
    this.formattedPhoneNumber,
    this.geometry,
    this.icon,
    this.iconBackgroundColor,
    this.iconMaskBaseUri,
    this.internationalPhoneNumber,
    this.name,
    this.photos,
    this.placeId,
    this.plusCode,
    this.rating,
    this.reference,
    this.reviews,
    this.types,
    this.url,
    this.userRatingsTotal,
    this.utcOffset,
    this.vicinity,
    this.website,
    this.utcOffsetMinutes,
  });

  factory LocationAddress.fromJson(Map<String, dynamic> json) {
    return LocationAddress(
      addressComponents: (json['address_components'] as List<dynamic>?)
          ?.map((e) => AddressComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      adrAddress: json['adr_address'],
      businessStatus: json['business_status'],
      formattedAddress: json['formatted_address'],
      formattedPhoneNumber: json['formatted_phone_number'],
      geometry:
          json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null,
      icon: json['icon'],
      iconBackgroundColor: json['icon_background_color'],
      iconMaskBaseUri: json['icon_mask_base_uri'],
      internationalPhoneNumber: json['international_phone_number'],
      name: json['name'],
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
      placeId: json['place_id'],
      plusCode: json['plus_code'] != null
          ? PlusCode.fromJson(json['plus_code'])
          : null,
      rating: (json['rating'] as num?)?.toDouble(),
      reference: json['reference'],
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
      url: json['url'],
      userRatingsTotal: json['user_ratings_total'],
      utcOffset: json['utc_offset'],
      vicinity: json['vicinity'],
      website: json['website'],
      utcOffsetMinutes: json['utc_offset_minutes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address_components': addressComponents?.map((e) => e.toJson()).toList(),
      'adr_address': adrAddress,
      'business_status': businessStatus,
      'formatted_address': formattedAddress,
      'formatted_phone_number': formattedPhoneNumber,
      'geometry': geometry?.toJson(),
      'icon': icon,
      'icon_background_color': iconBackgroundColor,
      'icon_mask_base_uri': iconMaskBaseUri,
      'international_phone_number': internationalPhoneNumber,
      'name': name,
      'photos': photos?.map((e) => e.toJson()).toList(),
      'place_id': placeId,
      'plus_code': plusCode?.toJson(),
      'rating': rating,
      'reference': reference,
      'reviews': reviews?.map((e) => e.toJson()).toList(),
      'types': types,
      'url': url,
      'user_ratings_total': userRatingsTotal,
      'utc_offset': utcOffset,
      'vicinity': vicinity,
      'website': website,
      'utc_offset_minutes': utcOffsetMinutes,
    };
  }
}

// AddressComponent model class
class AddressComponent {
  final String? longName;
  final String? shortName;
  final List<String>? types;

  AddressComponent({this.longName, this.shortName, this.types});

  factory AddressComponent.fromJson(Map<String, dynamic> json) {
    return AddressComponent(
      longName: json['long_name'],
      shortName: json['short_name'],
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'long_name': longName,
      'short_name': shortName,
      'types': types,
    };
  }
}

// Geometry model class
class Geometry {
  final Location? location;
  final Viewport? viewport;

  Geometry({this.location, this.viewport});

  factory Geometry.fromJson(Map<String, dynamic> json) {
    return Geometry(
      location:
          json['location'] != null && json['location'] is Map<String, dynamic>
              ? Location.fromJson(json['location'])
              : null,
      viewport:
          json['viewport'] != null && json['viewport'] is Map<String, dynamic>
              ? Viewport.fromJson(json['viewport'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': location?.toJson(),
      'viewport': viewport?.toJson(),
    };
  }
}

class Location {
  final double? lat;
  final double? lng;

  Location({this.lat, this.lng});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lat: json['lat'] is double
          ? json['lat']
          : (json['lat'] as num?)?.toDouble(),
      lng: json['lng'] is double
          ? json['lng']
          : (json['lng'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }
}

// Viewport model class
class Viewport {
  final Location? south;
  final Location? west;
  final Location? north;
  final Location? east;

  Viewport({this.south, this.west, this.north, this.east});

  factory Viewport.fromJson(Map<String, dynamic> json) {
    return Viewport(
      south: json['south'] != null
          ? (json['south'] is Map<String, dynamic>
              ? Location.fromJson(json['south'])
              : null)
          : null,
      west: json['west'] != null
          ? (json['west'] is Map<String, dynamic>
              ? Location.fromJson(json['west'])
              : null)
          : null,
      north: json['north'] != null
          ? (json['north'] is Map<String, dynamic>
              ? Location.fromJson(json['north'])
              : null)
          : null,
      east: json['east'] != null
          ? (json['east'] is Map<String, dynamic>
              ? Location.fromJson(json['east'])
              : null)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'south': south?.toJson(),
      'west': west?.toJson(),
      'north': north?.toJson(),
      'east': east?.toJson(),
    };
  }
}

// Photo model class
class Photo {
  final int? height;
  final String? htmlAttributions;
  final int? width;

  Photo({this.height, this.htmlAttributions, this.width});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      height: json['height'],
      htmlAttributions: json['html_attributions'].toString(),
      width: json['width'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'html_attributions': htmlAttributions,
      'width': width,
    };
  }
}

// PlusCode model class
class PlusCode {
  final String? compoundCode;
  final String? globalCode;

  PlusCode({this.compoundCode, this.globalCode});

  factory PlusCode.fromJson(Map<String, dynamic> json) {
    return PlusCode(
      compoundCode: json['compound_code'],
      globalCode: json['global_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'compound_code': compoundCode,
      'global_code': globalCode,
    };
  }
}

// Review model class
class Review {
  final String? authorName;
  final String? authorUrl;
  final String? language;
  final String? profilePhotoUrl;
  final int? rating;
  final String? relativeTimeDescription;
  final String? text;
  final int? time;

  Review({
    this.authorName,
    this.authorUrl,
    this.language,
    this.profilePhotoUrl,
    this.rating,
    this.relativeTimeDescription,
    this.text,
    this.time,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      authorName: json['author_name'],
      authorUrl: json['author_url'],
      language: json['language'],
      profilePhotoUrl: json['profile_photo_url'],
      rating: json['rating'],
      relativeTimeDescription: json['relative_time_description'],
      text: json['text'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'author_name': authorName,
      'author_url': authorUrl,
      'language': language,
      'profile_photo_url': profilePhotoUrl,
      'rating': rating,
      'relative_time_description': relativeTimeDescription,
      'text': text,
      'time': time,
    };
  }
}
