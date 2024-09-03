class UploadImageModel {
  final bool? status;
  final List<Data>? data;
  final String? msg;
  final int? total;

  UploadImageModel({
    this.status,
    this.data,
    this.msg,
    this.total,
  });

  UploadImageModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        data = (json['data'] as List?)
            ?.map((dynamic e) => Data.fromJson(e as Map<String, dynamic>))
            .toList(),
        msg = json['msg'] as String?,
        total = json['total'] as int?;

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.map((e) => e.toJson()).toList(),
        'msg': msg,
        'total': total
      };
}

class Data {
  final Plan? plan;
  final String? id;
  final String? accountType;
  final String? mailBoxNum;
  final String? fname;
  final String? lname;
  final String? username;
  final String? email;
  final String? phone;
  final String? userType;
  final dynamic businessName;
  final String? userStatus;
  final List<String>? usps;
  final String? uspsStatus;
  final PlanId? planId;
  final Feature? feature;
  final String? softCash;
  final String? cusId;
  final bool? isDeleted;
  final String? paymentStatus;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final List<Subscription>? subscription;
  final String? idd;

  Data({
    this.plan,
    this.id,
    this.accountType,
    this.mailBoxNum,
    this.fname,
    this.lname,
    this.username,
    this.email,
    this.phone,
    this.userType,
    this.businessName,
    this.userStatus,
    this.usps,
    this.uspsStatus,
    this.planId,
    this.feature,
    this.softCash,
    this.cusId,
    this.isDeleted,
    this.paymentStatus,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.subscription,
    this.idd,
  });

  Data.fromJson(Map<String, dynamic> json)
      : plan = (json['plan'] as Map<String, dynamic>?) != null
            ? Plan.fromJson(json['plan'] as Map<String, dynamic>)
            : null,
        id = json['_id'] as String?,
        accountType = json['accountType'] as String?,
        mailBoxNum = json['mail_box_num'] as String?,
        fname = json['fname'] as String?,
        lname = json['lname'] as String?,
        username = json['username'] as String?,
        email = json['email'] as String?,
        phone = json['phone'] as String?,
        userType = json['user_type'] as String?,
        businessName = json['business_name'],
        userStatus = json['user_status'] as String?,
        usps =
            (json['usps'] as List?)?.map((dynamic e) => e as String).toList(),
        uspsStatus = json['usps_status'] as String?,
        planId = (json['plan_id'] as Map<String, dynamic>?) != null
            ? PlanId.fromJson(json['plan_id'] as Map<String, dynamic>)
            : null,
        feature = (json['feature'] as Map<String, dynamic>?) != null
            ? Feature.fromJson(json['feature'] as Map<String, dynamic>)
            : null,
        softCash = json['soft_cash'] as String?,
        cusId = json['cus_id'] as String?,
        isDeleted = json['isDeleted'] as bool?,
        paymentStatus = json['payment_status'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        v = json['__v'] as int?,
        subscription = (json['subscription'] as List?)
            ?.map(
                (dynamic e) => Subscription.fromJson(e as Map<String, dynamic>))
            .toList(),
        idd = json['id'] as String?;

  Map<String, dynamic> toJson() => {
        'plan': plan?.toJson(),
        '_id': id,
        'accountType': accountType,
        'mail_box_num': mailBoxNum,
        'fname': fname,
        'lname': lname,
        'username': username,
        'email': email,
        'phone': phone,
        'user_type': userType,
        'business_name': businessName,
        'user_status': userStatus,
        'usps': usps,
        'usps_status': uspsStatus,
        'plan_id': planId?.toJson(),
        'feature': feature?.toJson(),
        'soft_cash': softCash,
        'cus_id': cusId,
        'isDeleted': isDeleted,
        'payment_status': paymentStatus,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v,
        'subscription': subscription?.map((e) => e.toJson()).toList(),
        'id': id
      };
}

class Plan {
  final dynamic expiredAt;
  final dynamic planType;

