import 'package:flutter/material.dart';
import 'package:travel_apps/core/model/travel_response.dart';
import 'package:travel_apps/core/service/api_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  
  ApiService apiService;

  @override
  void initState() {
    // TODO: implement initState
    apiService = ApiService();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel'),
      ),

      body: FutureBuilder<TravelResponse>(
          future: apiService.getTravelData(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }else{
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data.data.length,
                    itemBuilder: (context, index){
                    var data = snapshot.data.data[index];

                    return ListTile(
                      leading: Image.network(
                          data.gambarPariwisata,
                        width: 80,
                        height: 50,
                        fit: BoxFit.cover,

                      ),
                      title: Text(data.namaPariwisata),
                      subtitle: Text(data.alamatPariwisata),
                    );
                    }
                );
              }else{
                return Text('something went wrong');
              }

            }

          }),

    );
  }
}