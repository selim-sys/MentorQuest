import 'package:consultation_gp/models/mentor/get_profile_data_model/get_profile_data_model.dart';
import 'package:consultation_gp/models/mentor/get_times.dart';
import 'package:consultation_gp/models/mentor/mentor_bookings/booking_details_model.dart';
import 'package:consultation_gp/models/mentor/mentor_bookings/mentor_bookings_model.dart';
import 'package:consultation_gp/models/mentor/mentor_dashboard/mentor_dashboard.dart';
import 'package:consultation_gp/models/mentor/mentor_plans/mentor_plans_model.dart';
import 'package:consultation_gp/models/mentor/mentor_reviews/mentor_reviews_model.dart';
import 'package:consultation_gp/models/mentor/mentor_times_model/mentor_times_model.dart';
import 'package:consultation_gp/models/mentor/payment_info/payment_info_model.dart';
import 'package:consultation_gp/models/mentor/profile_setup_model/profile_setup_model.dart';
import 'package:consultation_gp/models/mentor_appointments/mentor_appointments_model.dart';

abstract class ConsultStates{}

class ConsultInitialState extends ConsultStates{}

class ConsultLoadingState extends ConsultStates{}

class ConsultErrorState extends ConsultStates{}

class ConsultSuccessState extends ConsultStates{}


class ChangeBottomNavBarState extends ConsultStates{}

class ChangePinIconState extends ConsultStates{}

class ImagePickerSuccessState extends ConsultStates{}

class PostImageLoadingState extends ConsultStates{}

class PostImageSuccessState extends ConsultStates{}

class PostImageErrorState extends ConsultStates{}


class DatePickerSuccessState extends ConsultStates{}

class GenderSuccessState extends ConsultStates{}

class CategorySuccessState extends ConsultStates{}

class ExperienceSuccessState extends ConsultStates{}

class YearsSuccessState extends ConsultStates{}

class RefuseReasonSuccessState extends ConsultStates{}


class ProfileSetupLoadingState extends ConsultStates{}

class ProfileSetupErrorState extends ConsultStates
{
  /*final String error;

  ProfileSetupErrorState(this.error);*/
}

class ProfileSetupSuccessState extends ConsultStates
{
  final ProfileSetupModel profileSetupModel;

  ProfileSetupSuccessState(this.profileSetupModel);

}

class DaySelectionState extends ConsultStates{}


class StoreTimesLoadingState extends ConsultStates{}

class StoreTimesErrorState extends ConsultStates
{
  /*final String error;

  ProfileSetupErrorState(this.error);*/
}

class StoreTimesSuccessState extends ConsultStates {
  final MentorStoreTimesModel storeTimesModel;

  StoreTimesSuccessState(this.storeTimesModel);
}

class GetTimesLoadingState extends ConsultStates{}

class GetTimesErrorState extends ConsultStates
{
  /*final String error;

  ProfileSetupErrorState(this.error);*/
}

class GetTimesSuccessState extends ConsultStates {
  final MentorGetTimesModel getTimesModel;

  GetTimesSuccessState(this.getTimesModel);
}

class DeleteTimesLoadingState extends ConsultStates{}

class DeleteTimesErrorState extends ConsultStates
{
  /*final String error;

  ProfileSetupErrorState(this.error);*/
}

class DeleteTimesSuccessState extends ConsultStates {
  final MentorGetTimesModel getTimesModel;

  DeleteTimesSuccessState(this.getTimesModel);
}


class GetProfileDataLoadingState extends ConsultStates{}

class GetProfileDataErrorState extends ConsultStates
{
  /*final String error;

  ProfileSetupErrorState(this.error);*/
}

class GetProfileDataSuccessState extends ConsultStates {
  final GetProfileDataModel getProfileDataModel;

  GetProfileDataSuccessState(this.getProfileDataModel);
}


class MentorDashboardLoadingState extends ConsultStates{}

class MentorDashboardErrorState extends ConsultStates
{
  /*final String error;

  ProfileSetupErrorState(this.error);*/
}

