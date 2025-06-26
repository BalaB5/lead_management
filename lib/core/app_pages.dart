// app_pages.dart
import 'package:get/get.dart';

import '../views/screens/add_followup_page.dart';
import '../views/screens/add_lead_page.dart';
import '../views/screens/followups_page.dart';
import '../views/screens/leads_page.dart';
import '../views/screens/today_followups_page.dart';

abstract class Routes {
  static const LEADS = '/leads';
  static const ADD_LEAD = '/add-lead';
  static const LEAD_DETAIL = '/lead-detail';
  static const TODAY_FOLLOWUPS = '/today-followups';
  static const FOLLOWUPS = '/followups';
  static const ADD_FOLLOWUP = '/add-followup';
}

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.LEADS,
      page: () => const LeadsPage(),
    ),
    GetPage(
      name: Routes.ADD_LEAD,
      page: () => const AddLeadPage(),
    ),
    GetPage(
      name: Routes.LEAD_DETAIL,
      page: () => const LeadDetailPage(),
    ),
    GetPage(
      name: Routes.TODAY_FOLLOWUPS,
      page: () => const TodayFollowUpsPage(),
    ),
    GetPage(
      name: Routes.FOLLOWUPS,
      page: () => const FollowUpsPage(),
    ),
    GetPage(
      name: Routes.ADD_FOLLOWUP,
      page: () => const AddFollowUpPage(),
    ),
  ];
}