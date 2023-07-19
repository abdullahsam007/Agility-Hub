import 'package:flutter/material.dart';
class Breakfast extends StatefulWidget {
  const Breakfast({Key? key}) : super(key: key);

  @override
  State<Breakfast> createState() => _BreakfastState();
}

class _BreakfastState extends State<Breakfast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Breakfast'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/store/breakfast.jpeg',fit: BoxFit.cover,
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
                    Text('Protein: 29g'),
                    Text('|'),
                    Text('Fats: 15g'),
                    Text('|'),
                    Text('Carbs: 59g'),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.bubble_chart_sharp),
              title:Text('2 eggs (Omelet)'),
            ),
            ListTile(
              leading: Icon(Icons.bubble_chart_sharp),
              title:Text('2 Brown Bread'),
            ),
            ListTile(
              leading: Icon(Icons.bubble_chart_sharp),
              title:Text('1 Glass of Milk'),
            ),

            SizedBox(height: 10,),
            Text('Alternative Breakfast',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            SizedBox(height: 10,),
            ListTile(
              leading: Icon(Icons.bubble_chart_sharp),
              title:Text('Oats'),
            ),
            ListTile(
              leading: Icon(Icons.bubble_chart_sharp),
              title:Text('A Glass of Milk'),
            ),
            ListTile(
              leading: Icon(Icons.bubble_chart_sharp),
              title:Text('Sliced Apple'),
            )
          ],
        ),
      ),
    );
  }
}
