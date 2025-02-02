import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_pojo/core/providers/theme_provider.dart';
import 'package:news_pojo/core/resources/assets.gen.dart';
import 'package:news_pojo/core/theme/color_palette.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  final Function onBack;
  const DrawerWidget({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Drawer(
      backgroundColor: ColorPalette.primaryDarkColor,
      shape: LinearBorder(),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 166.h,
            width: double.infinity.w,
            decoration: BoxDecoration(
              color: ColorPalette.primaryLightColor,
            ),
            child: Text(
              'news_app'.tr(),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: ColorPalette.primaryDarkColor),
            ),
          ),
          SizedBox(height: 16.h),
          ListTile(
            title: Text(
              'home'.tr(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: ColorPalette.primaryLightColor),
            ),
            leading: Image.asset(Assets.icons.homeIcon.path),
            onTap: () {
              onBack();
            },
          ),
          SizedBox(height: 16.h),
          Divider(
            color: ColorPalette.primaryLightColor,
            height: 2,
          ),
          SizedBox(height: 24.h),
          FractionallySizedBox(
            widthFactor: 0.9,
            child: Row(
              children: [
                Image.asset(Assets.icons.paintIcon.path),
                SizedBox(width: 8.w),
                Text(
                  'theme'.tr(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: ColorPalette.primaryLightColor),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          FractionallySizedBox(
            widthFactor: 0.9,
            child: DropdownMenu(
              controller: TextEditingController(
                  text: provider.themeMode == ThemeMode.light
                      ? "light".tr()
                      : "dark".tr()),
              width: double.infinity,
              trailingIcon: Icon(
                Icons.arrow_drop_down_rounded,
                color: ColorPalette.primaryLightColor,
                size: 50,
              ),
              selectedTrailingIcon: Icon(
                Icons.arrow_drop_up_rounded,
                color: ColorPalette.primaryLightColor,
                size: 50,
              ),
              enableSearch: false,
              onSelected: (ThemeMode? value) {
                if (value != null) {
                  provider.changeTheme();
                  Navigator.pop(context);
                }
              },
              dropdownMenuEntries: [
                DropdownMenuEntry(
                  label: "light".tr(),
                  value: ThemeMode.light,
                ),
                DropdownMenuEntry(
                  label: "dark".tr(),
                  value: ThemeMode.dark,
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Divider(
            color: ColorPalette.primaryLightColor,
            height: 2,
          ),
          SizedBox(height: 24.h),
          FractionallySizedBox(
            widthFactor: 0.9,
            child: Row(
              children: [
                Image.asset(Assets.icons.languageIcon.path),
                SizedBox(width: 8.w),
                Text(
                  'language'.tr(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: ColorPalette.primaryLightColor),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          FractionallySizedBox(
            widthFactor: 0.9,
            child: DropdownMenu(
              controller: TextEditingController(
                  text: context.locale.languageCode == 'en'
                      ? "english".tr()
                      : "arabic".tr()),
              width: double.infinity,
              trailingIcon: Icon(
                Icons.arrow_drop_down_rounded,
                color: ColorPalette.primaryLightColor,
                size: 50,
              ),
              selectedTrailingIcon: Icon(
                Icons.arrow_drop_up_rounded,
                color: ColorPalette.primaryLightColor,
                size: 50,
              ),
              enableSearch: false,
              onSelected: (value) {
                if (value == 'ar') {
                  context.setLocale(
                    Locale('ar'),
                  );
                } else {
                  context.setLocale(
                    Locale('en'),
                  );
                }
              Navigator.pop(context);
              },
              dropdownMenuEntries: [
                DropdownMenuEntry(
                  label: "english".tr(),
                  value: 'en',
                ),
                DropdownMenuEntry(
                  label: "arabic".tr(),
                  value: 'ar',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
