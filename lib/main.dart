

import 'package:flutter/material.dart';
import 'package:konversisuhu/material/input.dart';
import 'package:konversisuhu/material/riwayatSuhu.dart';
import 'package:konversisuhu/material/hasilSuhu.dart';
import 'package:konversisuhu/material/tombolSuhu.dart';
import 'package:konversisuhu/material/targetSuhu.dart';




void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
// }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // final String title;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

//untuk konversi suhu dengan list view
TextEditingController etInput = TextEditingController();
  List<String> listSatuanSuhu = ['Kelvin', 'Reamur', 'Farenheit'];
  String selectedDropDown = 'Kelvin';
  int hasilPerhitungan = 0;
  List<String> listHasil = <String>[];

  void onDropDownChanged(Object? value){
    return setState(() {
      selectedDropDown = value.toString();
    });
  }
  void konversiSuhu(){
    return setState(() {
      if(etInput.text.isNotEmpty){
        switch(selectedDropDown){
          case 'Kelvin':
          hasilPerhitungan = int.parse(etInput.text) + 273;
          break;
          case 'Reamur':
          hasilPerhitungan = (4 * int.parse(etInput.text) / 5) as int;
          break;
          case 'Farenheit':
          hasilPerhitungan = (9 * int.parse(etInput.text) / 5) as int;
          break;
          default:
        }
        listHasil.add(selectedDropDown + " : " + hasilPerhitungan.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Konversi Suhu dengan List View',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Konversi Suhu Dengan List View'),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(children: [
            Input(etInput: etInput),
            targetSuhu(
              selectedDropDown: selectedDropDown,
              listSatuanSuhu: listSatuanSuhu,
              onDropDownChanged: onDropDownChanged,
              konversiSuhu: konversiSuhu,
            ),
            hasilSuhu(hasilPerhitungan: hasilPerhitungan),
            tombolSuhu(
              konversiSuhu: konversiSuhu,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Text('Riwayat Konversi Suhu',
              style: TextStyle(fontSize: 18),
              ),
            ),
            riwayatSuhu(listHasil: listHasil)
          ])
        ),
        ),
    );
  }
  }













//untuk konversi Suhu biasa 
//   // double inputUser = 0;
//   // double kelvin = 0;
//   // double farenheit = 0;
//   // double reamur = 0;

//   // konversi(){
//   //   setState(() {
//   //     inputUser = double.parse(etInput.text);
//   //     kelvin = inputUser + 273;
//   //     farenheit = 9 / 5 * inputUser + 32;
//   //     reamur = 4/ 5 * inputUser;
//   //   });
//   // }

//   // @override
//   // Widget build(BuildContext context) {
//   //   // This method is rerun every time setState is called, for instance as done
//   //   // by the _incrementCounter method above.
//   //   //
//   //   // The Flutter framework has been optimized to make rerunning build methods
//   //   // fast, so that you can just rebuild anything that needs updating rather
//   //   // than having to individually change instances of widgets.
//   //   return MaterialApp(
//   //       // Here we take the value from the MyHomePage object that was created by
//   //       // the App.build method, and use it to set our appbar title.
//   //       title: 'Konversi Suhu dengan Listview',
//   //       theme: ThemeData(
//   //         primaryColor: Colors.blue,
//   //         visualDensity: VisualDensity.adaptivePlatformDensity,
//   //       ),
//   //       home: Scaffold(
//   //         appBar: AppBar(
//   //           title: Text("Konversi Suhu dengan List"),
//   //         ),
//   //         body: Container(
//   //           margin: EdgeInsets.all(8),
//   //           child: Column(
//   //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //             children: [
//   //               TextFormField(
//   //                 decoration: InputDecoration(hintText: "Masukkan Suhu Dalam Celcius"),
//   //                 controller: etInput,
//   //                 keyboardType: TextInputType.number,
//   //               ),
//   //               Row(
//   //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//   //                 children: [
//   //                   Column(
//   //                     children: [
//   //                       const Text(
//   //                         "Kelvinn", 
//   //                         style: TextStyle(fontSize: 20),
//   //                       ),
//   //                       Text('$kelvin', style: const TextStyle(fontSize: 30),
//   //                       )
//   //                     ],
//   //                   ),
//   //                   Column(
//   //                     children: [
//   //                       const Text(
//   //                         "Farenheit",
//   //                         style: TextStyle(fontSize: 20),
//   //                       ),
//   //                       Text('$farenheit', style: const TextStyle(fontSize: 30),
//   //                       )
//   //                     ],
//   //                   ), 
//   //                   Column(
//   //                     children: [
//   //                       const Text(
//   //                         "Reamur",
//   //                         style: TextStyle(fontSize: 20),
//   //                       ),
//   //                       Text('$reamur', style: const TextStyle(fontSize: 30),
//   //                       ),
//   //                 ],
//   //                 ),
//   //             ],
//   //             ),
//   //             Container(
//   //               width: double.infinity,
//   //               child: ElevatedButton(
//   //                 child: const Text("Konversi Suhu"),
//   //                 style: ElevatedButton.styleFrom(
//   //                   primary: Colors.lightGreen,
//   //                 ), 
//   //                 onPressed: konversi,),
//   //             )
//   //         ])
//   //         ),
//   //         ),
//   //     );
//   // }
// }
