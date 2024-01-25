import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController animate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animate = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(min: 0.6, max: 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://i.pinimg.com/564x/84/19/ac/8419ac558c0ee478f6e539a17b7fc51c.jpg'),
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(42, 580),
            child: RichText(
              text: TextSpan(
                text: 'EXPLORE',
                style: GoogleFonts.montserrat(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
                children: [
                  TextSpan(
                    text: '\nSOLAR\n',
                    style: GoogleFonts.montserrat(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: 'SYSTEM',
                    style: GoogleFonts.montserrat(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0, 0),
            child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: const Icon(CupertinoIcons.forward),
            ),
          ),
          Transform.translate(
            offset: const Offset(43, 780),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
              child: AnimatedBuilder(
                animation: animate,
                builder: (BuildContext context, Widget? child) =>
                    Transform.scale(scale: animate.value, child: child),
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
