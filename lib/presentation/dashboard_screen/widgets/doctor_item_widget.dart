import '../models/doctor_item_model.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/core/app_export.dart';

// ignore: must_be_immutable
class DoctorItemWidget extends StatelessWidget {
  DoctorItemWidget(
    this.doctorItemModelObj, {
    Key? key,
    this.onTapDoctor,
  }) : super(
          key: key,
        );

  DoctorItemModel doctorItemModelObj;

  VoidCallback? onTapDoctor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 118.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () {
            onTapDoctor!.call();
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 6.h,
              vertical: 10.v,
            ),
            decoration: AppDecoration.outlineTeal.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 11.v),
                CustomImageView(
                  imagePath: doctorItemModelObj?.drMarcusHorizo,
                  height: 68.adaptSize,
                  width: 68.adaptSize,
                  radius: BorderRadius.circular(
                    34.h,
                  ),
                  alignment: Alignment.center,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 1.h,
                    top: 18.v,
                  ),
                  child: Text(
                    doctorItemModelObj.drMarcusHorizo1!,
                    style: CustomTextStyles.labelLargeOnPrimarySemiBold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 1.h,
                    top: 3.v,
                  ),
                  child: Text(
                    doctorItemModelObj.chardiologist!,
                    style: theme.textTheme.labelMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 1.h,
                    top: 6.v,
                  ),
                  child: Row(
                    children: [
                      CustomImageView(
                        imagePath: doctorItemModelObj?.image,
                        height: 10.adaptSize,
                        width: 10.adaptSize,
                        margin: EdgeInsets.only(bottom: 3.v),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 3.h,
                          top: 2.v,
                          bottom: 1.v,
                        ),
                        child: Text(
                          doctorItemModelObj.ratting!,
                          style: CustomTextStyles.labelSmallCyan300,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 23.h,
                          top: 3.v,
                        ),
                        child: Text(
                          doctorItemModelObj.distance!,
                          style: CustomTextStyles.labelSmallBluegray200,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