class MentorDashboardSuccessState extends ConsultStates {
  final MentorDashboardModel mentorDashboardModel;

  MentorDashboardSuccessState(this.mentorDashboardModel);
}


class GetReviewsLoadingState extends ConsultStates{}

class GetReviewsErrorState extends ConsultStates
{
  /*final String error;

  ProfileSetupErrorState(this.error);*/
}

class GetReviewsSuccessState extends ConsultStates {
  final MentorReviewsModel reviewsModel;

  GetReviewsSuccessState(this.reviewsModel);
}

class GetBookingsLoadingState extends ConsultStates{}

class GetBookingsErrorState extends ConsultStates
{
  /*final String error;

  ProfileSetupErrorState(this.error);*/
}

class GetBookingsSuccessState extends ConsultStates {
  final MentorBookingsModel bookingsModel;

  GetBookingsSuccessState(this.bookingsModel);
}

class GetBookingDetailsLoadingState extends ConsultStates{}

class GetBookingDetailsErrorState extends ConsultStates
{
  /*final String error;

  ProfileSetupErrorState(this.error);*/
}

class GetBookingDetailsSuccessState extends ConsultStates {
  final BookingDetailsModel bookingDetailsModel;

  GetBookingDetailsSuccessState(this.bookingDetailsModel);
}

class AcceptBookingLoadingState extends ConsultStates{}

class AcceptBookingErrorState extends ConsultStates
{
  /*final String error;

  ProfileSetupErrorState(this.error);*/
}

class AcceptBookingSuccessState extends ConsultStates {}

class CancelBookingLoadingState extends ConsultStates{}

class CancelBookingErrorState extends ConsultStates
{
  /*final String error;

  ProfileSetupErrorState(this.error);*/
}

class CancelBookingSuccessState extends ConsultStates {}


class GetAppointmentsLoadingState extends ConsultStates{}

class GetAppointmentsErrorState extends ConsultStates
{
  /*final String error;

  ProfileSetupErrorState(this.error);*/
}

class GetAppointmentsSuccessState extends ConsultStates {
  final MentorAppointmentsModel appointmentsModel;

  GetAppointmentsSuccessState(this.appointmentsModel);
}


class StandardPriceSuccessState extends ConsultStates{}
class StandardSessionsSuccessState extends ConsultStates{}
class StandardResponseSuccessState extends ConsultStates{}
class StandardChatSuccessState extends ConsultStates{}


class ProPriceSuccessState extends ConsultStates{}
class ProSessionsSuccessState extends ConsultStates{}
class ProResponseSuccessState extends ConsultStates{}
class ProChatSuccessState extends ConsultStates{}


class PerPriceSuccessState extends ConsultStates{}


class StoreStandardPlanLoadingState extends ConsultStates{}
class StoreStandardPlanSuccessState extends ConsultStates{}
class StoreStandardPlanErrorState extends ConsultStates{}

class StoreProPlanLoadingState extends ConsultStates{}
class StoreProPlanSuccessState extends ConsultStates{}
class StoreProPlanErrorState extends ConsultStates{}

class StorePerPlanLoadingState extends ConsultStates{}
class StorePerPlanSuccessState extends ConsultStates{}
class StorePerPlanErrorState extends ConsultStates{}

class GetPlansLoadingState extends ConsultStates{}
class GetPlansSuccessState extends ConsultStates{
  final MentorPlansModel plansModel;

  GetPlansSuccessState(this.plansModel);
}
class GetPlansErrorState extends ConsultStates{}


class PostPaymentLoadingState extends ConsultStates{}
class PostPaymentSuccessState extends ConsultStates{
  final MentorPaymentInfoModel paymentInfoModel;

  PostPaymentSuccessState(this.paymentInfoModel);
}
class PostPaymentErrorState extends ConsultStates
{

}
class CreateMeetingLoadingState extends ConsultStates{}
class CreateMeetingSuccessState extends ConsultStates{}
class CreateMeetingErrorState extends ConsultStates{}