  Plan({
    this.expiredAt,
    this.planType,
  });

  Plan.fromJson(Map<String, dynamic> json)
      : expiredAt = json['expired_at'],
        planType = json['plan_type'];

  Map<String, dynamic> toJson() =>
      {'expired_at': expiredAt, 'plan_type': planType};
}

class PlanId {
  final IncomingMail? incomingMail;
  final OpenScan? openScan;
  final Recipients? recipients;
  final Shred? shred;
  final LocalPickup? localPickup;
  final Recycle? recycle;
  final PhysicalStorage? physicalStorage;
  final String? id;
  final String? type;
  final String? name;
  final String? price;
  final int? onlineStorage;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  PlanId({
    this.incomingMail,
    this.openScan,
    this.recipients,
    this.shred,
    this.localPickup,
    this.recycle,
    this.physicalStorage,
    this.id,
    this.type,
    this.name,
    this.price,
    this.onlineStorage,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  PlanId.fromJson(Map<String, dynamic> json)
      : incomingMail = (json['incoming_mail'] as Map<String, dynamic>?) != null
            ? IncomingMail.fromJson(
                json['incoming_mail'] as Map<String, dynamic>)
            : null,
        openScan = (json['open_scan'] as Map<String, dynamic>?) != null
            ? OpenScan.fromJson(json['open_scan'] as Map<String, dynamic>)
            : null,
        recipients = (json['recipients'] as Map<String, dynamic>?) != null
            ? Recipients.fromJson(json['recipients'] as Map<String, dynamic>)
            : null,
        shred = (json['shred'] as Map<String, dynamic>?) != null
            ? Shred.fromJson(json['shred'] as Map<String, dynamic>)
            : null,
        localPickup = (json['local_pickup'] as Map<String, dynamic>?) != null
            ? LocalPickup.fromJson(json['local_pickup'] as Map<String, dynamic>)
            : null,
        recycle = (json['recycle'] as Map<String, dynamic>?) != null
            ? Recycle.fromJson(json['recycle'] as Map<String, dynamic>)
            : null,
        physicalStorage =
            (json['physical_storage'] as Map<String, dynamic>?) != null
                ? PhysicalStorage.fromJson(
                    json['physical_storage'] as Map<String, dynamic>)
                : null,
        id = json['_id'] as String?,
        type = json['type'] as String?,
        name = json['name'] as String?,
        price = json['price'] as String?,
        onlineStorage = json['online_storage'] as int?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
        'incoming_mail': incomingMail?.toJson(),
        'open_scan': openScan?.toJson(),
        'recipients': recipients?.toJson(),
        'shred': shred?.toJson(),
        'local_pickup': localPickup?.toJson(),
        'recycle': recycle?.toJson(),
        'physical_storage': physicalStorage?.toJson(),
        '_id': id,
        'type': type,
        'name': name,
        'price': price,
        'online_storage': onlineStorage,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v
      };
}

class IncomingMail {
  final int? count;
  final String? charges;

  IncomingMail({
    this.count,
    this.charges,
  });

  IncomingMail.fromJson(Map<String, dynamic> json)
      : count = json['count'] as int?,
        charges = json['charges'] as String?;

  Map<String, dynamic> toJson() => {'count': count, 'charges': charges};
}

class OpenScan {
  final int? count;
  final String? charges;

  OpenScan({
    this.count,
    this.charges,
  });

  OpenScan.fromJson(Map<String, dynamic> json)
      : count = json['count'] as int?,
        charges = json['charges'] as String?;

  Map<String, dynamic> toJson() => {'count': count, 'charges': charges};
}

class Recipients {
  final int? count;
  final String? charges;

  Recipients({
    this.count,
    this.charges,
  });

  Recipients.fromJson(Map<String, dynamic> json)
      : count = json['count'] as int?,
        charges = json['charges'] as String?;

  Map<String, dynamic> toJson() => {'count': count, 'charges': charges};
}

class Shred {
  final int? count;
  final String? charges;

