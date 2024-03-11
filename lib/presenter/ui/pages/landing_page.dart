import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/shared/themes/app_colors.dart';

class LandingPage extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  final bool isBackButtonVisible;
  const LandingPage(
      {super.key,
      required this.child,
      this.maxWidth = 600,
      this.isBackButtonVisible = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffc04848), Color(0xff232F49)],
            stops: [0.3, 1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                surfaceTintColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 20,
                color: Colors.white,
                child: Stack(
                  children: [
                    isBackButtonVisible
                        ? IconButton(
                            onPressed: () {
                              Modular.to.pop();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: AppColors.black,
                              size: 32,
                            ),
                          )
                        : const SizedBox(),
                    Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://intelicity-assets.s3.sa-east-1.amazonaws.com/intelicity_logo.png',
                            height: 200,
                          ),
                          child
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
