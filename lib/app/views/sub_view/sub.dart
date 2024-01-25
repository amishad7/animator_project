import 'dart:math';
import 'package:animator/app/views/home_view/model/apimodel.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SubView extends StatefulWidget {
  const SubView({super.key});

  @override
  State<SubView> createState() => _SubViewState();
}

class _SubViewState extends State<SubView> with TickerProviderStateMixin {
  Random random = Random();
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Planets? planets = ModalRoute.of(context)!.settings.arguments as Planets;

    return Scaffold(
      body: Stack(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),

          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.primaries[random.nextInt(16)].withOpacity(0.4),
              image: const DecorationImage(
                fit: BoxFit.cover,
                opacity: 0.8,
                image: NetworkImage(
                    'https://i.pinimg.com/564x/03/53/76/0353763620ac7347b49183d70c915a02.jpg'),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 90),
                AnimatedBuilder(
                  builder: (BuildContext context, Widget? child) {
                    return Transform.rotate(
                      angle: animationController.value * 2 * pi,
                      child: SizedBox(
                        height: 300,
                        width: 300,
                        child: Image.network("${planets.image}"),
                      ),
                    );
                  },
                  animation: animationController,
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(28.0),
          //   child: Text(
          //     "${planets.des}",
          //     style: GoogleFonts.montserrat(
          //       color: Colors.white,
          //       fontSize: 18,
          //       fontWeight: FontWeight.w800,
          //     ),
          //   ),
          // ),
          Transform.translate(
            offset: const Offset(0, 450),
            child: Container(
              height: 470,
              width: double.infinity,
              padding: EdgeInsets.only(top: 53, bottom: 93),
              decoration: const BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: Text(
                        "${planets.des}",
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
