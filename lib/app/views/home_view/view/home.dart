import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../model/apimodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: rootBundle.loadString('galaxy-data.json'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = jsonDecode(snapshot.data!);

            log('${data['planets']}');

            List Planetsdata = data['planets'];

            List<Planets> planets =
                Planetsdata.map((e) => Planets.fromData(data: e)).toList();

            return Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://i.pinimg.com/564x/17/b5/37/17b53752c09667eb5f7116e3f9fa4a8c.jpg'),
                    ),
                  ),
                ),
                // Transform.translate(
                //   offset: const Offset(234, 23),
                //   child: Text(
                //     'Welcome ',
                //     style: GoogleFonts.montserrat(
                //         fontSize: 23, color: Colors.white),
                //   ),
                // ),
                Align(
                  alignment: Alignment.center,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      // height: 600,
                      aspectRatio: 0.5,
                      autoPlay: true,
                      scrollDirection: Axis.vertical,
                      enableInfiniteScroll: true,
                      animateToClosest: true,
                      enlargeCenterPage: true,
                      scrollPhysics: const BouncingScrollPhysics(),
                      pauseAutoPlayOnTouch: true,
                    ),
                    items: planets.map(
                      (e) {
                        log('${e.des}');
                        log('${e.image}');

                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            //color: Colors.white24,
                            borderRadius: BorderRadius.circular(23),
                          ),
                          child: Stack(
                            children: [
                              Transform.translate(
                                offset: const Offset(0, 183),
                                child: Container(
                                  height: 400,
                                  alignment: Alignment.bottomCenter,
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 30, bottom: 80),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(23),
                                  ),
                                  child: Text("${e.des2}",
                                      style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/sub',
                                      arguments: e);
                                },
                                child: Transform.translate(
                                  offset: const Offset(10, -80),
                                  child: SizedBox(
                                    height: 370,
                                    width: 340,
                                    child: Hero(
                                        tag: 'img',
                                        flightShuttleBuilder:
                                            (ctx, _, __, ___, ____) {
                                          return Image.network("${e.image}");
                                        },
                                        child: Image.network("${e.image}")),
                                  ),
                                ),
                              ),
                              Transform.translate(
                                offset: const Offset(230, -90),
                                child: Text(
                                  "${e.name}",
                                  style: GoogleFonts.kanit(
                                      color: Colors.white, fontSize: 40),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
