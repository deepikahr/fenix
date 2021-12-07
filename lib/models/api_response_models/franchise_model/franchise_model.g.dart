// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'franchise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FranchiseModel _$_$_FranchiseModelFromJson(Map<String, dynamic> json) {
  return _$_FranchiseModel(
    id: json['_id'] as String?,
    nif: json['nif'] as String?,
    restaurantName: json['restaurantName'] as String?,
    contactNumber: json['contactNumber'] as String?,
    franchiseName: json['franchiseName'] as String?,
    franchiseAddress: json['franchiseAddress'] == null
        ? null
        : FranchiseAddress.fromJson(
            json['franchiseAddress'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_FranchiseModelToJson(_$_FranchiseModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'nif': instance.nif,
      'restaurantName': instance.restaurantName,
      'contactNumber': instance.contactNumber,
      'franchiseName': instance.franchiseName,
      'franchiseAddress': instance.franchiseAddress,
    };

_$_FranchiseAddress _$_$_FranchiseAddressFromJson(Map<String, dynamic> json) {
  return _$_FranchiseAddress(
    city: json['city'] as String?,
    country: json['country'] as String?,
    state: json['state'] as String?,
    address: json['address'] as String?,
    postalCode: json['postalCode'] as String?,
  );
}

Map<String, dynamic> _$_$_FranchiseAddressToJson(
        _$_FranchiseAddress instance) =>
    <String, dynamic>{
      'city': instance.city,
      'country': instance.country,
      'state': instance.state,
      'address': instance.address,
      'postalCode': instance.postalCode,
    };
