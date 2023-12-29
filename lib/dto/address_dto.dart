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

  Future<Address> fetchAddressFromPostalCode(String postalCode) async {
    final url = 'https://zipcloud.ibsnet.co.jp/api/search';
    final response =
        await ref.read(dioProvider).get('$url?zipcode=$postalCode');
    return Address.fromJson(response.data);
  }
}
