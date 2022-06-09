import 'package:converter_app/screen/favourite_page.dart';
import 'package:converter_app/screen/speed_page.dart';
import 'package:converter_app/screen/temperature_page.dart';
import 'package:converter_app/screen/volume_page.dart';
import 'package:converter_app/screen/weight_page.dart';
import 'package:flutter/material.dart';
import 'area_page.dart';
import '../components/category_button_action.dart';
import 'length_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 80.0,
                      width: 220.0,
                      child: Center(
                        child: Text("Unit Converter",
                            style: GoogleFonts.comfortaa(
                              color: Colors.grey,
                              fontSize: 32,
                              fontWeight: FontWeight.w900,
                            )),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const FavouritePage()));
                        print("pressed");
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      child: Container(),
                    )
                  ],
                ),
                Row(
                  children: [
                    CategoryButton(
                        action: CategoryAction(
                            color: Color(0xFFEEEEEE),
                            label: "Area",
                            labelColor: Color(0xFF616161),
                            iconData: Icons.crop_landscape_outlined,
                            iconColor: Colors.grey,
                            callback: (context) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const AreaPage()));
                            })),
                    CategoryButton(
                        action: CategoryAction(
                            color: Color(0xFFEEEEEE),
                            label: "Length",
                            labelColor: Color(0xFF616161),
                            iconData: Icons.straighten,
                            iconColor: Colors.grey,
                            callback: (context) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const LengthPage()));
                            }))
                  ],
                ),
                Row(
                  children: [
                    CategoryButton(
                        action: CategoryAction(
                            color: Color(0xFFEEEEEE),
                            label: "Temperature",
                            labelColor: Color(0xFF616161),
                            iconData: Icons.thermostat,
                            iconColor: Colors.grey,
                            callback: (context) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const TemperaturePage()));
                            })),
                    CategoryButton(
                        action: CategoryAction(
                            color: Color(0xFFEEEEEE),
                            label: "Volume",
                            labelColor: Color(0xFF616161),
                            iconData: Icons.science_outlined,
                            iconColor: Colors.grey,
                            callback: (context) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const VolumePage()));
                            }))
                  ],
                ),
                Row(
                  children: [
                    CategoryButton(
                        action: CategoryAction(
                            color: Color(0xFFEEEEEE),
                            label: "Weight",
                            labelColor: Color(0xFF616161),
                            iconData: Icons.fitness_center_rounded,
                            iconColor: Colors.grey,
                            callback: (context) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const WeightPage()));
                            })),
                    CategoryButton(
                        action: CategoryAction(
                            color: Color(0xFFEEEEEE),
                            label: "Speed",
                            labelColor: Color(0xFF616161),
                            iconData: Icons.speed,
                            iconColor: Colors.grey,
                            callback: (context) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const SpeedPage()));
                            }))
                  ],
                )
              ]),
        ),
      ),
    );
  }
}

// add inverting , add dark theme, add ajarn recommended function
