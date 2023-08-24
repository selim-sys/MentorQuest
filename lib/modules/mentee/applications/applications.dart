import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenteeApplications extends StatelessWidget {
  const MenteeApplications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text('Applications',style: TextStyle(fontSize: 24.0.sp,fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: Stack(
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
          Padding(
            padding:  EdgeInsets.only( left: 30.0.r,right: 30.0.r,top: 20.0.r,bottom: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context,index)=>InkWell(
                      child: Stack(
                        children: [
                          Container(
                            height: 125.h,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10.0.r)
                            ),
                          ),
                          Container(
                            height: 120.0.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0.r)
                            ),
                            child: Padding(
                              padding:  EdgeInsets.all(10.0.r),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                            'Hassanien',
                                            style: TextStyle(
                                                fontSize: 17.0.sp,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          SizedBox(height: 3.h,),
                                          Text(
                                            'Software engineer',
                                            style: TextStyle(
                                                fontSize: 15.0.sp,
                                                color: Colors.black
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children:
                                    [
                                      Icon(
                                        Icons.date_range,
                                        size: 25.0.r,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 2.0.w,),
                                      Text('10/2/2022',style: TextStyle(fontSize: 16.0.sp),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: ()
                      {
                        showDialog(context: context, builder: (context) => AlertDialog(
                          content: Text('No response ,yet'),
                          actions: [
                            TextButton(onPressed: (){Navigator.pop(context);}, child: Text("OK")),
                          ],
                        ),);
                      },
                    ),
                    separatorBuilder: (context,index)=>SizedBox(height: 16.0.h,),
                    itemCount: 6,

                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
