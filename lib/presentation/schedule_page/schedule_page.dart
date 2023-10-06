import '../schedule_page/widgets/schedule_item_widget.dart';
import 'bloc/schedule_bloc.dart';
import 'models/schedule_item_model.dart';
import 'models/schedule_model.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/core/app_export.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  SchedulePageState createState() => SchedulePageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<ScheduleBloc>(
        create: (context) =>
            ScheduleBloc(ScheduleState(scheduleModelObj: ScheduleModel()))
              ..add(ScheduleInitialEvent()),
        child: SchedulePage());
  }
}

class SchedulePageState extends State<SchedulePage>
    with AutomaticKeepAliveClientMixin<SchedulePage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.white,
                child: _buildSchedule(context))));
  }

  /// Section Widget
  Widget _buildSchedule(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20.h, top: 30.v, right: 20.h),
        child: BlocSelector<ScheduleBloc, ScheduleState, ScheduleModel?>(
            selector: (state) => state.scheduleModelObj,
            builder: (context, scheduleModelObj) {
              return ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 20.v);
                  },
                  itemCount: scheduleModelObj?.scheduleItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    ScheduleItemModel model =
                        scheduleModelObj?.scheduleItemList[index] ??
                            ScheduleItemModel();
                    return ScheduleItemWidget(model, onTapDoctorReviews: () {
                      onTapDoctorReviews(context);
                    }, onTapRecentOrders: () {
                      onTapRecentOrders(context);
                    });
                  });
            }));
  }

  /// Navigates to the signupScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the signupScreen.
  onTapDoctorReviews(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupScreen,
    );
  }

  /// Navigates to the signupScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the signupScreen.
  onTapRecentOrders(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupScreen,
    );
  }
}
