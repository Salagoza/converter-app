import 'package:converter_app/screen/length_page.dart';
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

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: textController,
          )
        ),
      body: Center(
        child: FutureBuilder<List<FavouriteData>>(
          future: DataBaseHelper.instance.getFavourites(),
          builder: (BuildContext context,  AsyncSnapshot<List<FavouriteData>> snapshot){
            if (!snapshot.hasData) {
              return Center(child: Text('Loading...'));
            }
            return ListView(
              children: snapshot.data!.map((favourite) {
                return Center(
                  child: ListTile(
                    title: Text(favourite.fromUnit),
                    onLongPress: () {
                      setState(() {
                        DataBaseHelper.instance.remove(favourite.id!);
                      });
                    }
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
