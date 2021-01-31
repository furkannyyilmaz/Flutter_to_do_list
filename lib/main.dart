import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do Uygulamasi',
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alisveris Listesi Uygulamasi"),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();
  List alisverisListesi = [];

  elemanEkle() {
    setState(() {
      alisverisListesi.add(t1.text);
      t1.clear();
    });
  }

  elemanCikar() {
    setState(() {
      alisverisListesi.remove(t1.text);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50),
      child: Column(
        children: <Widget>[
          Flexible(
              child: ListView.builder(
                  itemCount: alisverisListesi.length,
                  itemBuilder: (context, indexNumarasi) => ListTile( ///!!!!!
                    subtitle: Text("Alisveris malzemeleri"),
                        title: Text(alisverisListesi[indexNumarasi]),
                      ))),
          TextField(
            controller: t1,
          ),
          RaisedButton(
            onPressed: elemanEkle,
            child: Text("ekle"),
          ),
          RaisedButton(
            onPressed: elemanCikar,
            child: Text("cikar"),
          ),
        ],
      ),
    );
  }
}
