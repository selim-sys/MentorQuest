import 'package:consultation_gp/modules/mentee/booking_steps/appointment_cost/appointment_cost.dart';
import 'package:consultation_gp/modules/mentee/booking_steps/booking_details/booking_details.dart';
import 'package:consultation_gp/modules/mentor/incvoices/invoice_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentDetails extends StatefulWidget {
   PaymentDetails({Key? key}) : super(key: key);

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  @override

  var selectedMethod;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(top: 40.0.h,left: 30.0.w,right: 30.0.w,bottom: 40.0.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 14.0.r,
                        backgroundColor: HexColor('60CD6A'),
                        child: Icon(Icons.check_circle_outline_rounded,size: 25.r,color: Colors.white,),

                      ),
                      SizedBox(height: 5.h,),
                      Text('Appointment',style: TextStyle(fontSize: 14.0.sp,fontWeight: FontWeight.bold,color: HexColor('60CD6A')),)
                    ],
                  ),
                  SizedBox(width:2.0.w ,),
                  Padding(
                    padding:  EdgeInsets.only(bottom: 20.0.h),
                    child: Container(
                      height: 3.0.h,
                      width: 30.0.w,
                      color:HexColor('60CD6A'),
                    ),
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 14.0.r,
                        backgroundColor:HexColor('60CD6A'),
                        child: Icon(Icons.check_circle_outline_rounded,size: 25.r,color: Colors.white,),
                      ),
                      SizedBox(height: 5.h,),
                      Text('Details',style: TextStyle(fontSize: 14.0.sp,fontWeight: FontWeight.bold,color: HexColor('60CD6A'))),
                    ],
                  ),
                  SizedBox(width:2.0.w ,),
                  Padding(
                    padding:  EdgeInsets.only(bottom: 20.0.h),
                    child: Container(
                      height: 3.0.h,
                      width: 30.0.w,
                      color:HexColor('60CD6A'),
                    ),
                  ),
                  SizedBox(width:2.0.w ,),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 14.0.r,
                        backgroundColor:HexColor('60CD6A'),
                        child: Icon(Icons.check_circle_outline_rounded,size: 25.r,color: Colors.white,),
                      ),
                      SizedBox(height: 5.h,),
                      Text('Cost',style: TextStyle(fontSize: 14.0.sp,fontWeight: FontWeight.bold,color: HexColor('60CD6A'))),
                    ],
                  ),
                  SizedBox(width:2.0.w ,),
                  Padding(
                    padding:  EdgeInsets.only(bottom: 20.0.h),
                    child: Container(
                      height: 3.0.h,
                      width: 30.0.w,
                      color: HexColor('60CD6A'),
                    ),
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 14.0.r,
                        backgroundColor: HexColor('60CD6A'),

                      ),
                      SizedBox(height: 5.h,),
                      Text('Payment',style: TextStyle(fontSize: 14.0.sp,fontWeight: FontWeight.bold)),
                    ],
                  ),

                ],
              ),
              SizedBox(height:40.0.h),
              Row(
                children: [
                  Text('Payment Method :',style: TextStyle(fontSize: 18.0.sp),),
                  SizedBox(width: 10.0.w,),
                  DropdownButton(
                    isExpanded: false,
                   borderRadius: BorderRadius.circular(10.0.r),
                    hint: Text('Method'),
                    items: ["Credit Card", "VISA",].map((e) => DropdownMenuItem(child: Text("$e"),value: e,)).toList(),
                    onChanged: (val){
                      setState(() {
                        selectedMethod = val;
                      });
                    },
                    value: selectedMethod,
                  ),
                ],
              ),
              SizedBox(height:20.0.h),
              Text('Card Number:',style: TextStyle(fontSize: 18.0.sp),),
              SizedBox(height:10.0.h),
              TextFormField(
                keyboardType: TextInputType.number,
                validator: (value) {
                  if(value!.isEmpty)
                  {
                    return "Please enter your card number";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                          color: Colors.grey
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                          color: Colors.blue
                      )
                  ),
                  hintText: "1234 5678 9123 4567",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.sp,
                  ),
                ),
              ),
              SizedBox(height:20.0.h),
              Text('Expiry Month:',style: TextStyle(fontSize: 18.0.sp),),
              SizedBox(height:10.0.h),
              TextFormField(
                keyboardType: TextInputType.number,
                validator: (value) {
                  if(value!.isEmpty)
                  {
                    return "Please enter the expiry month";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                          color: Colors.grey
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                          color: Colors.blue
                      )
                  ),
                  hintText: "MM",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.sp,
                  ),
                ),
              ),
              SizedBox(height:20.0.h),
              Text('Expiry Year:',style: TextStyle(fontSize: 18.0.sp),),
              SizedBox(height:10.0.h),
              TextFormField(
                keyboardType: TextInputType.number,
                validator: (value) {
                  if(value!.isEmpty)
                  {
                    return "Please enter the expiry year";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                          color: Colors.grey
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                          color: Colors.blue
                      )
                  ),
                  hintText: "YY",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.sp,
                  ),
                ),
              ),
              SizedBox(height:20.0.h),
              Text('CVV:',style: TextStyle(fontSize: 18.0.sp),),
              SizedBox(height:10.0.h),
              TextFormField(
                keyboardType: TextInputType.number,
                validator: (value) {
                  if(value!.isEmpty)
                  {
                    return "Please enter the CVV";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                          color: Colors.grey
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                          color: Colors.blue
                      )
                  ),
                  hintText: "",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.sp,
                  ),
                ),
              ),
              SizedBox(height:20.0.h),
              Row(
                children: [
                  InkWell(
                    child: Container(
                      width: 100.0.w,
                      height: 45.0.h,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5.0.r)
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_back_ios_outlined,size: 17.0.r,color: Colors.white),
                            SizedBox(width: 5.0.w,),
                            Text('Back',style: TextStyle(color: Colors.white,fontSize: 18.0.sp),),
                          ],


                        ),
                      ),
                    ),
                    onTap: (){ Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => AppointmentCost()));},
                  ),
                  Spacer(),
                  InkWell(
                    child: Container(
                      width: 100.0.w,
                      height: 45.0.h,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5.0.r)
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Confirm',style: TextStyle(color: Colors.white,fontSize: 18.0.sp),),
                            SizedBox(width: 5.0.w,),
                            Icon(Icons.arrow_forward_ios_outlined,size: 17.0.r,color: Colors.white),
                          ],


                        ),
                      ),
                    ),
                    onTap: (){
                      successfulPaymentDialog(context: context);
                    },
                  ),
                ],
              )




            ],
          ),
        ),
      ),
    );
  }
}




Future<dynamic> successfulPaymentDialog({
  required context,

}) => showDialog(
  context: context,
  builder: (context){
    return AlertDialog(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0.r),
      ),
      contentPadding:  EdgeInsets.all(0.0.r),
      content: Container(
        height: 300.h,
        padding: EdgeInsets.all(10.r),
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.check_circle, color: Colors.blue,size: 70.r,),
            Text(
              'Appointment booked successfully',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0.sp,
                fontWeight: FontWeight.bold
              ),),
            Text(
              'Waiting for mentor confirmation',
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 16.0.sp,
                fontWeight: FontWeight.w600
              ),),
            InkWell(
              child: Container(
                width: double.infinity,
                height: 45.0.h,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5.0.r)
                ),
                child: Center(
                  child: Text('View Invoice', style: TextStyle(color: Colors.white,fontSize: 18.0.sp),),
                ),
              ),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => InvoiceView()));
              },
            ),
          ],
        )),
      ),
    );
  },
);


