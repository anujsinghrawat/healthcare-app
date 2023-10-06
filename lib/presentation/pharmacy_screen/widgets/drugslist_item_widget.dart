import '../models/drugslist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/core/app_export.dart';

// ignore: must_be_immutable
class DrugslistItemWidget extends StatelessWidget {
  DrugslistItemWidget(
    this.drugslistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  DrugslistItemModel drugslistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 118.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 6.h,
            vertical: 7.v,
          ),
          decoration: AppDecoration.outlineTeal.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 16.v),
              CustomImageView(
                imagePath: drugslistItemModelObj?.panadol,
                height: 50.adaptSize,
                width: 50.adaptSize,
                radius: BorderRadius.circular(
                  25.h,
                ),
                alignment: Alignment.center,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 1.h,
                  top: 28.v,
                ),
                child: Text(
                  drugslistItemModelObj.panadol1!,
                  style: CustomTextStyles.labelLargeOnPrimaryContainer,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 1.h,
                  top: 2.v,
                ),
                child: Text(
                  drugslistItemModelObj.quantiity!,
                  style: theme.textTheme.labelMedium,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 1.h,
                  top: 3.v,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 2.v),
                      child: Text(
                        drugslistItemModelObj.price!,
                        style: CustomTextStyles.titleSmallOnPrimaryContainer,
                      ),
                    ),
                    CustomImageView(
                      imagePath: drugslistItemModelObj?.image,
                      height: 18.adaptSize,
                      width: 18.adaptSize,
                      margin: EdgeInsets.only(left: 38.h),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
