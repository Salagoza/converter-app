
import 'dart:ffi';

import 'package:converter_app/category_button_action.dart';
import 'package:converter_app/test_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Homepage());
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  // Method to create a category of unit
  Widget createCategoryButton(Color c,String buttonLabel,context,StatelessWidget widget) {
    return Expanded(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 200,
          child: TextButton(
            child: Text(buttonLabel),
            style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: c,
                textStyle:
                const TextStyle(fontSize: 24,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold)
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TestPage()));
            },
          ),
        )
    );
  }


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
              Container(
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => TestPage()));
                      }
                    )),
                      CategoryButton(action: CategoryAction(
                          color: Colors.white,
                          label: "Length",
                          labelColor: Colors.black,
                          iconData: Icons.abc,
                          iconColor: Colors.green,
                          callback: (context) {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => TestPage()));
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => TestPage()));
                      }
                  )),
                    CategoryButton(action: CategoryAction(
                        color: Colors.white,
                        label: "Volume",
                        labelColor: Colors.black,
                        iconData: Icons.abc,
                        iconColor: Colors.green,
                        callback: (context) {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => TestPage()));
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => TestPage()));
                      }
                  )),
                    CategoryButton(action: CategoryAction(
                        color: Colors.white,
                        label: "Speed",
                        labelColor: Colors.black,
                        iconData: Icons.abc,
                        iconColor: Colors.green,
                        callback: (context) {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => TestPage()));
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

