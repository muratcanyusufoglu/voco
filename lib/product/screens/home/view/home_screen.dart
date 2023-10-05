import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voco/product/screens/home/provider/home_provider.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeProvider = ref.watch(HomeProvider.homeProvider);
    homeProvider.fetchData ? homeProvider.getResources() : null;
    return Text('Homeeeee');
  }
}
