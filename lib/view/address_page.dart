import 'package:flutter/material.dart';
import 'package:flutter_api_app/repository/address_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressPage extends ConsumerWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final address = ref.watch(addressRepositoryProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address Page'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              if (value.length == 7)
                ref
                    .read(addressRepositoryProvider.notifier)
                    .fetchAddressFromPostalCode(value);
            },
          ),
          switch (address) {
            AsyncData(:final value) => Text('Value: $value'),
            AsyncError(:final error) => Text('Error: $error'),
            _ => const CircularProgressIndicator(),
          },
        ],
      ),
    );
  }
}
