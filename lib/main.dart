
import 'package:flutter/material.dart';

void main() {
  runApp(const Homepage());
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  // Method to create a category of unit
  Widget createCategoryButton(Color c,String buttonLabel) {
    return Expanded(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 200,
          child: TextButton(
            child: Text(buttonLabel),
            style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: c,
                textStyle:
                const TextStyle(fontSize: 24,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold)
            ),
            onPressed: () {
              print(buttonLabel);
            },
          ),
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        backgroundColor: Colors.grey,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Container(
                width: 200.0,
                child: Text(
                    "Unit Converter",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ),
                Row(
                    children: [createCategoryButton(Colors.yellow, "Area"),
                      createCategoryButton(Colors.red, "Temperature")
                    ]),
                Row(
                    children: [createCategoryButton(Colors.green, "Length"),
                      createCategoryButton(Colors.blue, "Volume")]
                ),
                Row(
                    children: [createCategoryButton(Colors.purple,"Weight"),
                      createCategoryButton(Colors.pink,"Speed")]
                )
                
            ]
          )
            ,
          ),
        ),
      ),
    );
  }

}

