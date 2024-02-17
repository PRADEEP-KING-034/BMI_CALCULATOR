import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  String defaultheightvalue = "Meter";
  void changevalue(String? newvalue){
    setState(() {
      defaultheightvalue = newvalue!;
    });
  }

  double Height = 1;
  void onchange(String height){
    setState(() {
      double finalheight = double.parse(height);
      Height = finalheight;
    });
  }

  double Weight = 0;
  void onweightchange(String weight){
    setState(() {
      double finalweight = double.parse(weight);
      Weight = finalweight;
    });
  }

  double bmivalue = 0;
  String bmi(double height, double weight){
    setState(() {
      double bmi = (weight/((height/100)*(height/100)));
      bmivalue= bmi;
    });
    if (bmivalue>0) {
      return bmivalue.toString();
    }
    else{
      return "";
    }
  }

  String defineBMI = "";
  String definebmi(){
    setState(() {
      if (bmivalue==0){
        defineBMI = "Enter Height and Weight";
      }
      else if (bmivalue<=18.5){
        defineBMI = "Bhai Atleast Gain some Weight";
      }
      else if (bmivalue>18.5 && bmivalue<=24.9){
        defineBMI = "Bhai U r Good in BMI. So Maintain it" ;
      }
      else if (bmivalue>24.9 && bmivalue <=29){
        defineBMI = "Need to focus Bhai";
      }
      else{
        defineBMI = "U fat Boy, Please Reduce it";
      }
    });
    return defineBMI;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black26,

      ),
      body: Container(
        color: Colors.white24,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Height"),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) => onchange(value),
                  ),
                ),
                const SizedBox(width: 60),
                const Text("In Meter",style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(height: 50,),
            const Text("Weight"),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) => onweightchange(value),
                  ),
                ),
                const SizedBox(width: 45,),
                const SizedBox(
                  width: 100,
                  child: Text("In Kilograms",style: TextStyle(fontWeight: FontWeight.bold),),
                )
              ],
            ),
            const SizedBox(height: 200,),
            Center(
              child: Card(
                color: Colors.black12,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  side: BorderSide(width: 2,color: Colors.blue)
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(bmi(Height, Weight),style: const TextStyle(color:Colors.white),),
                      Text(definebmi(),style: const TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}