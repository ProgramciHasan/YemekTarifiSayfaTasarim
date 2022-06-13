import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Yemek Tarifi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    double ekranGenisligi = ekranBilgisi.size.width;
    double ekranYuksekligi = ekranBilgisi.size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: ekranGenisligi,
              child: Image.asset('images/yemekresmi.jpg'),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: ekranGenisligi / 8,
                    child: ElevatedButton(
                      onPressed: () {
                        print('Beğenildi..!');
                      },
                      child: Yazi('Beğen!', ekranGenisligi / 25),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: ekranGenisligi / 8,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.orange,
                        ),
                        child: Yazi('Yorum Yap!', ekranGenisligi / 25)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(ekranYuksekligi / 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Köfte',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                      fontSize: ekranGenisligi / 25,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Yazi("Izgara üzerinde pişirmeye uygun.",
                          ekranGenisligi / 25),
                      Spacer(),
                      Yazi("8 Ağustos", ekranGenisligi / 25),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(ekranYuksekligi/100),
              child: Yazi(
                  "Köfte harcını hazırlamak için,"
                  " soğanları rendeleyin ve maydanozları ince ince kıyın."
                  " İsterseniz, bir diş sarımsak da ekleyebilirsiniz. "
                  "Soğan, maydanoz, kıyma, yumurta, zeytinyağı ve tuzu bir kaba alıp iyice yoğurun."
                  " Bu sırada istediğiniz baharatları da ekleyerek yoğurmaya devam edin.",
                  ekranGenisligi / 25),
            )
          ],
        ),
      ),
    );
  }
}

class Yazi extends StatelessWidget {
  String icerik = "";
  double yaziBoyut = 0;

  Yazi(this.icerik, this.yaziBoyut);

  @override
  Widget build(BuildContext context) {
    return Text(
      icerik,
      style: TextStyle(
        fontSize: yaziBoyut,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
