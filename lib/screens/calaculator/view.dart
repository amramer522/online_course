import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

  List<dynamic> chars = [1,2,3,4,5,6,7,8,9,0,"+","-","*","/","=","%","C","DEL","SQRT"];
  double? result;
  String input = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BackButton(),
              const Text("Result"),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                  height:100 ,width: double.infinity,decoration: const BoxDecoration(
                  color: Colors.black
              ),child: Text("${result??""}",style: const TextStyle(color: Colors.white,fontSize: 35),)),
              const Text("Input"),
              Container(
                  height:100 ,width: double.infinity,decoration:const BoxDecoration(
                color: Colors.black
              ),child: Text(input,style: const TextStyle(color: Colors.white,fontSize: 35),)),
              Container(
                padding: const EdgeInsets.all(3),
                child: Wrap(
                  children: List.generate(chars.length, (index) => GestureDetector(
                    onTap: (){
                      checkChar(chars[index]);
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      margin:const EdgeInsetsDirectional.only(end: 3,top: 3),
                      child: Center(child: Text("${chars[index]}")),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.grey
                      ),
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void checkChar(char){
    switch(char)
    {
      case "+":
      case "*":
      case "/":
      case "-":
      case "%":
        ifChar(char);
        break;
      case "DEL":
        if(input.isNotEmpty)
          {
            input = input.substring(0,input.length-1);
          }
        break;
      case "C":
        input = "";
        result=null;
        break;
      case "=":
        ifChar(char);
        input= "";
        break;
      default:
        input = input + char.toString();
    }
    setState(() {

    });
  }


  void mySplit(char)
  {
    List<String> nums=[];
    if(input.contains("+"))
      {
        nums= input.split("+");
        double num1 = double.parse(nums[0].trim());
        double num2 = double.parse(nums[1].trim());
        result = num1+num2;
      }else if(input.contains("*"))
      {
      nums= input.split("*");
      double num1 = double.parse(nums[0]);
      double num2 = double.parse(nums[1]);
      result = num1*num2;
    }else if(input.contains("/"))
    {
      nums= input.split("/");
      double num1 = double.parse(nums[0].trim());
      double num2 = double.parse(nums[1].trim());
      result = num1/num2;
    }else if(input.contains("-")) {
      nums= input.split("-");
      double num1 = double.parse(nums[0].trim());
      double num2 = double.parse(nums[1].trim());
      result = num1-num2;
    }else if(input.contains("%")) {
      nums= input.split("%");
      double num1 = double.parse(nums[0].trim());
      double num2 = double.parse(nums[1].trim());
      result = num1%num2;
    }else
      {

      }
    input = result.toString();
    input = input + char.toString();
    print(nums);
  }



  void ifChar(char){
    if(input.contains("*")||input.contains("+")||input.contains("-")||input.contains("/")||input.contains("%")||input.contains("="))
    {
      mySplit(char);
    }else
      {
        input = input + char.toString();
      }
  }
}
