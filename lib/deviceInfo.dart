import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  String model="";
  String deviceVersion="";
  String id="";
  String brand="";
  String display="";
  String host="";
  String realdev="";
  String finger="";
  String type="";

  Future<void>deviceDetails()async {
    final DeviceInfoPlugin device =  DeviceInfoPlugin();
    try {
     if(Platform.isAndroid){
       var build=await device.androidInfo;
       setState(() {
         model=build.model;
         deviceVersion=build.version.sdkInt.toString();
         id=build.androidId;
         brand=build.brand;
         display=build.display;
         host=build.host;
         realdev=build.isPhysicalDevice.toString();
         finger=build.fingerprint;
         type=build.type;
       });
  }else if(Platform.isIOS){
       var ios=await device.iosInfo;
       setState(() {
         model=ios.model;
         deviceVersion=ios.systemVersion;
         realdev=ios.isPhysicalDevice.toString();
       });
     }
    }catch(e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         centerTitle: true,
         title: const Text("My Device Information"),
       ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          deviceDetails();
        },
        child: const Icon(Icons.info),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("model is :- $model"),
            const SizedBox(height: 20,),
            Text("device version is :- $deviceVersion"),
            const SizedBox(height: 20,),
            Text("id is :- $id"),
            const SizedBox(height: 20,),
            Text("brand is :- $brand"),
            const SizedBox(height: 20,),
            Text("display is :- $display"),
            const SizedBox(height: 20,),
            Text("host is :- $host"),
            const SizedBox(height: 20,),
            Text("real device is :- $realdev"),
            const SizedBox(height: 20,),
            Text("finger is :- $finger"),
            const SizedBox(height: 20,),
            Text("type is :- $type"),
          ],
        ),
      ),
    );
  }
}
// https://newsapi.org/v2/top-headlines?country=us&apiKey=90947d7a9b2e438aa5575a74a95a43c2
// 90947d7a9b2e438aa5575a74a95a43c2