import 'package:flutter_api_app/domain/entity/address.dart';
import 'package:flutter_api_app/provider/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'address_repository.g.dart';

@Riverpod(keepAlive: true)
AddressRepository addressRepository(AddressRepositoryRef ref) {
  return AddressRepository(ref);
}

// APIとやりとりをするRepositoryクラス
class AddressRepository extends IAddressRepository {
  AddressRepository(this.ref);
  Ref ref;

  Future<Address> fetchAddressFromPostalCode(String postalCode) async {
    final url = 'https://zipcloud.ibsnet.co.jp/api/search';
    final response =
        await ref.read(dioProvider).get('$url?zipcode=$postalCode');
    return Address.fromJson(response.data);
  }
}
