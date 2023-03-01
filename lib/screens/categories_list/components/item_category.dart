import 'package:flutter/material.dart';

class ItemCategory extends StatefulWidget {
  const ItemCategory({Key? key}) : super(key: key);

  @override
  State<ItemCategory> createState() => _ItemCategoryState();
}

class _ItemCategoryState extends State<ItemCategory> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        isSelected = !isSelected;
        setState(() {

        });
      },
      child: Container(
        height: 100,
        width: 354,
        margin: EdgeInsetsDirectional.only(bottom: 20,start: 17,end: 17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Color(0xff7B7B7B),
                borderRadius: BorderRadius.circular(6)
              ),
            ),
            SizedBox(width: 24,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: isSelected?MainAxisAlignment.start:MainAxisAlignment.center,
                children: [
                  if(isSelected == true)
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 10,end: 10),
                    child: Align(alignment: AlignmentDirectional.topEnd,child: Icon(Icons.check,color: Color(0xff516E00),)),
                  ),
                  SizedBox(height: 4,),
                  Text("Category name",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  SizedBox(height: 4,),
                  Text("2140 Items",style: TextStyle(fontSize: 13,fontWeight: FontWeight.normal,color: Color(0xff353636)),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
