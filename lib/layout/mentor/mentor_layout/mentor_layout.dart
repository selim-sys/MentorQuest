
import 'package:consultation_gp/layout/mentor/mentor_cubit/mentor_cubit.dart';
import 'package:consultation_gp/layout/mentor/mentor_cubit/mentor_states.dart';
import 'package:consultation_gp/modules/login/login_screen/login.dart';
import 'package:consultation_gp/modules/mentor/schedule_timings/schedule_time.dart';
import 'package:consultation_gp/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MentorLayout extends  StatelessWidget {
  const MentorLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MentorCubit,ConsultStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = MentorCubit.get(context);
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: BottomNavigationBar(
              iconSize: 22.r,
              selectedFontSize: 13.5.sp,
              unselectedFontSize: 12.sp,
              backgroundColor: Colors.grey[100],
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              elevation: 50.0,
              onTap: (index){
                cubit.changeBottomNavIndex(index);
              },
              currentIndex: cubit.currentIndex,
              items: const [
                BottomNavigationBarItem(

                    icon:Icon(Icons.dashboard,),
                    label: 'Dashboard'
                ),
                BottomNavigationBarItem(
                    icon:Icon(Icons.book,),
                    label: 'Appointments'
                ),
                BottomNavigationBarItem(
                    icon:Icon(Icons.file_copy,),
                    label: 'Invoices'
                ),

                BottomNavigationBarItem(
                    icon:Icon(Icons.person,),
                    label: 'Profile'
                ),
                BottomNavigationBarItem(
                    icon:Icon(Icons.settings,),
                    label: 'Settings'
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
