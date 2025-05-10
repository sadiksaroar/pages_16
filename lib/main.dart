import 'package:flutter/material.dart';
import 'package:pages_16/page_17/page_17.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  GroceryStoreScreen(),
    );
  }
}

class  GroceryStoreScreen extends StatelessWidget {
   // ({super.key});
 final List<Map<String, String>> products = [
   {
     "name": "Pearl Milling",
     "price": "\$163.00",
     "image": "GroceryStoreScreen/Link → 1-30-500x500.jpg.png"
   },
   {
     "name": "Double Chocolate",
     "price": "\$163.00",
     "image": "GroceryStoreScreen/Link → 1-30-500x500.jpg.png"
   },
   {
     "name": "Crust Frozen",
     "price": "\$134.00",
     "image": "GroceryStoreScreen/Link → 1-30-500x500.jpg.png"
   },
   {
     "name": "California Pizza",
     "price": "\$105.00",
     "image": "GroceryStoreScreen/Link → 1-30-500x500.jpg.png"
   }
 ];
 @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

        leading: Icon(Icons.arrow_back_ios, color: Colors.black,),
        title: TextField(
          decoration: InputDecoration(
            hintText: "Search...",
            // border: InputBorder.none,
            prefixIcon: Icon(Icons.search)
          ),
        ),
        actions: [
          IconButton(onPressed: (){
            showModalBottomSheet(context: context,
                isScrollControlled: false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
            builder: (context) => FilterSheet(),
            );
          }, icon: Icon(Icons.filter_list),),
        ],

      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('GroceryStoreScreen/Image.png'), // Replace with actual store logo path
                  radius: 20,
                ),
                SizedBox(width: 10),
                Text(
                  'Grocery Store',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(Icons.verified, color: Colors.blue),
              ],
            ),
            Text('104 Products 1.3k Followers'),
            SizedBox(height: 13,),
            Row(
              children: [
                ChoiceChip(label: Text("All", style: TextStyle(color: Colors.green),), selected: true, onSelected: (_){}), SizedBox(width: 15,),
                ChoiceChip(label: Text("letest", style: TextStyle(color: Colors.green),), selected: false, onSelected: (_){}), SizedBox(width: 15,),
                ChoiceChip(label: Text("MostPopular", style: TextStyle(color: Colors.green),), selected: false, onSelected: (_){}),SizedBox(width: 15,),
                ChoiceChip(label: Text("chpest", style: TextStyle(color: Colors.green),), selected: false, onSelected: (_){}),SizedBox(width: 15,),

              ],
            ),
            SizedBox(height: 10,),
            Expanded(child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemCount: products.length,
              itemBuilder: (context, index){
                  return Stack(
                    children: [
                      Card(
                        child: Column(
                          children: [
                            Expanded(child: Image.asset(products[index]['image']!,  fit: BoxFit.cover)),
                            Padding(padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(products[index]['name']!, style: TextStyle(fontWeight: FontWeight.bold),),
                                Text(products[index]['price']!)
                              ],
                            ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 9,
                          right: 9,
                          child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.favorite_border, color: Colors.red,),
                      ))
                    ],
                  );
              },
              
            
            ),
            )

          ],
        ),
      ),
    );
  }
}
