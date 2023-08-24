import 'package:consultation_gp/modules/mentor/incvoices/invoice_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Invoice extends StatelessWidget {
  const Invoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:   Text(
          'Invoices',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.0.sp
          ),
        ),
        elevation: 0.0,
      ),
      body:
      Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: <Color>
                      [
                        Colors.blue,
                        Colors.white10
                      ],
                      tileMode: TileMode.mirror
                  )
              )
          ),
          ListView.builder(
              itemBuilder:(context,index)=> Padding(
                padding:  EdgeInsets.symmetric(horizontal: 28.0.r, vertical: 20.0.r),
                child: Column(
                  children: [
                    Container(
                      height: 175.0.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0.r),
                          color: Colors.white
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(15.0.r),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  '#INV-0010',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0.sp
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  '14-Nov-2020',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0.sp
                                  ),

                                ),
                              ],
                            ),
                            SizedBox(height: 5.h,),
                            Container(
                              height: 1.0.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey[500]
                              ),
                            ),
                            SizedBox(height: 8.h,),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 35.0.r,
                                ),
                                SizedBox(width: 10.0.w,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hassona',
                                      style: TextStyle(
                                          fontSize: 17.0.sp,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      '16',
                                      style: TextStyle(
                                        fontSize: 15.0.sp,
                                      ),
                                    ),

                                  ],
                                ),
                                Spacer(),
                                Text(
                                  '\$420',
                                  style: TextStyle(
                                      fontSize: 20.0.sp,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 37.0.h,
                                  child: ElevatedButton.icon(
                                    onPressed: ()
                                    {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>InvoiceView()));
                                    },
                                    icon: Icon(Icons.remove_red_eye_rounded),
                                    label: Text('View',
                                      style: TextStyle(
                                          fontSize: 15.0.sp
                                      ),),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green[300],
                                      elevation: 0.0,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.0.w),
                                Container(
                                  height: 37.0.h,
                                  child: ElevatedButton.icon(
                                    onPressed: (){},
                                    icon: Icon(Icons.print),
                                    label: Text('Print',
                                      style: TextStyle(
                                          fontSize: 15.0.sp
                                      ),),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blue[300],
                                      elevation: 0.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              itemCount: 10,
          ),
        ],
      ),
    );
  }
}