  Shred({
    this.count,
    this.charges,
  });

  Shred.fromJson(Map<String, dynamic> json)
      : count = json['count'] as int?,
        charges = json['charges'] as String?;

  Map<String, dynamic> toJson() => {'count': count, 'charges': charges};
}

class LocalPickup {
  final int? count;
  final String? charges;

  LocalPickup({
    this.count,
    this.charges,
  });

  LocalPickup.fromJson(Map<String, dynamic> json)
      : count = json['count'] as int?,
        charges = json['charges'] as String?;

  Map<String, dynamic> toJson() => {'count': count, 'charges': charges};
}

class Recycle {
  final int? count;
  final String? charges;

  Recycle({
    this.count,
    this.charges,
  });

  Recycle.fromJson(Map<String, dynamic> json)
      : count = json['count'] as int?,
        charges = json['charges'] as String?;

  Map<String, dynamic> toJson() => {'count': count, 'charges': charges};
}

class PhysicalStorage {
  final StandardEnvelope? standardEnvelope;
  final LargeEnvelope? largeEnvelope;
  final PaddedMailer? paddedMailer;
  final SmallBox? smallBox;
  final MailingTube? mailingTube;
  final MediumBox? mediumBox;
  final LargeBox? largeBox;
  final ExtraLargeBox? extraLargeBox;

  PhysicalStorage({
    this.standardEnvelope,
    this.largeEnvelope,
    this.paddedMailer,
    this.smallBox,
    this.mailingTube,
    this.mediumBox,
    this.largeBox,
    this.extraLargeBox,
  });

  PhysicalStorage.fromJson(Map<String, dynamic> json)
      : standardEnvelope =
            (json['standard_envelope'] as Map<String, dynamic>?) != null
                ? StandardEnvelope.fromJson(
                    json['standard_envelope'] as Map<String, dynamic>)
                : null,
        largeEnvelope =
            (json['large_envelope'] as Map<String, dynamic>?) != null
                ? LargeEnvelope.fromJson(
                    json['large_envelope'] as Map<String, dynamic>)
                : null,
        paddedMailer = (json['padded_mailer'] as Map<String, dynamic>?) != null
            ? PaddedMailer.fromJson(
                json['padded_mailer'] as Map<String, dynamic>)
            : null,
        smallBox = (json['small_box'] as Map<String, dynamic>?) != null
            ? SmallBox.fromJson(json['small_box'] as Map<String, dynamic>)
            : null,
        mailingTube = (json['mailing_tube'] as Map<String, dynamic>?) != null
            ? MailingTube.fromJson(json['mailing_tube'] as Map<String, dynamic>)
            : null,
        mediumBox = (json['medium_box'] as Map<String, dynamic>?) != null
            ? MediumBox.fromJson(json['medium_box'] as Map<String, dynamic>)
            : null,
        largeBox = (json['large_box'] as Map<String, dynamic>?) != null
            ? LargeBox.fromJson(json['large_box'] as Map<String, dynamic>)
            : null,
        extraLargeBox =
            (json['extra_large_box'] as Map<String, dynamic>?) != null
                ? ExtraLargeBox.fromJson(
                    json['extra_large_box'] as Map<String, dynamic>)
                : null;

  Map<String, dynamic> toJson() => {
        'standard_envelope': standardEnvelope?.toJson(),
        'large_envelope': largeEnvelope?.toJson(),
        'padded_mailer': paddedMailer?.toJson(),
        'small_box': smallBox?.toJson(),
        'mailing_tube': mailingTube?.toJson(),
        'medium_box': mediumBox?.toJson(),
        'large_box': largeBox?.toJson(),
        'extra_large_box': extraLargeBox?.toJson()
      };
}

class StandardEnvelope {
  final String? charges;
  final int? count;

  StandardEnvelope({
    this.charges,
    this.count,
  });

  StandardEnvelope.fromJson(Map<String, dynamic> json)
      : charges = json['charges'] as String?,
        count = json['count'] as int?;

