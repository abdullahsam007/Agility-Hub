import 'package:flutter/material.dart';
import 'package:women_lose_weight_flutter/newupdate/login/deitpla/breakfast.dart';
import 'package:women_lose_weight_flutter/newupdate/login/deitpla/dinner.dart';
import 'package:women_lose_weight_flutter/newupdate/login/deitpla/lunch.dart';

class DeitPlanScreen extends StatefulWidget {
  const DeitPlanScreen({Key? key}) : super(key: key);

  @override
  State<DeitPlanScreen> createState() => _DeitPlanScreenState();
}

class _DeitPlanScreenState extends State<DeitPlanScreen> {
  bool _isChecked = false;

  List<CheckBoxListTileModel> checkBoxListTileModel =
  CheckBoxListTileModel.getUsers();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

        title: Text('Deit Plan'),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Breakfast()));
            },
            title: Text('Breakfast',
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            trailing: Icon(Icons.arrow_circle_right_outlined),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Lunch()));
            },
            title: Text('Lunch',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            trailing: Icon(Icons.arrow_circle_right_outlined),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>dinner()));
            },
            title: Text('Dinner',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            trailing: Icon(Icons.arrow_circle_right_outlined),
          ),
        ],
      )
    );
  }
  void itemChange(bool val, int index) {
    setState(() {
      checkBoxListTileModel[index].isCheck = val;
    });
  }
}
class CheckBoxListTileModel {
  int? userId;
  String? img;
  String title;
  bool? isCheck;

  CheckBoxListTileModel({this.userId, this.img, required this.title, this.isCheck});

  static List<CheckBoxListTileModel> getUsers() {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(
          userId: 1,
          img: 'assets/images/android_img.png',
          title: "25-35 Years",
          isCheck: true),
      CheckBoxListTileModel(
          userId: 2,
          img: 'assets/images/flutter.jpeg',
          title: "36-45 Years",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 3,
          img: 'assets/images/ios_img.webp',
          title: "46-60 Years",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 4,
          img: 'assets/images/php_img.png',
          title: "Over 60 Years",
          isCheck: false),

    ];
  }}