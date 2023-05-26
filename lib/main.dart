import 'package:flutter/material.dart';
import 'constants.dart';

void main() {
  runApp(menu_page());
}
class FoodType {
  final String name;
  final List<String> foodNames;
  final List<double> price;

  FoodType({required this.name, required this.foodNames, required this.price});
}

class menu_page extends StatefulWidget {
  @override
  State<menu_page> createState() => _menu_pageState();
}


class _menu_pageState extends State<menu_page> {
  List<FoodType> foodTypes = [
    FoodType(
      name: 'Italian',
      foodNames: ['Pizza', 'Pasta', 'Lasagna'],
      price : [250,150,200],
    ),
    FoodType(
      name: 'Mexican',
      foodNames: ['Tacos', 'Burritos', 'Enchiladas','Nachos'],
      price : [100,150,150,50],
    ),
    FoodType(
      name: 'Chinese',
      foodNames: ['Fried Rice', 'Dim Sum', 'Kung Pao Chicken','Chilly Paneer','Chilly Chicken'],
      price : [75,100,80,70,90],
    ),
    FoodType(
      name: 'Indian',
      foodNames: ['Paneer Handi', 'Tandoori Chiken', 'Biryani','Mutter Paneer','Tandoori Roti'],
      price : [80,125,75,75,10],
    ),
    FoodType(
      name: 'Beverages',
      foodNames: ['Mango Shake', 'Chocolate Shake', 'Strawberry Shake','Oreo Shake','Choco Frappe','Mojito','Coke','Cold Coffee'],
      price : [50,50,50,50,75,35,40,50],
    ),
  ];

  FoodType selectedFoodType = FoodType(
    name: 'Italian',
    foodNames: ['Pizza', 'Pasta', 'Lasagna'],
    price : [250,150,200],
  );

  TextEditingController _value = TextEditingController();
  late String searchtext = '';
  void clear(){
    setState(() {
      searchtext ='';
      _value.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              color: kBGcolor,
            gradient: RadialGradient(
              colors: kGradientB,
              radius: 4.5,
              focalRadius: 5,
              center: Alignment.topLeft
            )
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('Menu',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.shopping_cart,
                        size: 30,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: foodTypes.length,
                    itemBuilder: (BuildContext context, int index) {
                      FoodType foodType = foodTypes[index];
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedFoodType = foodType;
                            });
                          },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: kCardColor,
                          borderRadius: BorderRadius.circular(12),
                          gradient: RadialGradient(
                            colors: kGradientB,
                            radius: 100,
                            focalRadius: 50.0,
                            center: Alignment.topLeft,
                          ),
                        ),
                        width: 150,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/${foodType.name.toLowerCase()}.png',
                              height: 100,

                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 5),
                            Text(
                              foodType.name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                      );
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.fromLTRB(36, 15, 36, 15),
                  child: TextField(
                    controller: _value,
                    cursorColor: kLightColor,
                    style: TextStyle(
                      color: kLightColor,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xDA40280B),
                      hintText: 'Search for name...',
                      hintStyle: TextStyle(
                          color: kLightColor
                      ),
                      suffixIcon: GestureDetector(
                        onTap: clear,
                        child: Icon(Icons.cancel_outlined,
                          color: kLightColor,
                        ),
                      ),
                      prefixIcon: Icon(Icons.search,
                        color: kLightColor,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            width: 1.0,
                            color: Color(0xFF816F27),
                          )
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchtext = value;
                      });
                      // Perform search operation here using the entered value
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: selectedFoodType.foodNames.length,
                    itemBuilder: (BuildContext context, int index) {
                      String foodName = selectedFoodType.foodNames[index];
                      String cost = selectedFoodType.price[index].toString();
                      return Card(
                        color: kCardColor,
                        margin: EdgeInsets.all(5),
                        child: Container(
                          height: 80,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: kCardColor,
                            borderRadius: BorderRadius.circular(5),
                            gradient: RadialGradient(
                              colors: kGradientA,
                              radius: 60,
                              focalRadius: 50.0,
                              center: Alignment.topLeft,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(foodName,
                              style: kCardHeadingText,),
                                Row(
                                  children: [
                                    Icon(Icons.currency_rupee,
                                      color: kLightColor,
                                      size: 16,
                                    ),
                                    Text(' '+cost,
                                    style: kCardLableText,),
                                  ],
                                ),
                            ],
                            ),
                              Icon(Icons.add_shopping_cart,
                                size: 30,
                                  color: Colors.white,
                              )
                        ]
                          ),
                        )
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      )
      );
  }
}


