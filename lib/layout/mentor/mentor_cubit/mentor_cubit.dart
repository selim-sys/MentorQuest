import 'dart:ffi';
import 'dart:io';

import 'package:consultation_gp/layout/mentor/mentor_cubit/mentor_states.dart';
import 'package:consultation_gp/layout/mentor/mentor_layout/mentor_layout.dart';
import 'package:consultation_gp/models/mentor/get_profile_data_model/get_profile_data_model.dart';
import 'package:consultation_gp/models/mentor/get_times.dart';
import 'package:consultation_gp/models/mentor/mentor_bookings/booking_details_model.dart';
import 'package:consultation_gp/models/mentor/mentor_bookings/mentor_bookings_model.dart';
import 'package:consultation_gp/models/mentor/mentor_create_meeting/mentor_create_meeting.dart';
import 'package:consultation_gp/models/mentor/mentor_dashboard/mentor_dashboard.dart';
import 'package:consultation_gp/models/mentor/mentor_plans/mentor_plans_model.dart';
import 'package:consultation_gp/models/mentor/mentor_reviews/mentor_reviews_model.dart';
import 'package:consultation_gp/models/mentor/mentor_times_model/mentor_times_model.dart';
import 'package:consultation_gp/models/mentor/payment_info/payment_info_model.dart';
import 'package:consultation_gp/models/mentor/profile_setup_model/profile_setup_model.dart';
import 'package:consultation_gp/models/mentor_appointments/mentor_appointments_model.dart';
import 'package:consultation_gp/modules/mentor/appointmentes/mentor_appointmentes.dart';
import 'package:consultation_gp/modules/mentor/create_plan/per_session_plan.dart';
import 'package:consultation_gp/modules/mentor/create_plan/pro_plan.dart';
import 'package:consultation_gp/modules/mentor/dashboard/mentor_dashboard.dart';
import 'package:consultation_gp/modules/mentor/incvoices/invoices.dart';
import 'package:consultation_gp/modules/mentor/mentor_profile/mentor_profile.dart';
import 'package:consultation_gp/modules/mentor/mentor_setting/mentor_settings.dart';
import 'package:consultation_gp/modules/mentor/reviews/view_reviews.dart';
import 'package:consultation_gp/network/local/cache_helper.dart';
import 'package:consultation_gp/network/remote/dio_helper.dart';
import 'package:consultation_gp/shared/constants.dart';
//import 'package:consultation_gp/modules/mentor/reviews/reviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class MentorCubit extends Cubit<ConsultStates> {
  MentorCubit() : super(ConsultInitialState());

  static MentorCubit get(context) => BlocProvider.of(context);



int currentIndex=0;
void changeBottomNavIndex(int index)
{
  currentIndex=index;
  emit(ChangeBottomNavBarState());
}
List<Widget> screens=
[
  Dashboard(),
  Appointments(),
  Invoice(),
  MentorProfile(),
  MentorSettings(),
];




   File? file;
 Future imagePicker()async
{
    final myFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      file = File(myFile!.path) ;
      print(file.toString());
      emit(ImagePickerSuccessState());
}


