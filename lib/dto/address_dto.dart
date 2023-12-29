import 'dart:convert';

import 'package:flutter_api_app/domain/address.dart';
import 'package:flutter_api_app/provider/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'address_dto.g.dart';

@Riverpod(keepAlive: true)
AddressDto addressDto(AddressDtoRef ref) {
  return AddressDto(ref);
}

// APIとやりとりをするDtoクラス
class AddressDto extends IAddressDto {
  AddressDto(this.ref);
  Ref ref;

  Future<Address?> fetchAddressFromPostalCode(String postalCode) async {
    final url = 'https://zipcloud.ibsnet.co.jp/api/search';
    final response =
        await ref.read(dioProvider).get('$url?zipcode=$postalCode');
    final result = jsonDecode(response.data);
    if (result['results'] == null) {
      return null;
    }
    final addressMap = (result['results'] as List).first;
    final address = Address(
      prefecture: addressMap['address1'],
      municipalities: addressMap['address2'],
      townStreet: addressMap['address3'],
    );
    return address;
  }
}
