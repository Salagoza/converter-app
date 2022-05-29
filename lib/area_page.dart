import 'package:flutter/material.dart';

class AreaPage extends StatelessWidget {
  const AreaPage({Key? key}) : super(key: key);

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
                  child: Text("Area Converter",
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
                  children: const [
                    TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Input Value to convert",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18.0,
                              color: Colors.blue,
                            )),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
