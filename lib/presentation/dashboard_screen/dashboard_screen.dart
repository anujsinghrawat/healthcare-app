import '../dashboard_screen/widgets/doctor_item_widget.dart';
import '../dashboard_screen/widgets/eighteen_item_widget.dart';
import 'bloc/dashboard_bloc.dart';
import 'models/dashboard_model.dart';
import 'models/doctor_item_model.dart';
import 'models/eighteen_item_model.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/core/app_export.dart';
import 'package:health_care_app/widgets/app_bar/appbar_title.dart';
import 'package:health_care_app/widgets/app_bar/appbar_trailing_image.dart';
import 'package:health_care_app/widgets/app_bar/custom_app_bar.dart';
import 'package:health_care_app/widgets/custom_bottom_bar.dart';
import 'package:health_care_app/widgets/custom_elevated_button.dart';
import 'package:health_care_app/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<DashboardBloc>(
        create: (context) =>
            DashboardBloc(DashboardState(dashboardModelObj: DashboardModel()))
              ..add(DashboardInitialEvent()),
        child: DashboardScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 18.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(left: 20.h, bottom: 5.v),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(right: 20.h),
                                        child: BlocSelector<
                                                DashboardBloc,
                                                DashboardState,
                                                TextEditingController?>(
                                            selector: (state) =>
                                                state.searchController,
                                            builder:
                                                (context, searchController) {
                                              return CustomSearchView(
                                                  controller: searchController,
                                                  hintText:
                                                      "msg_search_doctor_drugs"
                                                          .tr);
                                            })),
                                    _buildEighteen(context),
                                    _buildOfferBanner(context),
                                    _buildTopDoctorSeeAll(context),
                                    SizedBox(height: 10.v),
                                    _buildDoctor(context),
                                    _buildHealtArticleSee(context),
                                    _buildTwentyFour(context)
                                  ]))))
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 84.v,
        title: AppbarTitle(
            text: "msg_find_your_desire".tr,
            margin: EdgeInsets.only(left: 20.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgLockOnprimary,
              margin: EdgeInsets.fromLTRB(20.h, 14.v, 20.h, 25.v))
        ]);
  }

  /// Section Widget
  Widget _buildEighteen(BuildContext context) {
    return SizedBox(
        height: 91.v,
        child: BlocSelector<DashboardBloc, DashboardState, DashboardModel?>(
            selector: (state) => state.dashboardModelObj,
            builder: (context, dashboardModelObj) {
              return ListView.separated(
                  padding: EdgeInsets.only(top: 20.v, right: 20.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 17.h);
                  },
                  itemCount: dashboardModelObj?.eighteenItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    EighteenItemModel model =
                        dashboardModelObj?.eighteenItemList[index] ??
                            EighteenItemModel();
                    return EighteenItemWidget(model, onTapBtnUser: () {
                      onTapBtnUser(context);
                    });
                  });
            }));
  }

  /// Section Widget
  Widget _buildOfferBanner(BuildContext context) {
    return Container(
        width: 335.h,
        margin: EdgeInsets.only(top: 20.v, right: 20.h),
        padding: EdgeInsets.symmetric(horizontal: 26.h, vertical: 12.v),
        decoration: AppDecoration.fillTeal
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 4.v),
              SizedBox(
                  width: 168.h,
                  child: Text("msg_early_protection".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleMedium18
                          .copyWith(height: 1.50))),
              SizedBox(height: 7.v),
              CustomElevatedButton(
                  height: 26.v,
                  width: 106.h,
                  text: "lbl_learn_more".tr,
                  buttonStyle: CustomButtonStyles.fillCyan,
                  buttonTextStyle: CustomTextStyles.labelLargePrimarySemiBold)
            ]));
  }

  /// Section Widget
  Widget _buildTopDoctorSeeAll(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 42.v, right: 20.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("lbl_top_doctor".tr, style: theme.textTheme.titleMedium),
              GestureDetector(
                  onTap: () {
                    onTapTxtSeeAll(context);
                  },
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 5.v),
                      child: Text("lbl_see_all".tr,
                          style: CustomTextStyles.labelLargeCyan300)))
            ]));
  }

  /// Section Widget
  Widget _buildDoctor(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
            height: 173.v,
            child: BlocSelector<DashboardBloc, DashboardState, DashboardModel?>(
                selector: (state) => state.dashboardModelObj,
                builder: (context, dashboardModelObj) {
                  return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 14.h);
                      },
                      itemCount: dashboardModelObj?.doctorItemList.length ?? 0,
                      itemBuilder: (context, index) {
                        DoctorItemModel model =
                            dashboardModelObj?.doctorItemList[index] ??
                                DoctorItemModel();
                        return DoctorItemWidget(model, onTapDoctor: () {
                          onTapDoctor(context);
                        });
                      });
                })));
  }

  /// Section Widget
  Widget _buildHealtArticleSee(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 31.v, right: 23.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("lbl_healt_article".tr, style: theme.textTheme.titleMedium),
          GestureDetector(
              onTap: () {
                onTapTxtSeeAll1(context);
              },
              child: Padding(
                  padding: EdgeInsets.only(bottom: 3.v),
                  child: Text("lbl_see_all".tr,
                      style: CustomTextStyles.labelLargeCyan300)))
        ]));
  }

  /// Section Widget
  Widget _buildTwentyFour(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 12.v, right: 20.h),
        padding: EdgeInsets.all(5.h),
        decoration: AppDecoration.outlineGray
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgThumbnail,
                  height: 55.adaptSize,
                  width: 55.adaptSize,
                  radius: BorderRadius.circular(6.h)),
              Padding(
                  padding: EdgeInsets.only(left: 12.h, bottom: 5.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 179.h,
                            child: Text("msg_the_25_healthiest".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.labelMediumOnPrimary
                                    .copyWith(height: 1.50))),
                        SizedBox(height: 8.v),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("lbl_jun_10_2021".tr,
                                  style: theme.textTheme.labelSmall),
                              Container(
                                  height: 2.adaptSize,
                                  width: 2.adaptSize,
                                  margin: EdgeInsets.only(
                                      left: 5.h, top: 3.v, bottom: 4.v),
                                  decoration: BoxDecoration(
                                      color: appTheme.gray500,
                                      borderRadius:
                                          BorderRadius.circular(1.h))),
                              Padding(
                                  padding: EdgeInsets.only(left: 5.h),
                                  child: Text("lbl_5min_read".tr,
                                      style: theme.textTheme.labelSmall))
                            ])
                      ]))
            ]));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {});
  }

  /// Navigates to the drDetailsScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the drDetailsScreen.
  onTapDoctor(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.drDetailsScreen);
  }

  /// Navigates to the pharmacyScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the pharmacyScreen.
  onTapBtnUser(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.pharmacyScreen);
  }

  /// Navigates to the drListScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the drListScreen.
  onTapTxtSeeAll(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.drListScreen,
    );
  }

  /// Navigates to the articleScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the articleScreen.
  onTapTxtSeeAll1(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.articleScreen,
    );
  }
}