  Map<String, dynamic> toJson() => {'charges': charges, 'count': count};
}

class LargeEnvelope {
  final String? charges;
  final int? count;

  LargeEnvelope({
    this.charges,
    this.count,
  });

  LargeEnvelope.fromJson(Map<String, dynamic> json)
      : charges = json['charges'] as String?,
        count = json['count'] as int?;

  Map<String, dynamic> toJson() => {'charges': charges, 'count': count};
}

class PaddedMailer {
  final String? charges;
  final int? count;

  PaddedMailer({
    this.charges,
    this.count,
  });

  PaddedMailer.fromJson(Map<String, dynamic> json)
      : charges = json['charges'] as String?,
        count = json['count'] as int?;

  Map<String, dynamic> toJson() => {'charges': charges, 'count': count};
}

class SmallBox {
  final String? charges;
  final int? count;

  SmallBox({
    this.charges,
    this.count,
  });

  SmallBox.fromJson(Map<String, dynamic> json)
      : charges = json['charges'] as String?,
        count = json['count'] as int?;

  Map<String, dynamic> toJson() => {'charges': charges, 'count': count};
}

class MailingTube {
  final String? charges;
  final int? count;

  MailingTube({
    this.charges,
    this.count,
  });

  MailingTube.fromJson(Map<String, dynamic> json)
      : charges = json['charges'] as String?,
        count = json['count'] as int?;

  Map<String, dynamic> toJson() => {'charges': charges, 'count': count};
}

class MediumBox {
  final String? charges;
  final int? count;

  MediumBox({
    this.charges,
    this.count,
  });

  MediumBox.fromJson(Map<String, dynamic> json)
      : charges = json['charges'] as String?,
        count = json['count'] as int?;

  Map<String, dynamic> toJson() => {'charges': charges, 'count': count};
}

class LargeBox {
  final String? charges;
  final int? count;

  LargeBox({
    this.charges,
    this.count,
  });

  LargeBox.fromJson(Map<String, dynamic> json)
      : charges = json['charges'] as String?,
        count = json['count'] as int?;

  Map<String, dynamic> toJson() => {'charges': charges, 'count': count};
}

class ExtraLargeBox {
  final String? charges;
  final int? count;

  ExtraLargeBox({
    this.charges,
    this.count,
  });

  ExtraLargeBox.fromJson(Map<String, dynamic> json)
      : charges = json['charges'] as String?,
        count = json['count'] as int?;

