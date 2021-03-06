import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/favourite_service.dart';

/// Speed conversion page
class SpeedPage extends StatefulWidget {
  const SpeedPage({Key? key}) : super(key: key);

  @override
  State<SpeedPage> createState() => _SpeedPageState();
}

class _SpeedPageState extends State<SpeedPage> {
  /// List of units for speed category
  List<String> speedUnits = [
    "Meter/second",
    "Meter/minute",
    "Kilometer/hour",
    "Foot/second",
    "Foot/minute",
    "Miles/hour"
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
  /// Map to map the unit
  final Map<String, int> speedUnitMap = {
    "Meter/second": 0,
    "Meter/minute": 1,
    "Kilometer/hour": 2,
    "Foot/second": 3,
    "Foot/minute": 4,
    "Miles/hour": 5
  };
  /// Map to look up the conversion rate for each unit
  dynamic formulas = {
    "0": [1, 59.988, 3.599712, 3.28084, 196.8504, 2.237136],
    "1": [0.01667, 1, 0.06007, 0.054692, 3.281496, 0.037293],
    "2": [0.2778, 16.66467, 1, 0.911417, 54.68504, 0.621477],
    "3": [0.3048, 18.28434, 1.097192, 1, 60, 0.681879],
    "4": [0.00508, 0.304739, 0.018287, 0.016667, 1, 0.011365],
    "5": [0.447, 26.81464, 1.609071, 1.466535, 87.99213, 1],
  };
  /// Convert function to perform the conversion
  void convert(double value, String from, String to) {
    int? nFrom = speedUnitMap[from];
    int? nTo = speedUnitMap[to];
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
                /// Title
                SizedBox(
                  height: 80.0,
                  width: 400.0,
                  child: Center(
                    child: Text("Speed Converter",
                        style: GoogleFonts.comfortaa(
                          color: Colors.grey,
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                        )),
                  ),
                ),
                /// User's input field
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
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        /// From unit dropdown list
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
                                items: speedUnits.map((String value) {
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
                        /// From unit dropdown list
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
                                items: speedUnits.map((String value) {
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
                        /// Convert button & AlertDialog to Display Result
                        children: <Widget>[
                          const SizedBox(width: 45),
                      RawMaterialButton(
                          onPressed: () {
                            if (from == null ||
                                to == null ||
                                userInput == 0) {
                              showDialog(
                                  context: context,
                                  builder: (context) =>
                                      AlertDialog(
                                        content: const Text("Fill up all the fields to convert"),
                                        actions: [TextButton(child: const Text("Done"), onPressed: () => Navigator.pop(context),)],
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        contentTextStyle: GoogleFonts.comfortaa(
                                          color: Colors.redAccent,
                                          fontSize: 25,
                                        ),
                                      )
                              );
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
                          /// Add to favourite button to save user's favourite conversation
                          RawMaterialButton(
                            onPressed: () async {
                              if (from != null   &&  to != null ){
                                await DataBaseHelper.instance.add(
                                    FavouriteData(fromUnit: from.toString(), toUnit: to.toString(),conversionRate: formulas[speedUnitMap[from].toString()][speedUnitMap[to]])
                                );
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
