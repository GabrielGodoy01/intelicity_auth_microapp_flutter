import 'package:flutter/material.dart';
import 'package:intelicity_auth_microapp_flutter/shared/themes/app_colors.dart';

class LandingPage extends StatelessWidget {
  final Widget child;
  const LandingPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.1, 0.9],
            colors: [AppColors.primaryPurple, AppColors.secundaryPurple],
          ),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 20,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/intelicity_logo.png',
                        height: 200,
                      ),
                      child
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