  Map<String, dynamic> toJson() => {'charges': charges, 'count': count};
}

class Feature {
  final Geometry? geometry;
  final Properties? properties;
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Feature({
    this.geometry,
    this.properties,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Feature.fromJson(Map<String, dynamic> json)
      : geometry = (json['geometry'] as Map<String, dynamic>?) != null
            ? Geometry.fromJson(json['geometry'] as Map<String, dynamic>)
            : null,
        properties = (json['properties'] as Map<String, dynamic>?) != null
            ? Properties.fromJson(json['properties'] as Map<String, dynamic>)
            : null,
        id = json['_id'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
        'geometry': geometry?.toJson(),
        'properties': properties?.toJson(),
        '_id': id,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v
      };
}

class Geometry {
  final String? type;
  final List<double>? coordinates;

  Geometry({
    this.type,
    this.coordinates,
  });

  Geometry.fromJson(Map<String, dynamic> json)
      : type = json['type'] as String?,
        coordinates = (json['coordinates'] as List?)
            ?.map((dynamic e) => e as double)
            .toList();

  Map<String, dynamic> toJson() => {'type': type, 'coordinates': coordinates};
}

class Properties {
  final FeatureDetails? featureDetails;

  Properties({
    this.featureDetails,
  });

  Properties.fromJson(Map<String, dynamic> json)
      : featureDetails =
            (json['feature_details'] as Map<String, dynamic>?) != null
                ? FeatureDetails.fromJson(
                    json['feature_details'] as Map<String, dynamic>)
                : null;

  Map<String, dynamic> toJson() =>
      {'feature_details': featureDetails?.toJson()};
}

class FeatureDetails {
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
  final dynamic remark;
  final bool? isDeleted;
  final List<Range>? range;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final String? feature;
  final int? lastAssingMailNo;

  FeatureDetails({
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
    this.lastAssingMailNo,
  });

  FeatureDetails.fromJson(Map<String, dynamic> json)
      : city = (json['city'] as Map<String, dynamic>?) != null
            ? City.fromJson(json['city'] as Map<String, dynamic>)
            : null,
        state = (json['state'] as Map<String, dynamic>?) != null
            ? State.fromJson(json['state'] as Map<String, dynamic>)
            : null,
        country = (json['country'] as Map<String, dynamic>?) != null
            ? Country.fromJson(json['country'] as Map<String, dynamic>)
            : null,
        id = json['_id'] as String?,
        businessName = json['business_name'] as String?,
        fName = json['f_name'] as String?,
        lName = json['l_name'] as String?,
        appartmentNo = json['appartment_no'] as String?,
        businessAddress = json['business_address'] as String?,
        locationAddress =
            (json['location_address'] as Map<String, dynamic>?) != null
                ? LocationAddress.fromJson(
                    json['location_address'] as Map<String, dynamic>)
                : null,
        userStatus = json['user_status'] as String?,
        userType = json['user_type'] as String?,
        zipCode = json['zip_code'] as String?,
        phone = json['phone'] as int?,
        email = json['email'] as String?,
        password = json['password'] as String?,
        storeId = json['store_id'] as int?,
        approveStatus = json['approve_status'] as String?,
        remark = json['remark'],
        isDeleted = json['isDeleted'] as bool?,
        range = (json['range'] as List?)
            ?.map((dynamic e) => Range.fromJson(e as Map<String, dynamic>))
            .toList(),
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        v = json['__v'] as int?,
        feature = json['feature'] as String?,
        lastAssingMailNo = json['last_assing_mail_no'] as int?;

  Map<String, dynamic> toJson() => {
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
        'range': range?.map((e) => e.toJson()).toList(),
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v,
        'feature': feature,
        'last_assing_mail_no': lastAssingMailNo
      };
}

class City {
  final int? cityId;
  final int? stateId;
  final String? name;

  City({
    this.cityId,
    this.stateId,
    this.name,
  });

  City.fromJson(Map<String, dynamic> json)
      : cityId = json['city_id'] as int?,
        stateId = json['state_id'] as int?,
        name = json['name'] as String?;

  Map<String, dynamic> toJson() =>
      {'city_id': cityId, 'state_id': stateId, 'name': name};
}

class State {
  final int? stateId;
  final int? countryId;
  final String? name;

  State({
    this.stateId,
    this.countryId,
    this.name,
  });

  State.fromJson(Map<String, dynamic> json)
      : stateId = json['state_id'] as int?,
        countryId = json['country_id'] as int?,
        name = json['name'] as String?;

  Map<String, dynamic> toJson() =>
      {'state_id': stateId, 'country_id': countryId, 'name': name};
}

class Country {
  final int? countryId;
  final String? name;

  Country({
    this.countryId,
    this.name,
  });

  Country.fromJson(Map<String, dynamic> json)
      : countryId = json['country_id'] as int?,
        name = json['name'] as String?;

  Map<String, dynamic> toJson() => {'country_id': countryId, 'name': name};
}

class LocationAddress {
  final List<AddressComponents>? addressComponents;
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
  final List<Photos>? photos;
  final String? placeId;
  final PlusCode? plusCode;
  final double? rating;
  final String? reference;
  final List<Reviews>? reviews;
  final List<String>? types;
  final String? url;
  final int? userRatingsTotal;
  final int? utcOffset;
  final String? vicinity;
  final String? website;
  final List<dynamic>? htmlAttributions;
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
    this.htmlAttributions,
    this.utcOffsetMinutes,
  });

