import 'package:consultation_gp/layout/mentee/mentee_cubit/mentee_states.dart';
import 'package:consultation_gp/modules/mentee/applications/applications.dart';
import 'package:consultation_gp/modules/mentee/bookings/mentee_bookings.dart';
import 'package:consultation_gp/modules/mentee/favourites/favourites.dart';
import 'package:consultation_gp/modules/mentee/mentor_exploration/mentor_explore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenteeCubit extends Cubit<MenteeStates> {
  MenteeCubit() : super(MenteeInitialState());

  static MenteeCubit get(context) => BlocProvider.of(context);



  int currentIndex=0;
  void changeBottomNavIndex(int index)
  {
    currentIndex=index;
    emit(MenteeChangeBottomNavBarState());
  }

  List<Widget> menteeScreens=
  [
    ExploreMentor(),
    MenteeApplications(),
    MenteeBookings(),
    Favourites(),
  ];







}