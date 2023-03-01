import 'package:flutter/material.dart';
import 'package:online_course/core/cache_helper.dart';
import 'package:online_course/core/helper_methods.dart';
import 'package:online_course/screens/my_cart/view.dart';

import 'controller.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = OnBoardingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 30,end: 7),
                  child: Text("Skip"),
                )),
            SizedBox(height: 154,),
            Container(
              width: 309,height: 206,
              child: PageView(
                onPageChanged: (value) {
                  controller.currentPage = value;
                  print("on page ${controller.currentPage}");
                  setState(() {

                  });
                },
                children: List.generate(controller.pages.length, (index) => Image.asset(controller.pages[index].image,width: 309,height: 206,)),
              ),
            ),
            SizedBox(height: 11,),
            Text(controller.pages[controller.currentPage].title,style: TextStyle(color: Color(0xff2F1F2B),fontWeight: FontWeight.bold,fontSize: 25),),
            SizedBox(height: 11,),
            Text(controller.pages[controller.currentPage].description,textAlign: TextAlign.center,style: TextStyle(color: Color(0xff7B7B7B),fontSize: 16),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(controller.pages.length, (index) => Container(
                  height: 9,
                  width: index==controller.currentPage?34:9,
                  margin: const EdgeInsetsDirectional.only(end: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color:  Color(index==controller.currentPage?0xffE14B34:0xffC9C9C9)
                  ),
                )),
              ),
            ),
            ElevatedButton(onPressed: (){
              CacheHelper.saveIfFirstTime();
              navigateTo(page:  MyCartScreen());
            },style: ElevatedButton.styleFrom(
              fixedSize: Size(264,44),
              primary: Colors.black
            ), child: Text(controller.currentPage==2?"Get Started":"Next")),
            SizedBox(height: 133,)
          ],
        ),
      ),
    );
  }
}
