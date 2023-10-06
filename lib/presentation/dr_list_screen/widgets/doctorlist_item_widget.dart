import '../models/doctorlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/core/app_export.dart';

// ignore: must_be_immutable
class DoctorlistItemWidget extends StatelessWidget {
  DoctorlistItemWidget(
    this.doctorlistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  DoctorlistItemModel doctorlistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 7.h,
        vertical: 6.v,
      ),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        children: [
          CustomImageView(
            imagePath: doctorlistItemModelObj?.drMarcusHorizon,
            height: 111.adaptSize,
            width: 111.adaptSize,
            radius: BorderRadius.circular(
              12.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 18.h,
              top: 7.v,
              bottom: 4.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorlistItemModelObj.title!,
                  style: CustomTextStyles.titleMedium18,
                ),
                SizedBox(height: 7.v),
                Text(
                  "lbl_chardiologist".tr,
                  style: theme.textTheme.labelLarge,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 3.h,
                    top: 13.v,
                  ),
                  child: Row(
                    children: [
                      CustomImageView(
                        imagePath: doctorlistItemModelObj?.image,
                        height: 13.adaptSize,
                        width: 13.adaptSize,
                        margin: EdgeInsets.only(bottom: 1.v),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4.h),
                        child: Text(
                          "lbl_4_72".tr,
                          style: CustomTextStyles.labelLargeCyan300,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.v),
                Row(
                  children: [
                    CustomImageView(
                      imagePath: doctorlistItemModelObj?.maway,
                      height: 13.adaptSize,
                      width: 13.adaptSize,
                      margin: EdgeInsets.only(bottom: 2.v),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3.h),
                      child: Text(
                        "lbl_800m_away".tr,
                        style: theme.textTheme.labelLarge,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
