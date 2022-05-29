import 'package:converter_app/category_button_action.dart';
import 'package:converter_app/test_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Homepage());
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const SizedBox(
                width: 400.0,
                height: 80.0,
                child: Center(
                  child: Text(
                      "Unit Converter",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                ),
              ),
                Row(
                    children: [CategoryButton(action: CategoryAction(
                      color: Color(0xFFEEEEEE),
                      label: "Area",
                      labelColor: Colors.black,
                      iconData: Icons.abc,
                      iconColor: Colors.green,
                      callback: (context) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestPage()));
                      }
                    )),
                      CategoryButton(action: CategoryAction(
                          color: Color(0xFFEEEEEE),
                          label: "Length",
                          labelColor: Colors.black,
                          iconData: Icons.abc,
                          iconColor: Colors.green,
                          callback: (context) {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestPage()));
                          }
                      ))
                    ],
          ),
                Row(
                  children: [CategoryButton(action: CategoryAction(
                      color: Color(0xFFEEEEEE),
                      label: "Temperature",
                      labelColor: Colors.black,
                      iconData: Icons.abc,
                      iconColor: Colors.green,
                      callback: (context) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestPage()));
                      }
                  )),
                    CategoryButton(action: CategoryAction(
                        color: Color(0xFFEEEEEE),
                        label: "Volume",
                        labelColor: Colors.black,
                        iconData: Icons.abc,
                        iconColor: Colors.green,
                        callback: (context) {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestPage()));
                        }
                    ))
                  ],
                ),
                Row(
                  children: [CategoryButton(action: CategoryAction(
                      color: Color(0xFFEEEEEE),
                      label: "Weight",
                      labelColor: Colors.black,
                      iconData: Icons.abc,
                      iconColor: Colors.green,
                      callback: (context) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestPage()));
                      }
                  )),
                    CategoryButton(action: CategoryAction(
                        color: Color(0xFFEEEEEE),
                        label: "Speed",
                        labelColor: Colors.black,
                        iconData: Icons.abc,
                        iconColor: Colors.green,
                        callback: (context) {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestPage()));
                        }
                    ))
                  ],
                )

            ]
          ),
        ),
      ),
    ));
  }

}

