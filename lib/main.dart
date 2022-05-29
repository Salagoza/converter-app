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
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const SizedBox(
                width: 200.0,
                child: Text(
                    "Unit Converter",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ),
                Row(
                    children: [CategoryButton(action: CategoryAction(
                      color: Colors.white,
                      label: "Area",
                      labelColor: Colors.black,
                      iconData: Icons.abc,
                      iconColor: Colors.green,
                      callback: (context) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestPage()));
                      }
                    )),
                      CategoryButton(action: CategoryAction(
                          color: Colors.white,
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
                      color: Colors.white,
                      label: "Temperature",
                      labelColor: Colors.black,
                      iconData: Icons.abc,
                      iconColor: Colors.green,
                      callback: (context) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestPage()));
                      }
                  )),
                    CategoryButton(action: CategoryAction(
                        color: Colors.white,
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
                      color: Colors.white,
                      label: "Weight",
                      labelColor: Colors.black,
                      iconData: Icons.abc,
                      iconColor: Colors.green,
                      callback: (context) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestPage()));
                      }
                  )),
                    CategoryButton(action: CategoryAction(
                        color: Colors.white,
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

