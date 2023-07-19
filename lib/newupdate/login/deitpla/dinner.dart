import 'package:flutter/material.dart';
class dinner extends StatefulWidget {
  const dinner({Key? key}) : super(key: key);

  @override
  State<dinner> createState() => _dinnerState();
}

class _dinnerState extends State<dinner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Dinner'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/store/dinner.webp',fit: BoxFit.cover,
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
                    Text('Protein: 44g'),
                    Text('|'),
                    Text('Fats: 7.12g'),
                    Text('|'),
                    Text('Carbs: 19g'),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.bubble_chart_sharp),
              title:Text('Plain Chicken Curry with Green Salad'),
            ),
            ListTile(
              leading: Icon(Icons.bubble_chart_sharp),
              title:Text('Multi-grain roti'),
            ),
            ListTile(
              leading: Icon(Icons.bubble_chart_sharp),
              title:Text('Grilled Chicken'),
            ),
            SizedBox(height: 10,),
            Text('Alternative Breakfast',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            SizedBox(height: 10,),
            ListTile(
              leading: Icon(Icons.bubble_chart_sharp),
              title:Text('Fish or Chicken'),
            ),
            ListTile(
              leading: Icon(Icons.bubble_chart_sharp),
              title:Text('With or Without Multi-grain'),
            ),
            ListTile(
              leading: Icon(Icons.bubble_chart_sharp),
              title:Text('Green Salad'),
            )
          ],
        ),
      ),
    );
  }
}
