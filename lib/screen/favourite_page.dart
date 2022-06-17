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

  @override
  void initState() {
    userInput = 0;
    super.initState();
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
                                          RawMaterialButton(
                                            onPressed: () {
                                              if (favourite.fromUnit == "Degree Celsius" || favourite.fromUnit == "Degree Fahrenheit"){
                                                if (favourite.fromUnit == "Degree Celsius"){
                                                  String result = (userInput! * favourite.conversionRate + 32).toStringAsFixed(2);
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          AlertDialog(
                                                            content: Text("$result ${favourite.toUnit}"),
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
                                                }else{
                                                  String result = ((userInput! + favourite.conversionRate) * 0.5556).toStringAsFixed(2);
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                  AlertDialog(
                                                    content: Text("$result ${favourite.toUnit}"),
                                                    actions: [TextButton(child: const Text("Done"),
                                                      onPressed: () => Navigator.pop(context),)],
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(30),
                                                    ),
                                                    contentTextStyle: GoogleFonts.comfortaa(
                                                      color: Colors.grey,
                                                      fontSize: 32
                                                    ),
                                                  ));
                                                }
                                              }else{
                                                showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        AlertDialog(
                                                          content: Text(userInput == 0 ? "Input a number to convert" : "${(userInput! * favourite.conversionRate)} ${favourite.toUnit}"),
                                                          actions: [TextButton(child: const Text("Done"), onPressed: () => Navigator.pop(context),)],
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(30),
                                                          ),
                                                          contentTextStyle: GoogleFonts.comfortaa(
                                                            color: Colors.grey,
                                                            fontSize: 32,
                                                          ),
                                                        ));
                                              }
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                BorderRadius.circular(20),
                                              ),
                                              alignment:
                                              AlignmentDirectional.center,
                                              width: 90,
                                              height: 35,
                                              child: Text(
                                                "Convert",
                                                style: GoogleFonts.comfortaa(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 14,
                                                    color: Colors.white),
                                              ),
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
