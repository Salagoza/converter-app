import 'package:flutter/material.dart';

class VolumePage extends StatefulWidget {
  const VolumePage({Key? key}) : super(key: key);

  @override
  State<VolumePage> createState() => _VolumePageState();
}

class _VolumePageState extends State<VolumePage> {
  List<String> areaUnits = ["Milliliter","liter","cubic meter","cubic inch","cubic feet", "pint", "quart", "gallon", "barrel"];
  String? from;

  String? to;
  double? userInput;
  String? resultMessage;

  @override
  void initState() {
    userInput = 0;
    super.initState();
  }

  final Map<String, int> volumeUnitMap = {
    "Milliliter": 0,
    "liter": 1,
    "cubic meter": 2,
    "cubic inch" : 3,
    "cubic feet":4,
    "pint": 5,
    "quart": 6,
    "gallon": 7,
    "barrel": 8,
  };

  dynamic formulas = {
    "0": [1,0.001,0.000001,0.061023744094732,0.000035314666721489,0.0021133764188652,0.0010566882094326,0.00026417205235815,0.0000083864143605761],
    "1": [1000,1,0.001,61.023744094732,0.035314666721489,2.1133764188652,1.0566882094326,0.26417205235815,0.0083864143605761],
    "2": [1000000,1000,1,61023.744094732,35.314666721489,2113.3764188652,1056.6882094326,264.17205235815,8.3864143605761],
    "3": [16.387064,0.016387064,0.000016387064,1,0.0005787037037037,0.034632034632035,0.017316017316017,0.0043290043290043,0.00013742870885728],
    "4": [28316.846592,28.316846592,0.028316846592,1728,1,59.844155844156,29.922077922078,7.4805194805195,0.23747680890538],
    "5": [473.176473,0.473176473,0.000473176473,28.875,0.016710069444444,1,0.5,0.125,0.003968253968254],
    "6": [946.352946,0.946352946,0.000946352946,57.75,0.033420138888889,2,1,0.25,0.0079365079365079],
    "7": [3785.411784,3.785411784,0.003785411784,231,0.13368055555556,8,4,1,0.031746031746032],
    "8": [119240.471196,119.240471196,0.119240471196,7276.5,4.2109375,252,126,31.5,1]
  };

  void convert(double value, String from, String to) {
    int? nFrom = volumeUnitMap[from];
    int? nTo = volumeUnitMap[to];
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
                    child: Text("Volume Converter",
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
                                items: areaUnits.map((String value) {
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
                                items: areaUnits.map((String value) {
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