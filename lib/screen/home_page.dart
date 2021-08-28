import 'package:book_app/service/list_api.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text(
          "Company",
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Container(
        color: Colors.brown[200],
        child: FutureBuilder(
          initialData: [],
          future: ApiService().loadData(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => ListTile(
                        title: Text(
                          snapshot.data![index].name,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        subtitle: Text(
                          snapshot.data![index].company,
                          style: TextStyle(color: Colors.black),
                        ),
                      ));
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
