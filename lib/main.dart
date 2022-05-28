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
          height: 250,
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
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Column(
            children: [
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
            ],
          ),
        ),
      ),
    );
  }

}

