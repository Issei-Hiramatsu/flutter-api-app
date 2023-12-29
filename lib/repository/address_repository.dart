import 'package:flutter_api_app/dto/address_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'address_repository.g.dart';

@riverpod
class AddressRepository extends _$AddressRepository {
  @override
  FutureOr<void> build() {}

  Future<void> fetchAddressFromPostalCode(String postalCode) async {
    final authRepository =
        ref.read(addressDtoProvider).fetchAddressFromPostalCode(postalCode);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authRepository);
  }
}
