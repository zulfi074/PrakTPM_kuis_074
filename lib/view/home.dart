import 'package:flutter/material.dart';
import 'package:kuis_123210074/model/groceries.dart';
import 'package:kuis_123210074/view/detailpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("KUIS TPM IF-E",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final Groceries groceries = groceryList[index];
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(groceries: groceries)));
            },
            child: Card(
              child: Column(
                children: [

                  Container(
                    width: 100,
                    height: 100,
                    child: Image.network(groceries.productImageUrls[0]),
                  ),

                  Text(groceries.name),
                  Text(groceries.price),
                  Text(groceries.discount),
                  Text(groceries.reviewAverage)
                  
                ],
              ),
            ),
          );

        },
        itemCount : groceryList.length,
      ),
    );
  }
}