void postImage()async
{
  emit(PostImageLoadingState());
  var response= await DioHelper.postData(
      url: '/mentor/profile/update-image',
    tkn: CacheHelper.sharedPreferences.getString('token'),
      data:
      {
        'photo':file
      }
  ).then((value)
  {
    print(value.data['message'].toString()+";;;;");
    if(value.data['message']=='updated successfully')
    {
      emit(PostImageSuccessState());
      Fluttertoast.showToast(
          msg:value.data['message'] ,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    else
      {
        emit(PostImageErrorState());
        Fluttertoast.showToast(
            msg:value.data['message'] ,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
  });
}

  DateTime date = DateTime.now();
  String? dateController;
  Future datePicker({
  required BuildContext context
})async {
  DateTime? newDate = await showDatePicker(
  context: context,
  initialDate: date,
  firstDate: DateTime(1950),
  lastDate: DateTime(2100));
  if(newDate == null) return;
  date=newDate;
  print(date);
  dateController="${date.year}/${date.month}/${date.day}";
  print(dateController);
  emit(DatePickerSuccessState());

}


  var selectedGender;
void genderDropDown({
   Object? value
})
{
  selectedGender=value;
  emit(GenderSuccessState());
}


  var selectedCategory;
  void categoryDropDown({
    Object? value
  })
  {
    selectedCategory=value;
    emit(CategorySuccessState());

  }


  var selectedExperience;
  void experienceDropDown({
    Object? value
  })
  {
    selectedExperience=value;
    emit(ExperienceSuccessState());

  }


  var selectedYears;
  void yearsDropDown({
    Object? value
  })
  {
    selectedYears=value;
    emit(YearsSuccessState());

  }




  void mentorLogOut()
  {
    CacheHelper.sharedPreferences.remove('job_title');
    CacheHelper.sharedPreferences.remove('company');
    CacheHelper.sharedPreferences.remove('category');
    CacheHelper.sharedPreferences.remove('skills');
    CacheHelper.sharedPreferences.remove('years_of_experience');
    CacheHelper.sharedPreferences.remove('gender');
    CacheHelper.sharedPreferences.remove('country');
    CacheHelper.sharedPreferences.remove('city');
    CacheHelper.sharedPreferences.remove('address');
    CacheHelper.sharedPreferences.remove('zip_code');
    CacheHelper.sharedPreferences.remove('birth_date');
    CacheHelper.sharedPreferences.remove('bio');
    CacheHelper.sharedPreferences.remove('experience');
  }



  late ProfileSetupModel profileSetupModel;

  void profileSetup({
    required String jobTitle,
    required String company,
    required String skills,
    required String country,
    required String city,
    required String address,
    required String zipCode,
    required String bio,
    required BuildContext context

  })async
  {
    emit(ProfileSetupLoadingState());
    var response=
    await DioHelper.postData(
        url: '/mentor/profile',
        tkn: CacheHelper.sharedPreferences.getString('token'),
        data:
        {
          'job_title': jobTitle,
          'company':company,
          'category':selectedCategory.toString(),
          'skills':skills,
          'years_of_experience':selectedYears.toString(),
          'gender':selectedGender.toString(),
          'country':country,
          'city':city,
          'address':address,
          'zip_code':zipCode,
          'birth_date':dateController,
          'bio':bio,
          'experience':selectedExperience.toString(),
        }).then((value)
    {
      profileSetupModel=ProfileSetupModel.fromJson(value.data);
      if(profileSetupModel.success==true)
      {
        emit(ProfileSetupSuccessState(profileSetupModel));
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MentorLayout(),));
      }
      else if(profileSetupModel.success==false)
      {
      emit(ProfileSetupErrorState());
      Map<String,dynamic> errors = value.data['errors'];
      errors.forEach((key, value) {
      for (int i = 0; i < value.length; i++) {
      Fluttertoast.showToast(
      msg: value[i],
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
      );
      }
      });
      }
    });

  }

  late GetProfileDataModel getProfileDataModel;
  void getProfileData()async
  {
    emit(GetProfileDataLoadingState());
    await DioHelper.getData(
        url: '/mentor/profile',
        tkn: CacheHelper.sharedPreferences.getString('token'),
    ).then((value)
    {
      getProfileDataModel=GetProfileDataModel.fromJson(value.data);
      if(getProfileDataModel.data!=null)
      {
        saveProfileData(model: getProfileDataModel).then((value) =>
        {
          getSavedProfileData().then((value) =>
          {
            emit(GetProfileDataSuccessState(getProfileDataModel))
          })
        });
      }
    }).catchError((error)
    {
      emit(GetProfileDataErrorState());
      print(error.toString());
    });

  }

  Future<void> saveProfileData({
  required GetProfileDataModel model
})async
  {
    await CacheHelper.sharedPreferences.setString( 'job_title',  getProfileDataModel.data!.jobTitle.toString());
    await CacheHelper.sharedPreferences.setString( 'company',  getProfileDataModel.data!.company.toString());
    await CacheHelper.sharedPreferences.setString( 'category',  getProfileDataModel.data!.category.toString());
    await CacheHelper.sharedPreferences.setString( 'skills',  getProfileDataModel.data!.skills.toString());
    await CacheHelper.sharedPreferences.setInt( 'years_of_experience',  getProfileDataModel.data!.yearsOfExperience!);
    await CacheHelper.sharedPreferences.setString( 'gender',  getProfileDataModel.data!.gender.toString());
    await CacheHelper.sharedPreferences.setString( 'country',  getProfileDataModel.data!.country.toString());
    await CacheHelper.sharedPreferences.setString( 'city',  getProfileDataModel.data!.city.toString());
    await CacheHelper.sharedPreferences.setString( 'address',  getProfileDataModel.data!.address.toString());
    await CacheHelper.sharedPreferences.setString( 'zip_code',  getProfileDataModel.data!.zipCode.toString());
    await CacheHelper.sharedPreferences.setString( 'birth_date',  getProfileDataModel.data!.birthDate.toString());
    await CacheHelper.sharedPreferences.setString( 'bio',  getProfileDataModel.data!.bio.toString());
    await CacheHelper.sharedPreferences.setString( 'experience',  getProfileDataModel.data!.experience.toString());
  }
  GetProfileData? mentorProfileModel;
  Future<void> getSavedProfileData()async
  {
    mentorProfileModel=await GetProfileData(
        address:'${CacheHelper.sharedPreferences.getString( 'address')}',
      bio: CacheHelper.sharedPreferences.getString( 'bio').toString(),
      birthDate: CacheHelper.sharedPreferences.getString( 'birth_date').toString(),
      category: CacheHelper.sharedPreferences.getString( 'category').toString(),
      city: CacheHelper.sharedPreferences.getString( 'city').toString(),
      company: CacheHelper.sharedPreferences.getString( 'company').toString(),
      country: CacheHelper.sharedPreferences.getString( 'country').toString(),
      experience: CacheHelper.sharedPreferences.getString( 'experience').toString(),
      gender:  CacheHelper.sharedPreferences.getString( 'gender').toString(),
      jobTitle: CacheHelper.sharedPreferences.getString( 'job_title').toString(),
      skills: CacheHelper.sharedPreferences.getString( 'skills').toString(),
      yearsOfExperience: CacheHelper.sharedPreferences.getInt( 'years_of_experience'),
      zipCode: CacheHelper.sharedPreferences.getString( 'zip_code').toString()
    );
     print(mentorProfileModel.toString());
  }


  int iDay =0 ;
  String selectedDay='su';
  void daySelection(int index)
  {
    iDay=index;
    print(iDay);
    switch(iDay) {
      case 0: { selectedDay='su'; }
      break;

      case 1: {  selectedDay='mo' ;}
      break;

      case 2: {  selectedDay = 'tu' ;}
      break;

      case 3: {  selectedDay = 'we' ;}
      break;

      case 4: {  selectedDay = 'th' ;}
      break;

      case 5: {  selectedDay = 'fr'; }
      break;

      case 6: {  selectedDay = 'sa' ;}
      break;
    }
    print(selectedDay);
    emit(DaySelectionState());
  }




  late MentorStoreTimesModel storeTimesModel;
  void storeTimes({
    required String from,
    required String to,

  })
  {
    emit(StoreTimesLoadingState());

    DioHelper.postData(
        url: '/mentor/times',
        tkn: CacheHelper.sharedPreferences.getString('token'),
        data:
        {
          'day': selectedDay.toString().trim(),
          'from':from,
          'to':to

        }).then((value)
    {
      storeTimesModel=MentorStoreTimesModel.fromJson(value.data);
      if(storeTimesModel.success==true)
      {
        getTimes();
        //emit(StoreTimesSuccessState(storeTimesModel));
        Fluttertoast.showToast(
            msg: storeTimesModel.message!,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
      else if(storeTimesModel.success==false) {
        emit(StoreTimesErrorState());
        Fluttertoast.showToast(
            msg: storeTimesModel.message!,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print(storeTimesModel.message);
      }
    });

  }

 MentorGetTimesModel? getTimesModel;
  void getTimes()async
  {
    getTimesModel = null;
    emit(GetTimesLoadingState());
    await DioHelper.getData(
      url: '/mentor/times',
      tkn: CacheHelper.sharedPreferences.getString('token'),
        query: {
          'day':selectedDay
        }
    ).then((value)
    {
      getTimesModel=MentorGetTimesModel.fromJson(value.data);
      print(getTimesModel!.data![0].day);
      print(getTimesModel!.data!.length);
      emit(GetTimesSuccessState(getTimesModel!));
    }).catchError((error)
    {
      emit(GetTimesErrorState());
      print(error.toString());
    });

  }

  void deleteTime({
    required int timeID,
  })
  {
    emit(DeleteTimesLoadingState());

    DioHelper.deleteData(
        url: '/mentor/times/$timeID',
        tkn: CacheHelper.sharedPreferences.getString('token'),
        ).then((value)
    {
      MentorGetTimesModel deleteTimesModel=MentorGetTimesModel.fromJson(value.data);
      if(deleteTimesModel.success==true)
      {
        getTimes();
       // emit(DeleteTimesSuccessState(deleteTimesModel));
        Fluttertoast.showToast(
            msg: deleteTimesModel.message!,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );

      }
      else if(deleteTimesModel.success==false) {
        emit(DeleteTimesErrorState());
        Fluttertoast.showToast(
            msg: deleteTimesModel.message!,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );

      }
    });

  }


   MentorDashboardModel? mentorDashboardModel;
  void getMentorDashboardData()async
  {

    emit(MentorDashboardLoadingState());
    await DioHelper.getData(
      url: '/mentor/home',
      tkn: CacheHelper.sharedPreferences.getString('token'),
    ).then((value)
    {
      mentorDashboardModel=MentorDashboardModel.fromJson(value.data);
      print(mentorDashboardModel);
      if(mentorDashboardModel!.data!=null)
      {
        saveMentorDashboardData(model: mentorDashboardModel!).then((value) =>
        {
          getSavedDashboardData().then((value) =>
          {
            emit(MentorDashboardSuccessState(mentorDashboardModel!)),
            //print(dashboardModel)
          })
        });
      }
    }).catchError((error)
    {
      emit(MentorDashboardErrorState());
      print(error.toString());
      //print(dashboardModel);

    });
  }


  Future<void> saveMentorDashboardData({
    required MentorDashboardModel model
  })async
  {
    await CacheHelper.sharedPreferences.setString( 'name', mentorDashboardModel!.data!.personalCard!.name.toString() );
    await CacheHelper.sharedPreferences.setString( 'photo',  mentorDashboardModel!.data!.personalCard!.photo.toString());
    await CacheHelper.sharedPreferences.setDouble( 'progress',  mentorDashboardModel!.data!.personalCard!.progress!.toDouble());
    await CacheHelper.sharedPreferences.setDouble( 'rating',  mentorDashboardModel!.data!.personalCard!.rating!.toDouble());
  }


  PersonalCard? dashboardModel;
  Future<void> getSavedDashboardData()async
  {
    dashboardModel=await PersonalCard(
      name: CacheHelper.sharedPreferences.getString( 'name').toString(),
      photo: CacheHelper.sharedPreferences.getString( 'photo').toString(),
      progress: CacheHelper.sharedPreferences.getDouble( 'progress'),
      rating: CacheHelper.sharedPreferences.getDouble( 'rating'),

    );
    print(mentorProfileModel.toString());
  }

  MentorReviewsModel? reviewsModel;
  void getReviews()async
  {
    emit(GetReviewsLoadingState());
    await DioHelper.getData(
        url: '/mentor/reviews',
        tkn: CacheHelper.sharedPreferences.getString('token'),
    ).then((value)
    {
      reviewsModel=MentorReviewsModel.fromJson(value.data);
      emit(GetReviewsSuccessState(reviewsModel!));
    }).catchError((error)
    {
      emit(GetReviewsErrorState());
      print(error.toString());
    });

  }

  MentorBookingsModel? bookingsModel;
  void getBookings()async
  {

    emit(GetBookingsLoadingState());
    await DioHelper.getData(
      url: '/mentor/bookings',
      tkn: CacheHelper.sharedPreferences.getString('token'),
        query: {
          'status':'pending'
        }
    ).then((value)
    {
      bookingsModel=MentorBookingsModel.fromJson(value.data);
      emit(GetBookingsSuccessState(bookingsModel!));
    }).catchError((error)
    {
      emit(GetBookingsErrorState());
      print(error.toString());
    });

  }

  BookingDetailsModel? bookingDetailsModel;
  void getBookingDetails({required int bookingId})async
  {

    emit(GetBookingDetailsLoadingState());
    await DioHelper.getData(
      url: '/mentor/bookings/$bookingId',
      tkn: CacheHelper.sharedPreferences.getString('token'),
    ).then((value)
    {
      bookingDetailsModel=BookingDetailsModel.fromJson(value.data);
      emit(GetBookingDetailsSuccessState(bookingDetailsModel!));
    }).catchError((error)
    {
      emit(GetBookingDetailsErrorState());
      print(error.toString());
    });

  }


  void acceptBooking({
  required int acceptedBookingId
})
  {
    emit(AcceptBookingLoadingState());
    DioHelper.postData(
        url: '/mentor/bookings/$acceptedBookingId/accept',
      tkn: CacheHelper.sharedPreferences.getString('token'),
    ).then((value)
    {
      if (value.data['message']=='success')
      {
        emit(AcceptBookingSuccessState());
        Fluttertoast.showToast(
            msg: 'Accepted successfully now you can see it in appointments',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
      else
        {
          emit(AcceptBookingErrorState());
          Fluttertoast.showToast(
              msg: 'Unable to accept',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
    });
    getBookings();
  }

  List<String> listOfReasons =[
    "Sorry, i am busy",
    "I can't help you with your problem",
    "choose an available time ,please",
    "Send me later",
  ];
  var selectedReason;
  void refuseReasonDropDown({
    Object? value
  })
  {
    selectedReason=value;
    emit(RefuseReasonSuccessState());

  }

  void cancelBooking({
    required int cancelledBookingId,
  })
  {
    emit(CancelBookingLoadingState());
    DioHelper.postData(
      url: '/mentor/bookings/$cancelledBookingId/cancell',
      tkn: CacheHelper.sharedPreferences.getString('token'),
      data:
      {
        'cancell_reason':selectedReason.toString(),
      }
    ).then((value)
    {
      if (value.data['message']=='success')
      {
       // emit(CancelBookingSuccessState());
        Fluttertoast.showToast(
            msg: 'Cancelled successfully',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
        selectedReason=null;
        getBookings();
      }
      else
      {
        emit(CancelBookingErrorState());

        Fluttertoast.showToast(
            msg: 'Unable to cancel',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    });

  }

  MentorAppointmentsModel? appointmentsModel;
  void getAppointments()async
  {

    emit(GetAppointmentsLoadingState());
    await DioHelper.getData(
      url: '/mentor/bookings',
      tkn: CacheHelper.sharedPreferences.getString('token'),
        query: {
          'status':'approved'
        }
    ).then((value)
    {
      appointmentsModel=MentorAppointmentsModel.fromJson(value.data);
      emit(GetAppointmentsSuccessState(appointmentsModel!));
    }).catchError((error)
    {
      emit(GetAppointmentsErrorState());
      print(error.toString());
    });

  }

  /*bool isPinned=false;
  int iPin =0;
  void changePinIcon(int index)
  {
    iPin=index;
    isPinned=!isPinned;
    emit((ChangePinIconState()));
    print(isPinned);
    print(iPin);
  }*/


  List<int> prices =[
    100,
    150,
    200,
    250,
    300,
    350,
    400,
    450,
    500,
    550,
    600
  ];
  List<int> numberOfSessions =[
    1,
    2,
    3,
    4,
    5,
  ];
  List<String> responseTimes =[
    'Within 12 Hour',
    'Within 24 Hour',
  ];




  var selectedPrice;
  void standardPriceDropDown({
    Object? value
  })
  {
    selectedPrice=value;
    emit(StandardPriceSuccessState());
  }

  var selectedNumberOfSessions;
  void standardSessionsDropDown({
    Object? value
  })
  {
    selectedNumberOfSessions=value;
    emit(StandardSessionsSuccessState());
  }

  var selectedResponseTime;
  void standardResponseDropDown({
    Object? value
  })
  {
    selectedResponseTime=value;
    emit(StandardResponseSuccessState());
  }

  var selectedPriceProPlan ;
  void proPriceDropDown({
    Object? value
  })
  {
    selectedPriceProPlan=value;
    emit(ProPriceSuccessState());
  }
  var selectedNumberOfSessionsProPlan;
  void proSessionsDropDown({
    Object? value
  })
  {
    selectedNumberOfSessionsProPlan=value;
    emit(ProSessionsSuccessState());
  }
  var selectedResponseTimeProPlan;
  void proResponseDropDown({
    Object? value
  })
  {
    selectedResponseTimeProPlan=value;
    emit(ProResponseSuccessState());
  }

  var selectedPricePerSession;
  void perPriceDropDown({
    Object? value
  })
  {
    selectedPricePerSession=value;
    emit(PerPriceSuccessState());
  }
  var selectedStandardChat;
  void standardChatDropDown({
    Object? value
  })
  {
    selectedStandardChat=value;
    emit(StandardChatSuccessState());
  }

  var selectedProChat;
  void ProChatDropDown({
    Object? value
  })
  {
    selectedProChat=value;
    emit(ProChatSuccessState());
  }

  List<String> standardChatList =[
    '0 ',
    '1'
  ];

  List<String> proChatList =[
    '0',
    '1'
  ];





void storeStandardPlan({
  required String planDesc,
  required BuildContext context
})
{
  emit(StoreStandardPlanLoadingState());
  DioHelper.postData(
      url: '/mentor/plans',
    data: {
        'type':'standard',
      'price': selectedPrice,
      'no_sessions':selectedNumberOfSessions.toString(),
      'response_time':selectedResponseTime,
      'chat':selectedStandardChat,
      'description':planDesc
    },
    tkn: CacheHelper.sharedPreferences.getString('token'),

  ).then((value)
  {
    if (value.data['message']=='success')
    {
      emit(StoreStandardPlanSuccessState());
      Fluttertoast.showToast(
          msg: 'Added successfully',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => ProPlan(),));
    }
    else
    {
      emit(StoreStandardPlanErrorState());
      Fluttertoast.showToast(
          msg: '${value.data}',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      print(value.data);
    }
  });
}


  void storeProPlan({
    required String planDesc,
    required BuildContext context
  })
  {
    emit(StoreProPlanLoadingState());
    DioHelper.postData(
        url: '/mentor/plans',
        data: {
          'type':'pro',
          'price':selectedPriceProPlan,
          'no_sessions':selectedNumberOfSessionsProPlan,
          'response_time':selectedResponseTimeProPlan,
          'chat':selectedProChat.toString(),
          'description':planDesc
        },
      tkn: CacheHelper.sharedPreferences.getString('token'),
    ).then((value)
    {
      if (value.data['message']=='success')
      {
        emit(StoreProPlanSuccessState());
        Fluttertoast.showToast(
            msg: 'Added successfully',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => PerSessionPlan(),));
      }
      else
      {
        emit(StoreProPlanErrorState());
        Fluttertoast.showToast(
            msg: 'Unable to add',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    });
  }

  void storePerPlan({
    required String planDesc,
    required BuildContext context
  })
  {
    emit(StorePerPlanLoadingState());
    DioHelper.postData(
        url: '/mentor/plans',
        tkn: CacheHelper.sharedPreferences.getString('token'),
        data: {
          'type':'per_session',
          'price':selectedPricePerSession,
          'no_sessions':'3',
          'response_time':'2',
          /*'chat':apiIsChat3,*/
          'description':planDesc
        },
    ).then((value)
    {
      if (value.data['message']=='success')
      {
        emit(StorePerPlanSuccessState());
        Fluttertoast.showToast(
            msg: 'Added successfully',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
        getPlans();
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MentorLayout(),));
      }
      else
      {
        emit(StorePerPlanErrorState());
        Fluttertoast.showToast(
            msg: 'Unable to add',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    });
  }


  MentorPlansModel? plansModel;
  void getPlans()async
  {
    emit(GetPlansLoadingState());
    await DioHelper.getData(
        url: '/mentor/plans',
        tkn: CacheHelper.sharedPreferences.getString('token'),
    ).then((value)
    {
      plansModel=MentorPlansModel.fromJson(value.data);
      emit(GetPlansSuccessState(plansModel!));
    }).catchError((error)
    {
      emit(GetPlansErrorState());
      print(error.toString());
    });

  }
MentorPaymentInfoModel? paymentInfoModel;
void postPaymentInfo({
  required String accHolderName,
  required String routingNumber,
  required String accountNumber,
})
{
  emit(PostPaymentLoadingState());
  DioHelper.postData(
      url: '/mentor/payments',
    tkn: CacheHelper.sharedPreferences.getString('token'),
    data: {
        'holder_name':accHolderName,
      'routing_number':routingNumber,
      'account_number':accountNumber,
    }
  ).then((value)
  {
    paymentInfoModel=MentorPaymentInfoModel.fromJson(value.data);
    if(paymentInfoModel!.success==true)
    {
      emit(PostPaymentSuccessState(paymentInfoModel!));
      Fluttertoast.showToast(
          msg: paymentInfoModel!.message!.toUpperCase(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    else if(paymentInfoModel!.success==false) {
      emit(PostPaymentErrorState());
      Fluttertoast.showToast(
          msg: paymentInfoModel!.message!,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }

  });

  
  
  
  
  
}

MentorCreateMeetingModel? mentorCreateMeetingModel;
  void createMeeting({
    required String sessionTopic,
    required String sessionPassword,
    required int index
  })
  {
    emit(CreateMeetingLoadingState());
    var Response =DioHelper.postData(
        url: '/mentor/meetings',
        tkn: CacheHelper.sharedPreferences.getString('token'),
        data: {
          'topic':sessionTopic,
          'password':sessionTopic,
          'mentee_id':appointmentsModel!.data![index].menteeId,
          'booking_id':appointmentsModel!.data![index].id,
          'start_time':'2032-05-17 11:00:00',
          'duration':40
        }
    ).then((value)
    {
      mentorCreateMeetingModel=MentorCreateMeetingModel.fromJson(value.data);
      if(mentorCreateMeetingModel!.success==true)
      {
        emit(CreateMeetingSuccessState());
        Fluttertoast.showToast(
            msg: mentorCreateMeetingModel!.message!,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
        //show url
      }
      else if(mentorCreateMeetingModel!.success==false) {
        emit(CreateMeetingErrorState());
        print(value.data);
        Fluttertoast.showToast(
            msg: mentorCreateMeetingModel!.message!,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }

    });






  }









}


