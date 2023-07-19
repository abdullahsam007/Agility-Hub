import 'package:flutter/material.dart';
class Lunch extends StatefulWidget {
  const Lunch({Key? key}) : super(key: key);

  @override
  State<Lunch> createState() => _LunchState();
}

class _LunchState extends State<Lunch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Lunch'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/store/lunch.webp',fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10,),
            Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.yellow.shade100,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Protein: 55g'),
                    Text('|'),
                    Text('Fats: 11g'),
                    Text('|'),
                    Text('Carbs: 50g'),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.bubble_chart_sharp),
              title:Text('Whole-grain Roti'),
            ),
            ListTile(
              leading: Icon(Icons.bubble_chart_sharp),
              title:Text('Mixed Vegetable'),
            ),
            ListTile(
              leading: Icon(Icons.bubble_chart_sharp),
              title:Text('Grilled chicken Filled with Yogurt'),
            ),
            SizedBox(height: 10,),
            Text('Alternative Breakfast',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            SizedBox(height: 10,),
            ListTile(
              leading: Icon(Icons.bubble_chart_sharp),
              title:Text('Curry Pakora'),
            ),
            ListTile(
              leading: Icon(Icons.bubble_chart_sharp),
              title:Text('Brown Rice'),
            ),
            ListTile(
              leading: Icon(Icons.bubble_chart_sharp),
              title:Text('Fruit like Apple of Guavas'),
            )
          ],
        ),
      ),
    );
  }
}
