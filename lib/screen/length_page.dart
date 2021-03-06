import 'package:converter_app/services/favourite_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Length conversion page
class LengthPage extends StatefulWidget {
  const LengthPage({Key? key}) : super(key: key);

  @override
  State<LengthPage> createState() => _LengthPageState();
}

class _LengthPageState extends State<LengthPage> {
  /// List of units for length category
  List<String> lengthUnits = [
    "Millimeter",
    "Centimeter",
    "Meter",
    "Kilometer",
    "Inch",
    "Foot",
    "Yard",
    "Mile"
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
  final Map<String, int> lengthUnitMap = {
    "Millimeter": 0,
    "Centimeter": 1,
    "Meter": 2,
    "Kilometer": 3,
    "Inch": 4,
    "Foot": 5,
    "Yard": 6,
    "Mile": 7,
  };
  /// Map to look up the conversion rate for each unit
  dynamic formulas = {
    "0": [1.0, 0.1, 0.001, 0.000001, 0.03937, 0.003281, 0.0010936, 0.0000006214],
    "1": [10.0, 1.0, 0.01, 0.00001, 0.3937, 0.03281, 0.010936, 0.000006214],
    "2": [1000.0, 100.0, 1.0, 0.001, 39.37, 3.281, 1.0936, 0.0006214],
    "3": [1000000.0, 100000.0, 1000.0, 1.0, 39370.0, 3281.0, 1093.6, 0.6214],
    "4": [25.4, 2.54, 0.0254, 0.0000254, 1.0, 0.08333, 0.02778, 0.000015783],
    "5": [304.8, 30.48, 0.3048, 0.0003048, 12.0, 1.0, 0.33333, 0.0001894],
    "6": [914.4, 91.44, 0.9144, 0.0009144, 36.0, 3.0, 1.0, 0.0005682],
    "7": [1609344.0, 160934.0, 1609.3, 1.6093, 63360.0, 5280.0, 1760.0, 1.0]
  };

  /// Convert function to perform the conversion
  void convert(double value, String from, String to) {
    int? nFrom = lengthUnitMap[from];
    int? nTo = lengthUnitMap[to];
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
                    child: Text("Length Converter",
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
                                child: Text("Value",
                                    style: GoogleFonts.comfortaa(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900))),
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
                                items: lengthUnits.map((String value) {
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
                                items: lengthUnits.map((String value) {
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
                                    //FavouriteTask(data: FavouriteData(from: from, fromValue: 10,to: to, toValue: 10 ));
                                    await DataBaseHelper.instance.add(
                                        FavouriteData(fromUnit: from.toString(), toUnit: to.toString(),conversionRate: formulas[lengthUnitMap[from].toString()][lengthUnitMap[to]])
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
                        const SizedBox(height: 50.0)
                        ,
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
