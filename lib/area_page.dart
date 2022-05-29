import 'package:flutter/material.dart';

class AreaPage extends StatefulWidget {
  const AreaPage({Key? key}) : super(key: key);

  @override
  State<AreaPage> createState() => _AreaPageState();
}

class _AreaPageState extends State<AreaPage> {
  List<String> areaUnits = ["Test1", "Test2"];
  String? from;
  String? to;
  double? userInput;

  @override
  void initState(){
    userInput = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80.0,
                  width: 400.0,
                  child: Center(
                    child: Text("Area Converter",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFFEEEEEE),
                          ),
                          child: const TextField(
                              decoration: InputDecoration(
                                filled: true,
                                hintText: "Input Value to convert",
                                hintStyle: TextStyle(color : Colors.grey, fontSize: 18),
                              ),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                              keyboardType: TextInputType.number,
                             
                          ),
                        ),
                        const SizedBox(
                          height: 18.0,
                        ),

                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFFEEEEEE)
                          ),
                          child: DropdownButton(
                            hint: const Text(
                              "Choose a Unit",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                            value: from,
                            isExpanded: true,
                            items: areaUnits.map((String value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                from = value as String?;
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 18.0,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFFEEEEEE),
                          ),
                          child: DropdownButton(
                            hint: const Text(
                              "Choose a Unit",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                            value: to,
                            isExpanded: true,
                            items: areaUnits.map((String value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                to = value as String?;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
