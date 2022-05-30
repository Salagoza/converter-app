import 'package:converter_app/screen/test_page.dart';
import 'package:flutter/material.dart';
import 'area_page.dart';
import '../components/category_button_action.dart';

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
                const SizedBox(
                  height: 80.0,
                  width: 400.0,
                  child: Center(
                    child: Text("Unit Converter",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
                Row(
                  children: [
                    CategoryButton(
                        action: CategoryAction(
                            color: Color(0xFFEEEEEE),
                            label: "Area",
                            labelColor: Colors.black,
                            iconData: Icons.crop_landscape_outlined,
                            iconColor: Colors.green,
                            callback: (context) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const AreaPage()));
                            })),
                    CategoryButton(
                        action: CategoryAction(
                            color: Color(0xFFEEEEEE),
                            label: "Length",
                            labelColor: Colors.black,
                            iconData: Icons.straighten,
                            iconColor: Colors.green,
                            callback: (context) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const TestPage()));
                            }))
                  ],
                ),
                Row(
                  children: [
                    CategoryButton(
                        action: CategoryAction(
                            color: Color(0xFFEEEEEE),
                            label: "Temperature",
                            labelColor: Colors.black,
                            iconData: Icons.thermostat,
                            iconColor: Colors.green,
                            callback: (context) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const TestPage()));
                            })),
                    CategoryButton(
                        action: CategoryAction(
                            color: Color(0xFFEEEEEE),
                            label: "Volume",
                            labelColor: Colors.black,
                            iconData: Icons.science_outlined,
                            iconColor: Colors.green,
                            callback: (context) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const TestPage()));
                            }))
                  ],
                ),
                Row(
                  children: [
                    CategoryButton(
                        action: CategoryAction(
                            color: Color(0xFFEEEEEE),
                            label: "Weight",
                            labelColor: Colors.black,
                            iconData: Icons.fitness_center_rounded,
                            iconColor: Colors.green,
                            callback: (context) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const TestPage()));
                            })),
                    CategoryButton(
                        action: CategoryAction(
                            color: Color(0xFFEEEEEE),
                            label: "Speed",
                            labelColor: Colors.black,
                            iconData: Icons.speed,
                            iconColor: Colors.green,
                            callback: (context) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const TestPage()));
                            }))
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
