import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:women_lose_weight_flutter/store/coffee_data.dart';
import 'package:women_lose_weight_flutter/ui/home/views/home_screen.dart';

class CoffeeDetails extends StatefulWidget {
  final int? index;
  CoffeeDetails({this.index});

  @override
  _CoffeeDetailsState createState() => _CoffeeDetailsState();
}

class _CoffeeDetailsState extends State<CoffeeDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var rating = 3.0;
  int quantity = 1;
  bool switchvalue = true;
  bool isFavourite = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: coffee_list[widget.index!].backgroundColor,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [

              Expanded(
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                70,
                              ),
                              topRight: Radius.circular(
                                70,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 50,
                      child: Container(
                        height: 300,
                        width: 300,
                        child: Hero(
                          tag: coffee_list[widget.index!].image,
                          child: Image.asset(
                            coffee_list[widget.index!].image,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(30),
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    iconSize: 40,
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: coffee_list[widget.index!]
                                          .backgroundColor,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isFavourite = !isFavourite;
                                      });
                                    },
                                    iconSize: 40,
                                    icon: Icon(
                                      isFavourite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: coffee_list[widget.index!]
                                          .backgroundColor,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                child: Text(
                                  coffee_list[widget.index!].name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 45,
                                    child: Text(
                                      "\Rs.${coffee_list[widget.index!].price}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 40,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        iconSize: 40,
                                        icon: Icon(
                                          Icons.remove_circle,
                                          color: coffee_list[widget.index!]
                                              .backgroundColor,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            if (quantity > 0) {
                                              quantity -= 1;
                                            }
                                          });
                                        },
                                      ),
                                      Container(
                                        height: 23,
                                        width: 30,
                                        alignment: Alignment.center,
                                        child: Text(
                                          quantity.toString(),
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        iconSize: 40,
                                        icon: Icon(
                                          Icons.add_circle,
                                          color: coffee_list[widget.index!]
                                              .backgroundColor,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            quantity += 1;
                                          });
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 30,
                                    child: Text(
                                      "L",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  CupertinoSwitch(
                                    trackColor: coffee_list[widget.index!]
                                        .backgroundColor,
                                    value: switchvalue,
                                    activeColor: coffee_list[widget.index!]
                                        .backgroundColor,
                                    onChanged: (value) {
                                      setState(() {
                                        switchvalue = value;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Container(
                                    height: 30,
                                    child: Text(
                                      "S",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 30,
                                width: 200,
                                decoration: BoxDecoration(
                                  color:
                                      coffee_list[widget.index!].backgroundColor,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                                    setState(() {
                                      var snackBar = SnackBar(content: Text('Thank for Using Agility Hub E-Store'));
                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    });
                                  },
                                  child: Center(
                                    child: Text(
                                      "Order Now",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
          RatingBar.builder(
            initialRating: 0,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
