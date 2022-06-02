import 'package:flutter/material.dart';

class LengthPage extends StatefulWidget {
  const LengthPage({Key? key}) : super(key: key);

  @override
  State<LengthPage> createState() => _LengthPageState();
}

class _LengthPageState extends State<LengthPage> {
  List<String> lengthUnits = ["Millimeter","Centimeter","Meter","Kilometer", "inch", "foot", "yard", "mile"];
  String? from;

  String? to;
  double? userInput;
  String? resultMessage;

  @override
  void initState() {
    userInput = 0;
    super.initState();
  }

  final Map<String, int> lengthUnitMap = {
    "Millimeter": 0,
    "Centimeter": 1,
    "Meter": 2,
    "Kilometer":3,
    "inch": 4,
    "foot": 5,
    "yard": 6,
    "mile": 7,
  };

  dynamic formulas = {
    "0": [1, 0.1,0.001,0.000001,0.03937,0.003281,0.0010936,0.0000006214],
    "1": [10, 1,0.01,0.00001,0.3937,0.03281,0.010936,0.000006214],
    "2": [1000,100,1,0.001,39.37,3.281,1.0936,0.0006214],
    "3": [1000000,100000,1000,1,39370,3281,1093.6,0.6214],
    "4": [25.4,2.54,0.0254,0.0000254,1,0.08333,0.02778,0.000015783],
    "5": [304.8,30.48,0.3048,0.0003048,12,1,0.33333,0.0001894],
    "6": [914.4,91.44,0.9144,0.0009144,36,3,1,0.0005682],
    "7": [1609344,160934,1609.3,1.6093,63360,5280,1760,1]
  };

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
                const SizedBox(
                  height: 80.0,
                  width: 400.0,
                  child: Center(
                    child: Text("Length Converter",
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
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SizedBox(
                                child: Text("Value", style: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold,),)
                            ),
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

                          decoration:  InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            hintText: "Enter a value to convert",
                            hintStyle:
                                const TextStyle(color: Colors.grey, fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none
                              )
                            ),
                            filled: true,
                            fillColor: const Color(0xFFEEEEEE),
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SizedBox(
                                child: Text("From", style: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),)
                            ),
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
                                hint: const Text(
                                  "Choose a Unit",
                                  style:
                                      TextStyle(color: Colors.grey, fontSize: 18),
                                ),
                                value: from,
                                isExpanded: true,
                                items: lengthUnits.map((String value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value),

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
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SizedBox(
                              child: Text("To", style: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold,),)
                            ),
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
                                hint: const Text(
                                  "Choose a Unit",
                                  style:
                                      TextStyle(color: Colors.grey, fontSize: 18),
                                ),
                                value: to,
                                isExpanded: true,
                                items: lengthUnits.map((String value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
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
                        const SizedBox(
                          height: 18.0
                        ),
                        RawMaterialButton(
                            onPressed: () {
                              if (from == null ||
                                  to == null ||
                                  userInput == 0) {
                                return;
                              } else {
                                convert(userInput!, from!, to!);
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
                              child: const Text(
                                "Convert",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Colors.white),
                              ),
                            )),
                        const SizedBox(
                          height: 18.0,
                        ),
                        Text(
                          (resultMessage.toString() == "null")
                              ? ""
                              : resultMessage.toString(),
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
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
