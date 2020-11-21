import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oscar/services/db_connection.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
 DatabaseConnection _connection;
  String _baseUrl = 'http://dzs.rcl.mybluehost.me/oscar/api';
  String _baseUrr = 'http://dzs.rcl.mybluehost.me/oscar/api/products.php?catId=';

  var _headers = {"Content-type": "application/x-www-form-urlencoded", "Accept": "application/json"};

  Repository(){
    _connection = DatabaseConnection();
  }

static Database _database;
 Future<Database> get database async {
    if(_database != null)
        return _database;
    _database = await _connection.initDatabase();

    return _database;
  }
Future getData(String page, Map<String, String> map) async {
  // Map m = {"Accept": "application/json"};
  //m.addAll(map);
var res= await http.post("$_baseUrl/$page",body: map ,headers:{"Accept": "application/json"}).then((responce){
var result = json.decode(responce.body);
print(result['msg']);
var data = result["data"];
      return Future.value(data);
});
//print(responce.body);
return Future.value(res);
}

  httpGetp(String api) async {
  return await http.get(_baseUrl + "/" + api);
}
  httpGetById(String api) async {
  return await http.get(_baseUrl + "/" + api);
}

httpgtr(String catId) async{
return http.get(_baseUrr + catId);
}

httpPost(String apisud, data) async {
    print(data);
    return await http.post(_baseUrl + "/" + apisud);
  }


httpGetByUsreId(String apisud) async {
  return await http.get(_baseUrl + "/" + apisud);
}


 getAllLocal(table) async {
    var conn = await database;
    return await conn.query(table);
  }

saveLocal(table, data) async{
  var conn = await database;
  return await conn.insert(table, data);
}

updateLocal(table, columnName, data) async{
  var conn = await database;
  return await conn.update(table, data, where: '$columnName =?', whereArgs: [data['id']]);
}

  getLocalByCondition(table,  columnName,  conditionalValue) async {
    var conn = await database;
    return await conn.rawQuery('SELECT * FROM $table WHERE $columnName =?', ['$conditionalValue']);
  }

  deleteLocalById(table, id) async {
    var conn = await database;
    return await conn.rawDelete("DELETE FROM $table WHERE id = $id");
  }

  deleteLocal(table) async {
    var conn = await database;
    return await conn.rawDelete("DELETE FROM $table");
  }


}

