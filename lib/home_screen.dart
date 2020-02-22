import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  /// mendeklarasikan key
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///sebagai penanda / key pada scaffold ( penggunaannya bersifat opsional )
      key: _scaffoldKey,

      ///untuk appbar
      appBar: AppBar(
        ///merubah warna appbar
        backgroundColor: Colors.black,

        ///memberi judul/nama pada appbar
        title: Text(
          'Apps Pertama',
          style: TextStyle(color: Colors.green),
        ),
        leading: Icon(
          Icons.home,
          color: Colors.green,
        ),

        ///pemberian icon di sebelah kanan
        ///bisa lebih dari satu
        actions: <Widget>[
          Icon(Icons.settings),
        ],

        ///membuat text berada di rata tengah
        centerTitle: true,
      ),
      //body merupakan isi dari layout yang akan kita buat
      body: ListView(
        children: <Widget>[
          /// inkwell untuk membungkus widget supaya dapat diberikan fungsi, dalam kasus di bawah ini,
          /// inkwell membungkus gambar supaya gambar dapat memunculkan snackbar
          InkWell(
              onTap: () {
                print('Logo Kampus');
                _scaffoldKey.currentState.showSnackBar(
                  SnackBar(
                    content: Text('Logo Kampus'),
                  ),
                );
              },
              child: Image.network('https://akupintar.id/documents/20143/0/download+%285%29.jpg/60e00d51-a05c-53c9-319f-472672764968?version=1.0&t=1519246428495&imageThumbnail=1')),

          ///widget unuk menampilkan gambar dari internet, gambar bisa berupa png maupun gif
          Image.network('https://media1.tenor.com/images/6dcf3a15e0b17ea5742892e4ae220b4a/tenor.gif?itemid=7551863')

        ],
      ),
    );
  }
}
