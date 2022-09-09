// create bmi calculator in flutter
// How to calculate BMI
// fromula BMI=Weight / (Height in meter)*(Height in meter);
//
// normaly we write height in centymeter but we have to conver in meter
// ex: if height in 167cm the  height will be 1.67m
//
// BMI renge accoding WHO
//     bellow 18.5 = under wight
//     18.5-24.9 = nornal weight
//     25.0-29.9 =pre-obesity
//     30.0-34.9 = obesity-class1
//     35.0-39.9 = obesity-class2
//     above 40  = obesity-class3


import 'package:flutter/material.dart';

void main(){
  runApp(myapp());
}
class myapp extends StatelessWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home(),);
  }
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late double height;
  late double weight;
  late String ans='your bmi';
  late String youbmi;

  var weithcontroller =TextEditingController();
  var heightctroller =TextEditingController();

  countBmi(double weight,double height)
  {
    print(weight);
    print(height);
    height=height*2;
    var temp=weight/height;
    print(temp);

    if(temp<18.5){
      youbmi='under weight';
    }
    else if(temp>=18.5 && temp<=24.9){
      youbmi='normal';
    }
    else if(temp>=25.0 && temp<=29.9){
      youbmi='pre obesity';
    }
    else if(temp>=30.0 && temp<=34.9){
      youbmi='obesity class 1';
    }
    else if(temp>=35.0 && temp<=39.9){
      youbmi='obesity class 4';
    }
    else if(temp>=40.0 ){
      youbmi='obesity class 3';
    }
    else{
      youbmi="can't calculate";
    }

    setState((){
      ans=youbmi;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('BMI App'),),
    body: Center(
      child: Container(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'weight in Kg'),
              controller: weithcontroller,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'height in Meter'),
              controller: heightctroller,
            ),

            ElevatedButton(onPressed: (){
              countBmi(double.parse(weithcontroller.text) ,double.parse(heightctroller.text));
            }, child: Text('click')),
            SizedBox(height: 30,),
            Container(
              child: Text('$ans'),)
          ],
        ),
      ),
    ),);

  }
}

