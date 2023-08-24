import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvoiceView extends StatelessWidget {
  const InvoiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Center(
        child: Text('Invoice View',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.0.sp
          ),
        ),
      ),
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.blue
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 28.0.r, vertical: 20.0.r),
            child: Container(
              height: double.infinity,
              width: double.infinity,

              decoration: BoxDecoration(borderRadius:BorderRadius.circular(10.0.r),color: Colors.white,),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Text('MentorQuest',style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 22.0.sp

                        ),),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order: #00124',style: TextStyle(fontWeight: FontWeight.w400,
                                fontSize: 17.0.sp)),
                            Text('Issued: 20/07/2019',style: TextStyle(fontWeight: FontWeight.w400,
                                fontSize: 17.0.sp)),
                          ],)
                      ],),
                      SizedBox(height: 23.0.h),
                      Row(children: [
                        Text('Invoice From',style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 17.0.sp)),
                        Spacer(),
                        Text('Invoice To ',style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 17.0.sp)),
                      ],),
                      SizedBox(height: 9.0.h),
                      Row(children: [
                        Text('Darren Elder',style: TextStyle(fontWeight: FontWeight.w400,
                            fontSize: 13.5.sp)),
                        Spacer(),
                        Text('Walter Roberson',style: TextStyle(fontWeight: FontWeight.w400,
                            fontSize: 13.5.sp)),
                      ],),
                      SizedBox(height: 3.0.h),
                      Row(children: [
                        Text('806 Twin Willow Lane, Old',style: TextStyle(fontWeight: FontWeight.w400,
                            fontSize: 13.5.sp)),
                        Spacer(),
                        Text('299 Star Trek Drive, Panama',style: TextStyle(fontWeight: FontWeight.w400,
                            fontSize: 13.5.sp)),
                      ],),
                      SizedBox(height: 3.0.h),
                      Row(children: [
                        Text('Forge,',style: TextStyle(fontWeight: FontWeight.w400,
                            fontSize: 13.5.sp)),
                        Spacer(),
                        Text('City,',style: TextStyle(fontWeight: FontWeight.w400,
                            fontSize: 13.5.sp)),
                      ],),
                      SizedBox(height: 3.0.h),
                      Row(children: [
                        Text('Newyork, USA',style: TextStyle(fontWeight: FontWeight.w400,
                            fontSize: 13.5.sp)),
                        Spacer(),
                        Text('Florida, 32405, USA',style: TextStyle(fontWeight: FontWeight.w400,
                            fontSize: 13.5.sp)),
                      ],),
                      SizedBox(height: 20.0),
                      Text('Payment Method',style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 17.0.sp)),
                      SizedBox(height: 7.0),
                      Text('Debit Card',style: TextStyle(fontWeight: FontWeight.w400,
                          fontSize: 13.5.sp)),
                      SizedBox(height: 4.0),
                      Text('XXXXXXXXXXXX-2541',style: TextStyle(fontWeight: FontWeight.w400,
                          fontSize: 13.5.sp)),
                      SizedBox(height: 4.0),
                      Text('HDFC Bank',style: TextStyle(fontWeight: FontWeight.w400,
                          fontSize: 13.5.sp)),
                      SizedBox(height: 20.0.h),
                      Row(children: [
                        Text('Description',style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 17.0.sp)),
                        Spacer(),
                        Text('Quantity',style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 17.0.sp)),
                        Spacer(),
                        Text('VAT',style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 17.0.sp)),
                        Spacer(),
                        Text('Total ',style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 17.0.sp)),
                      ],),
                      SizedBox(height: 7.0.h),
                      Row(children: [
                        Text('General Consultation',style: TextStyle(fontWeight: FontWeight.w400,
                            fontSize: 13.5.sp)),
                        Spacer(),
                        Text('1',style: TextStyle(fontWeight: FontWeight.w400,
                            fontSize: 13.5.sp)),
                        Spacer(),
                        Text('\$0',style: TextStyle(fontWeight: FontWeight.w400,
                            fontSize: 13.5.sp)),
                        Spacer(),
                        Text('\$100',style: TextStyle(fontWeight: FontWeight.w400,
                            fontSize: 13.5.sp)),
                      ],),
                      SizedBox(height: 7.0.h),
                      Row(children: [
                        Text('Video Call Booking',style: TextStyle(fontWeight: FontWeight.w400,
                            fontSize: 13.5.sp)),
                        Spacer(),
                        Text('    1',style: TextStyle(fontWeight: FontWeight.w400,
                            fontSize: 13.5.sp)),
                        Spacer(),
                        Text('\$0',style: TextStyle(fontWeight: FontWeight.w400,
                            fontSize: 13.5.sp)),
                        Spacer(),
                        Text('\$520',style: TextStyle(fontWeight: FontWeight.w400,
                            fontSize: 13.5.sp)),
                      ],),
                      SizedBox(height: 7.0.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Subtotal',style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 15.sp)),
                          SizedBox(width:130.0.w,),


                          Text('\$350',style: TextStyle(fontWeight: FontWeight.w400,
                              fontSize: 13.5.sp)),

                        ],),
                      SizedBox(height: 7.0.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Discount',style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 15.sp)),
                          SizedBox(width:130.0.w,),


                          Text("-10\%",style: TextStyle(fontWeight: FontWeight.w400,
                              fontSize: 13.5.sp)),

                        ],),
                      SizedBox(height: 7.0.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Total Amout:	',style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 15.sp)),
                          SizedBox(width:100.0.w,),


                          Text("\$315",style: TextStyle(fontWeight: FontWeight.w400,
                              fontSize: 13.5.sp)),

                        ],),
                      SizedBox(height:20.0.h,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Other Information',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0.sp
                            ),
                          ),
                          SizedBox(height: 7.0.h,),
                          Text(' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sed dictum ligula, cursus blandit risus. Maecenas eget metus non tellus dignissim aliquam ut a ex. Maecenas sed vehicula dui, ac suscipit lacus. Sed finibus leo vitae lorem interdum, eu scelerisque tellus fermentum. Curabitur sit amet lacinia lorem. Nullam finibus pellentesque libero ',
                            maxLines: 6,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13.5.sp,
                            ),

                          )
                        ],
                      ),

                    ],),
                ),
              ),


            ),
          ),
        ],
      ),
    );
  }
}
