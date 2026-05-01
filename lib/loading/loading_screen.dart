import 'package:basic/loading/service_provider.dart';
import 'package:basic/style/palette.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// draw loading screen that waits on service provider to finish initializing all managers
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var palette = context.watch<Palette>();
    
    var serviceProvider = context.watch<ServiceProvider>();
    Future serviceProviderInitListener = serviceProvider.initializeProvidersAsync(context);
    var goRouter = GoRouter.of(context);
    serviceProviderInitListener.then((_) {
      goRouter.go('/');
    });

    return Scaffold(
      backgroundColor: palette.backgroundMain,
      body: Center(
        child: 
          const Text(
            'Loading...',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Permanent Marker',
              fontSize: 55,
              height: 1,
            ),
          ),
      ),
    );
  }
}