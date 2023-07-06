import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int groupValue=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* bottomNavigationBar: SizedBox(
        height:150,
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:40,right:50.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children:[
                              Text("Total",style: TextStyle(fontSize: 18,fontFamily: 'Raleway',fontWeight: FontWeight.bold),),
                                                            Text("\R1500",style: TextStyle(fontSize: 18,fontFamily: 'Raleway',fontWeight: FontWeight.bold),)

                         ] 
            
              ),
                
            ),SizedBox(height: 20,),
  ElevatedButton(child: const Text("Checkout"),onPressed: (){},)
          ],
        ),
       
        
        
         ),*/
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Center(
          child: const Text("Checkout",style:TextStyle(
            color:Colors.black,
            
          )),
        ),
      ),

      body: Padding(
      
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          SizedBox(height: 40,),
          Container(
            height: 80,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),
             // color: Colors.amberAccent,
              border: Border.all(width: 2,
                color: Colors.blue,
                            
      
              )
            // width:double.infinity,
            ),
           child:Row(
            children: [
             Radio(groupValue: groupValue, onChanged: (value) {
              setState(() {
                groupValue=value!;
              });
             }, value: 1,),
             SizedBox(height:50),
             Icon(Icons.money_outlined,size: 25,),
                          SizedBox(width:20),
Text("Cash on Delivery",style: TextStyle(fontSize: 18),)
            ],
           ) ,
          ), SizedBox(height: 20,),
          Container(
            height: 80,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),
             // color: Colors.amberAccent,
              border: Border.all(width: 2,
                color: Colors.blue,
                            
      
              )
            // width:double.infinity,
            ),
           child:Row(
            children: [
             Radio(groupValue: groupValue, onChanged: (value) {
              setState(() {
                groupValue=value!;
              });
             }, value: 2,),
             SizedBox(height:50),
             Icon(Icons.credit_card_outlined,size: 25,),
                          SizedBox(width:20),
Text("Pay online",style: TextStyle(fontSize: 18),)
            ],
           ) ,
          )
        ],),
      )
    );
  }
}
/*
class CustomRadio extends StatefulWidget{
      final int value;
      final int groupValue;
      final void Function(int)? onChanged;
      const CustomRadio({Key? key,required this.value, required this.groupValue,required this.onChanged}) : super(key:key);

      @override
      _CustomRadioState createState() => _CustomRadioState();
  
}

class _CustomRadioState extends State<CustomRadio>{
        @override
        Widget build(BuildContext context){
       //   bool selected = (widget.value == widget.groupValue);

          return Radio(groupValue: widget.groupValue, onChanged: (value) {  }, value: widget.value,
            
            
            
            /*
            margin: const EdgeInsets.all(4),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(shape: BoxShape.circle,color: selected?Colors.blue:Colors.orange
            ),child: Icon(Icons.circle,size: 30,color: selected?Colors.deepPurple:Colors.grey,),*/
          );
        }

      }*/
