import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:consultation_gp/layout/mentor/mentor_cubit/mentor_cubit.dart';
import 'package:consultation_gp/layout/mentor/mentor_cubit/mentor_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleTimings extends StatelessWidget {
  ScheduleTimings({Key? key}) : super(key: key);

  var fromController=TextEditingController();
  var toController=TextEditingController();

  Color cont =Colors.white;
  List <String> days=
  [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat'
  ];

  List<String> day=
  [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MentorCubit,ConsultStates>(
      listener: (context,state){},
      builder: (context,state)=>ConditionalBuilder
        (
        condition: MentorCubit.get(context).getTimesModel !=null,
        builder: (context)=>Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.menu,size: 33.0,),
              onPressed: () {  },
            ),
            title:  const Text(
              '            Schedule Timing',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0
              ),
            ),
            elevation: 0.0,
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
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select A Day',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),

                    ),
                    SizedBox(height: 20.0,),
                    Container(
                      height: 105.0,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder:(context,index)=>
                            GestureDetector(
                              child: Container(
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: MentorCubit.get(context).iDay==index?Colors.blue:Colors.white
                                ),
                                child:Center(
                                  child: Text(
                                    days[index],
                                    style: TextStyle(
                                        color: MentorCubit.get(context).iDay==index?Colors.white:Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0
                                    ),
                                  ),
                                ),
                              ),
                              onTap: ()
                              {
                                MentorCubit.get(context).daySelection(index);
                                MentorCubit.get(context).getTimes();
                              },
                            ),
                        separatorBuilder:(context,index)=>SizedBox(width: 10),
                        itemCount:7 ,
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Time Slots - ${day[MentorCubit.get(context).iDay]}',
                          style:TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.grey[700]
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: (){
                            showDialog(context: context, builder: (context) => AlertDialog(
                              actions: [
                                TextButton(
                                    onPressed: ()
                                    {
                                      MentorCubit.get(context).storeTimes
                                        (
                                          from: fromController.text.trim(),
                                          to: toController.text.trim()
                                      );
                                    },
                                    child: Text("Save"))
                              ],
                              content: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text('from'),
                                        SizedBox(height: 10.0,),
                                        TextFormField(
                                          keyboardType: TextInputType.datetime,
                                          validator: (value) {
                                            if(value!.isEmpty)
                                            {
                                              return "Please enter your Skills";
                                            }
                                            return null;
                                          },
                                          controller: fromController,
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(),
                                            hintText: '04:30',
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 20.0,),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text('to'),
                                        SizedBox(height: 10.0,),
                                        TextFormField(
                                          keyboardType: TextInputType.datetime,
                                          validator: (value) {
                                            if(value!.isEmpty)
                                            {
                                              return "Please enter your Skills";
                                            }
                                            return null;
                                          },
                                          controller: toController,
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(),
                                            hintText: '09:30',
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),);
                          },
                          label: Text('Edit',
                            style: TextStyle(
                                color:Colors.blue,
                                fontSize: 17
                            ),
                          ),
                          icon: Icon(
                              Icons.edit,
                              color:Colors.blue
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Expanded(
                      child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1/0.25,
                          children: List.generate(MentorCubit.get(context).getTimesModel!.data!.length, (index) => TimeSlot(time: '${MentorCubit.get(context).getTimesModel!.data![index].from!} - ${MentorCubit.get(context).getTimesModel!.data![index].to!}')
                          )


                      ),
                    )
                  ],
                ),
              )
            ],
          ),

        ),
        fallback: (context)=>Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.menu,size: 33.0,),
              onPressed: () {  },
            ),
            title:  const Text(
              '            Schedule Timing',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0
              ),
            ),
            elevation: 0.0,
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
              CircularProgressIndicator(
                color: Colors.blue,
              )
            ],
          ),

        ),
      )

    );
  }
}





class TimeSlot extends StatelessWidget {
  TimeSlot({Key? key,required this.time}) : super(key: key);
  late String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      width: 20.0,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(time,style: TextStyle(color: Colors.white),),
          InkWell(
            child: Icon(Icons.cancel_outlined,color: Colors.white,),
            onTap: ()
            {
             // MentorCubit.get(context).deleteTime(timeID:MentorCubit.get(context).getTimesModel!.data![id] );
            },

          ),
        ],
      ),
    );
  }
}
