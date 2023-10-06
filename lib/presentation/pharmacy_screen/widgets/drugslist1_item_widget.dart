import '../models/drugslist1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/core/app_export.dart';

// ignore: must_be_immutable
class Drugslist1ItemWidget extends StatelessWidget {
  Drugslist1ItemWidget(
    this.drugslist1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Drugslist1ItemModel drugslist1ItemModelObj;

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
                imagePath: drugslist1ItemModelObj?.oBHCombi,
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
                  top: 27.v,
                ),
                child: Text(
                  drugslist1ItemModelObj.panadol!,
                  style: CustomTextStyles.labelLargeOnPrimaryContainer,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 1.h,
                  top: 1.v,
                ),
                child: Text(
                  drugslist1ItemModelObj.measurement!,
                  style: theme.textTheme.labelMedium,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 1.h,
                  top: 4.v,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 2.v),
                      child: Text(
                        drugslist1ItemModelObj.price!,
                        style: CustomTextStyles.titleSmallOnPrimaryContainer,
                      ),
                    ),
                    CustomImageView(
                      imagePath: drugslist1ItemModelObj?.image,
                      height: 18.adaptSize,
                      width: 18.adaptSize,
                      margin: EdgeInsets.only(left: 45.h),
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
