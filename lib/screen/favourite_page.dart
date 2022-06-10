import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/favourite_service.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: FutureBuilder<List<FavouriteData>>(
              future: DataBaseHelper.instance.getFavourites(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<FavouriteData>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child:  Text('Loading...'));
                }
                return ListView(
                  children: snapshot.data!.map((favourite) {
                    return Center(
                      child: ExpansionTile(
                        title: Text('${favourite.fromUnit} -> ${favourite.toUnit}',
                        style: GoogleFonts.comfortaa(
                            color: Color(0xFF616161), fontSize: 18),
                        ),
                        children: [
                          Column(
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(15),
                                    hintText: "Enter a value to convert",
                                    hintStyle: GoogleFonts.comfortaa(
                                        color: Colors.grey, fontSize: 18),
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        style: BorderStyle.none,
                                        width: 0,
                                      )),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                                RawMaterialButton(
                                    onPressed: () {
                                      print("pressed");
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      alignment: AlignmentDirectional.center,
                                      width: 100,
                                      height: 30,
                                      child: Text(
                                        "Convert",
                                        style: GoogleFonts.comfortaa(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 14,
                                            color: Colors.white),
                                      ),
                                    )),
                          ]
                          )

                        ],
                      ),

                    );
                  }).toList(),
                );
              }),
        ),
      ),
    );
  }
}