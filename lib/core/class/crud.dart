import 'dart:convert';
import 'package:dartz/dartz.dart';

import 'package:fourth_grade_project/core/class/statusrequest.dart';
import 'package:fourth_grade_project/core/functions/checkinternet.dart';

import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
   
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
          print(response.statusCode) ; 

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          print(responsebody) ; 
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
     
  }
}

class Crud1 {
  Future<Either<StatusRequest, Map>> postData(String linkurl, List<Map<String, dynamic>> dataList) async {
    if (await checkInternet()) {
      var response = await http.post(
        Uri.parse(linkurl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(dataList),
      );

      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        print(responsebody);
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  Future<bool> checkInternet() async {
    // تحقق من الاتصال بالإنترنت
    // يمكنك استخدام أي طريقة تفضلها للتحقق من الاتصال
    return true;
  }
}
