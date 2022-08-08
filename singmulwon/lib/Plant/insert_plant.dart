// ignore_for_file: prefer_interpolation_to_compose_strings, no_leading_underscores_for_local_identifiers, missing_required_param, deprecated_member_use, prefer_const_constructors, non_constant_identifier_names, unused_local_variable, use_key_in_widget_constructors
import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import './edit_button.dart';
import './user_plant.dart';

class InsertPlant extends StatefulWidget {
  static const routeName = '/insert-plant';
  @override
  State<InsertPlant> createState() => _InsertPlantState();
}

Future insertPlant(
    BuildContext context, userid, sort, name, humi, lumi, image) async {
  var url = "http://54.177.126.159/ubuntu/flutter/plant/insert_plant.php";
  var response = await http.post(Uri.parse(url), body: {
    "userid": userid,
    "sort": sort,
    "name": name,
    "humi": humi,
    "lumi": lumi,
    "image": image
  });
  Navigator.of(context).pop();
}

Future AutoSetting(String plantInfoId) async {
  var url = "http://54.177.126.159/ubuntu/flutter/plant/auto_setting.php";
  var response = await http.post(Uri.parse(url), body: {
    "plantInfoId": plantInfoId,
  });
  String jsonData = response.body;
  var vld = await json.decode(jsonData)['setting']; //List<dynamic>

  AiSetting setting_plant;
  for (var item in vld) {
    setting_plant = AiSetting(
        plantInfoId: item['plantInfoId'],
        humi: item['humi'],
        lumi: item['lumi']);
  }
  return setting_plant;
}

double _currentWaterValue = 20;
double _currentLightValue = 20;

class _InsertPlantState extends State<InsertPlant> {
  final plantidController = TextEditingController();
  final plantSortController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userId = ModalRoute.of(context).settings.arguments;
    double waterValue = _currentWaterValue;
    double lightValue = _currentLightValue;
    final picker = ImagePicker();
    File _image;

    Future getImage(ImageSource imageSource) async {
      final image = await picker.pickImage(source: imageSource);

      setState(() {
        _image = File(image.path); // 가져온 이미지를 _image에 저장
      });
    }

    Widget showImage() {
      return SizedBox(
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Center(
              child: _image == null
                  ? CircleAvatar(
                      radius: 20.0,
                      backgroundImage: AssetImage('assets/plant_1.jfif'),
                    )
                  : Image.file(File(_image.path))));
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('식물 등록'),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      showImage(),
                      ElevatedButton(
                        onPressed: () {
                          getImage(ImageSource.gallery);
                        },
                        child: Text('식물 사진 편집'),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 200,
                        child: TextField(
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '식물 이름',
                            hintText: '별명 입력',
                          ),
                          controller: plantidController,
                        ),
                      ),
                      Divider(),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '식물 종류',
                          ),
                          controller: plantSortController,
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WaterValue(waterValue.toInt()),
                  LightValue(lightValue.toInt()),
                  FavoriteValue(0),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Icon(Icons.water_drop_outlined),
                  ),
                  Expanded(
                    flex: 7,
                    child: Slider(
                      value: _currentWaterValue,
                      min: 0,
                      max: 100,
                      divisions: 100,
                      label:
                          _currentWaterValue //double.parse(snapshot.data.humi)
                              .round()
                              .toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentWaterValue = value;
                          waterValue = _currentWaterValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Icon(Icons.sunny),
                  ),
                  Expanded(
                    flex: 7,
                    child: Slider(
                      value: _currentLightValue,
                      max: 100,
                      divisions: 100,
                      label: _currentLightValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentLightValue = value;
                          lightValue = _currentLightValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 110,
                    height: 40,
                    child: FlatButton(
                      textColor: Colors.white,
                      color: Colors.green,
                      child: Text(
                        "자동설정",
                        style: TextStyle(fontSize: 20),
                      ),
                      //수정
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  SizedBox(
                    width: 110,
                    height: 40,
                    child: FlatButton(
                      textColor: Colors.white,
                      color: Colors.green,
                      child: Text(
                        "식물등록",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        insertPlant(
                            context,
                            userId,
                            plantSortController.text,
                            plantidController.text,
                            waterValue.toString(),
                            lightValue.toString(),
                            'https://search.pstatic.net/sunny/?src=https%3A%2F%2Fmedia.istockphoto.com%2Fvectors%2Fecology-logo-green-design-vector-id862500344%3Fk%3D20%26m%3D862500344%26s%3D170667a%26w%3D0%26h%3D9B59bc6G5oyJ5aLBUi909Xkmxp8JB52r_aRvlZT8QwE%3D&type=sc960_832');
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

double changeWater(BuildContext context, snapshot) {
  return double.parse(snapshot.data.humi);
}

double changeLight(BuildContext context, snapshot) {
  return double.parse(snapshot.data.lumi);
}
