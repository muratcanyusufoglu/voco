import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voco/product/screens/auth/provider/login_provider.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginProvider = ref.watch(LoginProvider.loginProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loginProvider.getTokenToPreferences();
      loginProvider.isSplashFinished
          ? loginProvider.userAlreadyLogin
              ? context.go('/home')
              : context.go('/login')
          : null;
    });
    return Container();
  }
}
