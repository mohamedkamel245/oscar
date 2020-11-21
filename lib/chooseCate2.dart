import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oscar/model/city.dart';
import 'package:oscar/model/categoryProductModel.dart';
import 'package:oscar/model/network.dart';

class ChooseCate2 extends StatefulWidget {
  @override
  _ChooseCate2State createState() => _ChooseCate2State();
}

class _ChooseCate2State extends State<ChooseCate2> {
   var loading = false;
  List<City> listCategory = [];
  getProductwithCategory() async {
    setState(() {
      loading = true;
    });
    listCategory.clear();
    final response = await http.get(NetworkUrl.getProductCategory2());
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      setState(() {
        for (Map i in data) {
          City city = City();
          listCategory.add(city.fromJson(i));
        }
        loading = false;
      });
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getProductwithCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
         
        title: Text("أختر المدينة"),
        elevation: 1,
        backgroundColor:  Color(0xFF008fff),
      ),
      body: Container(
          child: loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: listCategory.length,
                  itemBuilder: (context, i) {
                    final a = listCategory[i];
                    return InkWell(
                      onTap: () {
                        Navigator.pop(context, a);
                      },
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(a.cat_title),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 4),
                              child: Divider(
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )),
    );
  }
}
