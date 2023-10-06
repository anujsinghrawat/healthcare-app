import 'bloc/schedule_tab_container_bloc.dart';
import 'models/schedule_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/core/app_export.dart';
import 'package:health_care_app/presentation/schedule_page/schedule_page.dart';
import 'package:health_care_app/widgets/app_bar/appbar_title.dart';
import 'package:health_care_app/widgets/app_bar/custom_app_bar.dart';
import 'package:health_care_app/widgets/custom_bottom_bar.dart';

class ScheduleTabContainerScreen extends StatefulWidget {
  const ScheduleTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  ScheduleTabContainerScreenState createState() =>
      ScheduleTabContainerScreenState();
  static Widget builder(BuildContext context) {
    return BlocProvider<ScheduleTabContainerBloc>(
      create: (context) => ScheduleTabContainerBloc(ScheduleTabContainerState(
        scheduleTabContainerModelObj: ScheduleTabContainerModel(),
      ))
        ..add(ScheduleTabContainerInitialEvent()),
      child: ScheduleTabContainerScreen(),
    );
  }
}

class ScheduleTabContainerScreenState extends State<ScheduleTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<ScheduleTabContainerBloc, ScheduleTabContainerState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  SizedBox(height: 20.v),
                  _buildTabview(context),
                  SizedBox(
                    height: 603.v,
                    child: TabBarView(
                      controller: tabviewController,
                      children: [
                        SchedulePage.builder(context),
                        SchedulePage.builder(context),
                        SchedulePage.builder(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: _buildBottomBar(context),
          ),
        );
      },
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 47.v,
      title: AppbarTitle(
        text: "lbl_schedule".tr,
        margin: EdgeInsets.only(left: 16.h),
      ),
      actions: [
        Container(
          height: 29.v,
          width: 20.h,
          margin: EdgeInsets.fromLTRB(14.h, 12.v, 14.h, 6.v),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgMoreIcon,
                height: 16.v,
                width: 4.h,
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(
                  left: 10.h,
                  top: 13.v,
                  right: 6.h,
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgComponent5,
                height: 20.adaptSize,
                width: 20.adaptSize,
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 9.v),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 46.v,
      width: 335.h,
      decoration: BoxDecoration(
        color: appTheme.gray5001,
        borderRadius: BorderRadius.circular(
          8.h,
        ),
      ),
      child: TabBar(
        controller: tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: theme.colorScheme.primary,
        labelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelColor: theme.colorScheme.onPrimary,
        unselectedLabelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        indicator: BoxDecoration(
          color: appTheme.cyan300,
          borderRadius: BorderRadius.circular(
            8.h,
          ),
        ),
        tabs: [
          Tab(
            child: Text(
              "lbl_upcoming".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_completed".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_canceled".tr,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {},
    );
  }
}
