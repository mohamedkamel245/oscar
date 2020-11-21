import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oscar/model/categoryProductModel.dart';
import 'package:oscar/model/network.dart';
import 'package:oscar/model/productModel.dart';

class ChooseCate extends StatefulWidget {
  @override
  _ChooseCateState createState() => _ChooseCateState();
}

class _ChooseCateState extends State<ChooseCate> {
   var loading = false;
  List<CategoryProductModel> listCategory = [];
  getProductwithCategory() async {
    setState(() {
      loading = true;
    });
    listCategory.clear();
    final response = await http.get(NetworkUrl.getProductCategory());
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      
          for(var city in data){
        CategoryProductModel product = CategoryProductModel();
        listCategory.add(product.fromJson(city));
      }
        loading = false;
      setState(() {});
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
        title: Text("التخصص"),
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
                            Text(a.categoryName),
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
