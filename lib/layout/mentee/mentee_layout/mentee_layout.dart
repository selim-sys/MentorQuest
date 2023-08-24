import 'package:consultation_gp/layout/mentee/mentee_cubit/mentee_cubit.dart';
import 'package:consultation_gp/layout/mentee/mentee_cubit/mentee_states.dart';
import 'package:consultation_gp/modules/login/login_screen/login.dart';
import 'package:consultation_gp/modules/mentor/schedule_timings/schedule_time.dart';
import 'package:consultation_gp/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenteeLayout extends  StatelessWidget {
  const MenteeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MenteeCubit,MenteeStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = MenteeCubit.get(context);
        return Scaffold(
          body: cubit.menteeScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
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
                  icon:Icon(Icons.home_filled,),
                  label: 'Home'
              ),
              BottomNavigationBarItem(
                  icon:Icon(Icons.request_page,),
                  label: 'Applications'
              ),
              BottomNavigationBarItem(
                  icon:Icon(Icons.book_outlined,),
                  label: 'Bookings'
              ),
              BottomNavigationBarItem(
                  icon:Icon(Icons.star,),
                  label: 'Favourites'
              ),
            ],
          ),
        );
      },
    );
  }
}