import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voco/feature/cards/customResourcesCard.dart';
import 'package:voco/product/screens/home/provider/home_provider.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeProvider = ref.watch(HomeProvider.homeProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeProvider.fetchData ? homeProvider.getResources(homeProvider.currentPage) : null;
    });
    return homeProvider.loading ? const Center(child: CircularProgressIndicator()) : _homeBody(homeProvider);
  }

  Scaffold _homeBody(HomeProvider homeProvider) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex:1,
            child: NotificationListener<ScrollNotification>(
            onNotification: homeProvider.notificationController,
            child: ListView.builder(
              itemCount: homeProvider.resourcesList.length,
              itemBuilder: (context, index) {
                if (index == homeProvider.resourcesList.length) return null;
                if (index == homeProvider.resourcesList.length && homeProvider.isLastPage) return null;

                final model = homeProvider.resourcesList[index];
                return CustomResourcesCard(data: model);
              },
            ),
            ),
          ),
        ],
      ),
    );
  }
}
