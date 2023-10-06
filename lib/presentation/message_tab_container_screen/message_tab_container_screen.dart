import 'bloc/message_tab_container_bloc.dart';
import 'models/message_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/core/app_export.dart';
import 'package:health_care_app/presentation/message_page/message_page.dart';
import 'package:health_care_app/widgets/app_bar/appbar_title.dart';
import 'package:health_care_app/widgets/app_bar/custom_app_bar.dart';
import 'package:health_care_app/widgets/custom_bottom_bar.dart';
import 'package:health_care_app/widgets/custom_floating_button.dart';

class MessageTabContainerScreen extends StatefulWidget {
  const MessageTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  MessageTabContainerScreenState createState() =>
      MessageTabContainerScreenState();
  static Widget builder(BuildContext context) {
    return BlocProvider<MessageTabContainerBloc>(
      create: (context) => MessageTabContainerBloc(MessageTabContainerState(
        messageTabContainerModelObj: MessageTabContainerModel(),
      ))
        ..add(MessageTabContainerInitialEvent()),
      child: MessageTabContainerScreen(),
    );
  }
}

class MessageTabContainerScreenState extends State<MessageTabContainerScreen>
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

    return BlocBuilder<MessageTabContainerBloc, MessageTabContainerState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 46.v),
                  Column(
                    children: [
                      _buildTabview(context),
                      SizedBox(
                        height: 575.v,
                        child: TabBarView(
                          controller: tabviewController,
                          children: [
                            MessagePage.builder(context),
                            MessagePage.builder(context),
                            MessagePage.builder(context),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            bottomNavigationBar: _buildBottomBar(context),
            floatingActionButton: _buildFloatingActionButton(context),
          ),
        );
      },
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 50.v,
      title: AppbarTitle(
        text: "lbl_messages".tr,
        margin: EdgeInsets.only(left: 16.h),
      ),
      actions: [
        Container(
          height: 29.v,
          width: 20.h,
          margin: EdgeInsets.fromLTRB(14.h, 12.v, 14.h, 9.v),
          child: Stack(
            alignment: Alignment.topCenter,
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
                imagePath: ImageConstant.imgComponent5Onprimary,
                height: 20.adaptSize,
                width: 20.adaptSize,
                alignment: Alignment.topCenter,
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
              "lbl_all".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_group".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_private".tr,
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

  /// Section Widget
  Widget _buildFloatingActionButton(BuildContext context) {
    return CustomFloatingButton(
      height: 55,
      width: 55,
      backgroundColor: appTheme.cyan300,
      child: CustomImageView(
        imagePath: ImageConstant.imgUserPrimary55x55,
        height: 27.5.v,
        width: 27.5.h,
      ),
    );
  }
}
