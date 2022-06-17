import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/favourite_service.dart';

class WeightPage extends StatefulWidget {
  const WeightPage({Key? key}) : super(key: key);

  @override
  State<WeightPage> createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  List<String> weightUnits = [
    "Grams",
    "Kilograms",
    "Metric tonnes",
    "Pounds",
    "Ounces"
  ];
  String? from;

  String? to;
  double? userInput;
  String? resultMessage;

  @override
  void initState() {
    userInput = 0;
    super.initState();
  }

  final Map<String, int> weightUnitMap = {
    "Grams": 0,
    "Kilograms": 1,
    "Metric tonnes": 2,
    "Pounds": 3,
    "Ounces": 4
  };

  dynamic formulas = {
    "0": [1, 0.001, 0.000001, 0.002205, 0.035273],
    "1": [1000, 1, 0.001, 2.204586, 35.27337],
    "2": [10000, 1000, 1, 2204.586, 35273.37],
    "3": [453.6, 0.4536, 0.000454, 1, 16],
    "4": [28, 0.02835, 0.00028, 0.0625, 1]
  };

  void convert(double value, String from, String to) {
    int? nFrom = weightUnitMap[from];
    int? nTo = weightUnitMap[to];
    var multi = formulas[nFrom.toString()][nTo];
    var result = value * multi;

    if (result == 0) {
      resultMessage = "Can't Perform the conversion";
    } else {
      resultMessage = "${result.toString()} $to";
    }

    setState(() {
      resultMessage = resultMessage;
    });
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
                SizedBox(
                  height: 80.0,
                  width: 400.0,
                  child: Center(
                    child: Text("Weight Converter",
                        style: GoogleFonts.comfortaa(
                          color: Colors.grey,
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                        )),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SizedBox(
                                child: Text(
                              "Value",
                              style: GoogleFonts.comfortaa(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                            )),
                          ),
                        ),
                        TextField(
                          onChanged: (text) {
                            var input = double.tryParse(text);
                            if (input != null) {
                              setState(() {
                                userInput = input;
                              });
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            hintText: "Enter a value to convert",
                            hintStyle: GoogleFonts.comfortaa(
                                color: Colors.grey, fontSize: 18),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    width: 0, style: BorderStyle.none)),
                            filled: true,
                            fillColor: const Color(0xFFEEEEEE),
                          ),
                          style: GoogleFonts.comfortaa(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SizedBox(
                                child: Text(
                              "From",
                              style: GoogleFonts.comfortaa(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900),
                            )),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFFEEEEEE),
                              borderRadius: BorderRadius.circular(10)),
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(
                                hint: Text(
                                  "Choose a Unit",
                                  style: GoogleFonts.comfortaa(
                                      color: Colors.grey, fontSize: 18),
                                ),
                                value: from,
                                isExpanded: true,
                                items: weightUnits.map((String value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value,
                                        style: GoogleFonts.comfortaa()),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    from = (value as String?)!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SizedBox(
                                child: Text(
                              "To",
                              style: GoogleFonts.comfortaa(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                            )),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFFEEEEEE),
                              borderRadius: BorderRadius.circular(10)),
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(
                                hint: Text(
                                  "Choose a Unit",
                                  style: GoogleFonts.comfortaa(
                                      color: Colors.grey, fontSize: 18),
                                ),
                                value: to,
                                isExpanded: true,
                                items: weightUnits.map((String value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value,
                                        style: GoogleFonts.comfortaa()),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    to = (value as String?)!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(height: 30.0),
                      Row(
                        children: <Widget>[
                          const SizedBox(width: 45),
                          /// Convert Button
                      RawMaterialButton(
                          onPressed: () {
                            if (from == null ||
                                to == null ||
                                userInput == 0) {
                              return;
                            } else {
                              convert(userInput!, from!, to!);
                              showDialog(
                                  context: context,
                                  builder: (context) =>
                                      AlertDialog(
                                        content: Text("$resultMessage"),
                                        actions: [TextButton(child: const Text("Done"), onPressed: () => Navigator.pop(context),)],
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        contentTextStyle: GoogleFonts.comfortaa(
                                          color: Colors.grey,
                                          fontSize: 32,
                                        ),
                                      )
                              );
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            alignment: AlignmentDirectional.center,
                            width: 200,
                            height: 70,
                            child: Text(
                              "Convert",
                              style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 32,
                                  color: Colors.white),
                            ),
                          )),
                          RawMaterialButton(
                            onPressed: () async {
                              if (from != null   &&  to != null ){
                                await DataBaseHelper.instance.add(
                                    FavouriteData(fromUnit: from.toString(), toUnit: to.toString(),conversionRate: formulas[weightUnitMap[from].toString()][weightUnitMap[to]])
                                );
                              }else{
                                print("Can't Add");
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFFFE082),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              alignment: AlignmentDirectional.center,
                              width: 80,
                              height: 70,
                              child: const Icon(
                                  Icons.star,
                                  color: Colors.white, size: 30),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
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
