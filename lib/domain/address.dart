import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address {
  const factory Address({
    @Default('') String prefecture, //都道府県
    @Default('') String municipalities, //市区町村
    @Default('') String townStreet, //町名・番地
  }) = _Address;

  factory Address.fromJson(Map<String, Object?> json) =>
      _$AddressFromJson(json);
}

//抽象クラス

abstract class IAddressDto {
  Future<Address?> fetchAddressFromPostalCode(String postalCode);
}