  LocationAddress.fromJson(Map<String, dynamic> json)
      : addressComponents = (json['address_components'] as List?)
            ?.map((dynamic e) =>
                AddressComponents.fromJson(e as Map<String, dynamic>))
            .toList(),
        adrAddress = json['adr_address'] as String?,
        businessStatus = json['business_status'] as String?,
        formattedAddress = json['formatted_address'] as String?,
        formattedPhoneNumber = json['formatted_phone_number'] as String?,
        geometry = (json['geometry'] as Map<String, dynamic>?) != null
            ? Geometry.fromJson(json['geometry'] as Map<String, dynamic>)
            : null,
        icon = json['icon'] as String?,
        iconBackgroundColor = json['icon_background_color'] as String?,
        iconMaskBaseUri = json['icon_mask_base_uri'] as String?,
        internationalPhoneNumber =
            json['international_phone_number'] as String?,
        name = json['name'] as String?,
        photos = (json['photos'] as List?)
            ?.map((dynamic e) => Photos.fromJson(e as Map<String, dynamic>))
            .toList(),
        placeId = json['place_id'] as String?,
        plusCode = (json['plus_code'] as Map<String, dynamic>?) != null
            ? PlusCode.fromJson(json['plus_code'] as Map<String, dynamic>)
            : null,
        rating = json['rating'] as double?,
        reference = json['reference'] as String?,
        reviews = (json['reviews'] as List?)
            ?.map((dynamic e) => Reviews.fromJson(e as Map<String, dynamic>))
            .toList(),
        types =
            (json['types'] as List?)?.map((dynamic e) => e as String).toList(),
        url = json['url'] as String?,
        userRatingsTotal = json['user_ratings_total'] as int?,
        utcOffset = json['utc_offset'] as int?,
        vicinity = json['vicinity'] as String?,
        website = json['website'] as String?,
        htmlAttributions = json['html_attributions'] as List?,
        utcOffsetMinutes = json['utc_offset_minutes'] as int?;

  Map<String, dynamic> toJson() => {
        'address_components':
            addressComponents?.map((e) => e.toJson()).toList(),
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
        'html_attributions': htmlAttributions,
        'utc_offset_minutes': utcOffsetMinutes
      };
}

class AddressComponents {
  final String? longName;
  final String? shortName;
  final List<String>? types;

  AddressComponents({
    this.longName,
    this.shortName,
    this.types,
  });

  AddressComponents.fromJson(Map<String, dynamic> json)
      : longName = json['long_name'] as String?,
        shortName = json['short_name'] as String?,
        types =
            (json['types'] as List?)?.map((dynamic e) => e as String).toList();

  Map<String, dynamic> toJson() =>
      {'long_name': longName, 'short_name': shortName, 'types': types};
}

class Geometry1 {
  final Location? location;
  final Viewport? viewport;

  Geometry1({
    this.location,
    this.viewport,
  });

  Geometry1.fromJson(Map<String, dynamic> json)
      : location = (json['location'] as Map<String, dynamic>?) != null
            ? Location.fromJson(json['location'] as Map<String, dynamic>)
            : null,
        viewport = (json['viewport'] as Map<String, dynamic>?) != null
            ? Viewport.fromJson(json['viewport'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'location': location?.toJson(), 'viewport': viewport?.toJson()};
}

class Location {
  final double? lat;
  final double? lng;

  Location({
    this.lat,
    this.lng,
  });

  Location.fromJson(Map<String, dynamic> json)
      : lat = json['lat'] as double?,
        lng = json['lng'] as double?;

  Map<String, dynamic> toJson() => {'lat': lat, 'lng': lng};
}

class Viewport {
  final double? south;
  final double? west;
  final double? north;
  final double? east;

  Viewport({
    this.south,
    this.west,
    this.north,
    this.east,
  });

  Viewport.fromJson(Map<String, dynamic> json)
      : south = json['south'] as double?,
        west = json['west'] as double?,
        north = json['north'] as double?,
        east = json['east'] as double?;

