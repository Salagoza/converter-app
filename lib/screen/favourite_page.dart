import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/favourite_service.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  double? userInput;
  String? resultMessage;

  void convert(double value, double conversionRate) {
    var result = (value * conversionRate).toStringAsFixed(2);

    if (result == 0) {
      resultMessage = "Can't Perform the conversion";
    } else {
      resultMessage = "${result.toString()} ";
    }
    setState(() {
      resultMessage = resultMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: 80.0,
              width: 400.0,
              child: Center(
                child: Text("My Favourite",
                    style: GoogleFonts.comfortaa(
                      color: Colors.grey,
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                    )),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<FavouriteData>>(
                  future: DataBaseHelper.instance.getFavourites(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<FavouriteData>> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: Text('Loading...'));
                    }
                    return ListView(
                      children: snapshot.data!.map((favourite) {
                        return Center(
                            child: Card(
                          child: ExpansionTile(
                            title: Text(
                              '${favourite.fromUnit} -> ${favourite.toUnit}',
                              style: GoogleFonts.comfortaa(
                                  color: Color(0xFF616161), fontSize: 18),
                            ),
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        width: 280,
                                        child: TextField(
                                          onChanged: (text) {
                                            var input = double.tryParse(text);
                                            if (input != null) {
                                              setState(() {
                                                userInput = input;
                                              });
                                            }
                                          },
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.all(10),
                                            hintText:
                                                "Enter a value to convert",
                                            hintStyle: GoogleFonts.comfortaa(
                                                color: Colors.grey,
                                                fontSize: 18),
                                            border: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                              style: BorderStyle.none,
                                              width: 0,
                                            )),
                                          ),
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                      Column(
                                        children: <Widget>[
                                          ElevatedButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                        content: Text(userInput != null ? "${(userInput! * favourite.conversionRate).toStringAsFixed(2)} ${favourite.toUnit}" : "Input a number"),
                                                        actions: [TextButton(child: Text("Done"), onPressed: () => Navigator.pop(context),)],
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(30),
                                                        ),
                                                        contentTextStyle: GoogleFonts.comfortaa(
                                                          color: Colors.grey,
                                                          fontSize: 32,
                                                        ),
                                                      ));
                                            },
                                              child: Text(
                                                "Convert",
                                                style: GoogleFonts.comfortaa(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 14,
                                                    color: Colors.white),
                                              ),
                                              style: ButtonStyle(

                                                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                                                shape:  MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(20),
                                                    ))
                                              ),
                                            ),
                                          RawMaterialButton(
                                            onPressed: () {
                                              setState(() {
                                                DataBaseHelper.instance
                                                    .remove(favourite.id!);
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.redAccent,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              alignment:
                                                  AlignmentDirectional.center,
                                              width: 90,
                                              height: 35,
                                              child: Text(
                                                "Delete",
                                                style: GoogleFonts.comfortaa(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 14,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ));
                      }).toList(),
                    );
                  }),
            )
          ],
        )),
      ),
    );
  }
}
