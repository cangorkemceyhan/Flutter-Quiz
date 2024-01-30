import 'dart:ffi';

import 'package:flutter/material.dart';
import 'constants.dart';
import 'testVeri.dart';

void main() {
  runApp(
    BilgiTesti(),
  );
}

class BilgiTesti extends StatelessWidget {
  const BilgiTesti({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(backgroundColor: Colors.deepPurpleAccent.shade200,
          body: SafeArea(
            child: SoruSayfasi(
            ),
          ),
        ));
  }
}

class SoruSayfasi extends StatefulWidget {
  const SoruSayfasi({super.key});

  @override
  State<SoruSayfasi> createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {

  List <Icon> secimlerListesi= [];

  testVeri test_1=testVeri();

  void butonFonksiyonu(bool secilenButon){

    if(test_1.oyunSonu()==true){

      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Flutter senden sorulur!"),
            //content: new Text("Alert Dialog body"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new ElevatedButton(
                child: new Text("Tekrar Oyna"),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    secimlerListesi= [];
                    test_1.testiSifirla();
                  });
                },
              ),
            ],
          );
        },
      );
    }
    else{
    setState(() {
      test_1.getSoruYaniti()==secilenButon?secimlerListesi.add(dogruIcon):
      secimlerListesi.add(yanlisIcon);

      test_1.sonrakiSoru();
    });}
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 250),
                child: Text(
                  test_1.getSoruMetni(),
                  style: TextStyle(fontSize: 23, color: Colors.white),
                ),
              ),
            )),
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 10,
          spacing: 13,
          children: secimlerListesi,
        ),
        Row(
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                      butonFonksiyonu(false);
                      },
                      child: Icon(
                        Icons.thumb_down,
                        size: 50,
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red)),
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                  butonFonksiyonu(true);
                  },
                  child: Icon(
                    Icons.thumb_up,
                    size: 50,
                  ),
                  style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}