  Map<String, dynamic> toJson() =>
      {'south': south, 'west': west, 'north': north, 'east': east};
}

class Photos {
  final int? height;
  final List<String>? htmlAttributions;
  final int? width;

  Photos({
    this.height,
    this.htmlAttributions,
    this.width,
  });

  Photos.fromJson(Map<String, dynamic> json)
      : height = json['height'] as int?,
        htmlAttributions = (json['html_attributions'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        width = json['width'] as int?;

  Map<String, dynamic> toJson() =>
      {'height': height, 'html_attributions': htmlAttributions, 'width': width};
}

class PlusCode {
  final String? compoundCode;
  final String? globalCode;

  PlusCode({
    this.compoundCode,
    this.globalCode,
  });

  PlusCode.fromJson(Map<String, dynamic> json)
      : compoundCode = json['compound_code'] as String?,
        globalCode = json['global_code'] as String?;

  Map<String, dynamic> toJson() =>
      {'compound_code': compoundCode, 'global_code': globalCode};
}

class Reviews {
  final String? authorName;
  final String? authorUrl;
  final String? language;
  final String? profilePhotoUrl;
  final int? rating;
  final String? relativeTimeDescription;
  final String? text;
  final int? time;

  Reviews({
    this.authorName,
    this.authorUrl,
    this.language,
    this.profilePhotoUrl,
    this.rating,
    this.relativeTimeDescription,
    this.text,
    this.time,
  });

  Reviews.fromJson(Map<String, dynamic> json)
      : authorName = json['author_name'] as String?,
        authorUrl = json['author_url'] as String?,
        language = json['language'] as String?,
        profilePhotoUrl = json['profile_photo_url'] as String?,
        rating = json['rating'] as int?,
        relativeTimeDescription = json['relative_time_description'] as String?,
        text = json['text'] as String?,
        time = json['time'] as int?;

  Map<String, dynamic> toJson() => {
        'author_name': authorName,
        'author_url': authorUrl,
        'language': language,
        'profile_photo_url': profilePhotoUrl,
        'rating': rating,
        'relative_time_description': relativeTimeDescription,
        'text': text,
        'time': time
      };
}

class Range {
  final int? from;
  final int? to;
  final String? status;
  final String? id;

  Range({
    this.from,
    this.to,
    this.status,
    this.id,
  });

  Range.fromJson(Map<String, dynamic> json)
      : from = json['from'] as int?,
        to = json['to'] as int?,
        status = json['status'] as String?,
        id = json['_id'] as String?;

  Map<String, dynamic> toJson() =>
      {'from': from, 'to': to, 'status': status, '_id': id};
}

class Subscription {
  final String? id;
  final String? userId;
  final String? planId;
  final PlanDetail? planDetail;
  final String? amount;
  final String? paymentMode;
  final String? description;
  final int? paymentStatus;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Subscription({
    this.id,
    this.userId,
    this.planId,
    this.planDetail,
    this.amount,
    this.paymentMode,
    this.description,
    this.paymentStatus,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Subscription.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        userId = json['user_id'] as String?,
        planId = json['plan_id'] as String?,
        planDetail = (json['plan_detail'] as Map<String, dynamic>?) != null
            ? PlanDetail.fromJson(json['plan_detail'] as Map<String, dynamic>)
            : null,
        amount = json['amount'] as String?,
        paymentMode = json['payment_mode'] as String?,
        description = json['description'] as String?,
        paymentStatus = json['payment_status'] as int?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'user_id': userId,
        'plan_id': planId,
        'plan_detail': planDetail?.toJson(),
        'amount': amount,
        'payment_mode': paymentMode,
        'description': description,
        'payment_status': paymentStatus,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v
      };
}

class PlanDetail {
  final String? name;

  PlanDetail({
    this.name,
  });

  PlanDetail.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?;

  Map<String, dynamic> toJson() => {'name': name};
}
