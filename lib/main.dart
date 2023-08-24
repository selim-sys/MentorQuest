  import 'package:consultation_gp/bloc_observer/observer.dart';
import 'package:consultation_gp/layout/mentee/mentee_cubit/mentee_cubit.dart';
import 'package:consultation_gp/layout/mentee/mentee_layout/mentee_layout.dart';
import 'package:consultation_gp/layout/mentor/mentor_cubit/mentor_cubit.dart';
import 'package:consultation_gp/layout/mentor/mentor_layout/mentor_layout.dart';
import 'package:consultation_gp/modules/chat/get-users.dart';
import 'package:consultation_gp/modules/login/forgot_password/forgot_password.dart';
  import 'package:consultation_gp/modules/login/login_screen/login.dart';
import 'package:consultation_gp/modules/mentee/applications/applications.dart';
import 'package:consultation_gp/modules/mentee/booking_steps/appointment_cost/appointment_cost.dart';

import 'package:consultation_gp/modules/mentee/booking_steps/available_times/available_times.dart';
import 'package:consultation_gp/modules/mentee/booking_steps/booking_details/booking_details.dart';
import 'package:consultation_gp/modules/mentee/booking_steps/payment_details/payment_details.dart';
import 'package:consultation_gp/modules/mentee/bookings/mentee_bookings.dart';
import 'package:consultation_gp/modules/mentee/favourites/favourites.dart';
  import 'package:consultation_gp/modules/mentee/mentee_profile.dart';
  import 'package:consultation_gp/modules/mentee/mentee_reg/mentee_reg.dart';
import 'package:consultation_gp/modules/mentee/mentor_exploration/all_mentors.dart';
import 'package:consultation_gp/modules/mentee/mentor_exploration/mentor_explore.dart';
import 'package:consultation_gp/modules/mentee/mentor_exploration/search%20_for_mentor.dart';
import 'package:consultation_gp/modules/mentee/profile_setting/mentee_profile_setting.dart';
import 'package:consultation_gp/modules/mentee/review_a_mentor/review.dart';
import 'package:consultation_gp/modules/mentee/view_mentor_profile/view_mentor_profile.dart';
import 'package:consultation_gp/modules/mentor/appointmentes/mentor_appointmentes.dart';
import 'package:consultation_gp/modules/mentor/create_plan/standard_plan.dart';
import 'package:consultation_gp/modules/mentor/dashboard/mentor_dashboard.dart';
import 'package:consultation_gp/modules/mentor/dashboard/refuse%20message/refuse_message.dart';
  import 'package:consultation_gp/modules/mentor/incvoices/invoice_view.dart';
  import 'package:consultation_gp/modules/mentor/incvoices/invoices.dart';
  import 'package:consultation_gp/modules/mentor/mentor_profile/mentor_profile.dart';
  import 'package:consultation_gp/modules/mentor/mentor_profile_setting/profile_setting.dart';
  import 'package:consultation_gp/modules/mentor/mentor_reg/register_screen/mentor_reg.dart';
import 'package:consultation_gp/modules/mentor/payment_details/payment_info.dart';
  import 'package:consultation_gp/modules/mentor/profile_setup/profile_setup.dart';
import 'package:consultation_gp/modules/mentor/reviews/view_reviews.dart';
  import 'package:consultation_gp/modules/mentor/schedule_timings/schedule_time.dart';
  import 'package:consultation_gp/modules/mentor/view%20mentors/all_mentors_view.dart';
  import 'package:consultation_gp/network/local/cache_helper.dart';
  import 'package:consultation_gp/network/remote/dio_helper.dart';
  import 'package:consultation_gp/shared/constants.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:get/get.dart';
  import 'modules/chat/chat-screen.dart';
  import 'modules/mentor/dashboard/view_mentee_request/view_mentee_request.dart';



  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = MyBlocObserver();
    DioHelper.init();
    await CacheHelper.init();



    token = CacheHelper.sharedPreferences.getString('token');
    isMentor = CacheHelper.sharedPreferences.getBool('isMentor')??false;


  Widget startScreen;

  if(token!=null)
  {
    if(isMentor)
    {
      startScreen = ExploreMentor();
    }
    else
    {
      startScreen = MentorLayout();
    }
  }
  else
    {
      print (token);
      startScreen = ConsultLogin();
    }


    runApp( MyApp(
      startScreen:startScreen,
    ));


  }

  class MyApp extends StatelessWidget {
      MyApp({Key? key, required this.startScreen,}) : super(key: key);

      Widget startScreen;

      @override
    Widget build(BuildContext context) {


      return MultiBlocProvider(
        providers: [
          BlocProvider<MentorCubit>(
          create: (BuildContext context)=> MentorCubit()..getMentorDashboardData()..getProfileData()..getTimes()..getReviews()..getBookings()..getAppointments()..getPlans()
          ),
          BlocProvider<MenteeCubit>(
            create: (BuildContext context)=> MenteeCubit(),
          )
        ],
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (BuildContext context,child)
            {
              return MaterialApp(
                home: startScreen,
                debugShowCheckedModeBanner: false,
              );
            },
          ),
      );
    }
  }







