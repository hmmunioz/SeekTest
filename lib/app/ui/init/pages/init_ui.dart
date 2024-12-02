import 'package:seektest/app/common_widgets/circular_image.dart';
import 'package:seektest/app/constants/assets.dart';
import 'package:seektest/app/ui/init/pages/init_interactor.dart';
import 'package:seektest/app/ui/init/widgets/auth_button_widget.dart';
import 'package:seektest/app/common_widgets/background_widget.dart';
import 'package:seektest/app/utils/cubits/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:seektest/app/constants/constants.dart';

class InitUI extends StatelessWidget {
  final InitInteractor initInteractor;

  const InitUI(this.initInteractor, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        return Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: false,
          resizeToAvoidBottomInset: true,
          backgroundColor: Theme.of(context).cardColor,
          body: ScreenUtilInit(
            minTextAdapt: true,
            splitScreenMode: true,
            designSize: ConstantsValues.designSize,
            builder: (context, child) => Stack(
              children: [
                const Positioned(
                  top: 0,
                  left: 0,
                  child: BackgroundWidget(),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 1.sh,
                        width: 1.sw,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CircularImage(
                              assetPath: AssetsUIValues.logo,
                              size: 150.0,
                            ),
                            SizedBox(height: .05.sh),
                            Text(
                              translate('welcome'),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: .14.sw,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColorDark,
                                height: 1,
                              ),
                            ),
                            Text(
                              translate('nameUser'),
                              style: TextStyle(
                                fontSize: .055.sw,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColorDark,
                              ),
                            ),
                            SizedBox(height: .09.sh),
                            Text(
                              translate('manage_title'),
                              style: TextStyle(
                                fontSize: .042.sw,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColorDark,
                              ),
                            ),
                            SizedBox(height: .14.sh),
                            SeekButtonWidget(
                              text: translate("get_started"),
                              icon: Icons.login,
                              functionToExecute: () async {
                                initInteractor.goToTask(context);
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
