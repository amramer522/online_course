class OrderModel
{
  int orderNumber,color;
  String date,time,statusOrder;
  double price;

  OrderModel({
        required this.orderNumber,required  this.date,required this.color,
        required  this.time,required  this.statusOrder,required  this.price});
}