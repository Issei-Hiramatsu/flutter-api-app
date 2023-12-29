// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      prefecture: json['prefecture'] as String? ?? '',
      municipalities: json['municipalities'] as String? ?? '',
      townStreet: json['townStreet'] as String? ?? '',
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'prefecture': instance.prefecture,
      'municipalities': instance.municipalities,
      'townStreet': instance.townStreet,
    };
