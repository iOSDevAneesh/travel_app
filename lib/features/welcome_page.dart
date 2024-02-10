import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_buddy/cubit/app_cubits.dart';
import 'package:travel_buddy/utils/app_color.dart';
import 'package:travel_buddy/utils/app_text.dart';
import 'package:travel_buddy/widgets/app_large_text.dart';
import 'package:travel_buddy/widgets/app_text.dart';
import 'package:travel_buddy/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "assets/images/img0.jpg",
    "assets/images/img1.jpg",
    "assets/images/img2.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(images[index]), fit: BoxFit.cover),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: Strings.trips),
                        AppText(text: Strings.mountains, size: 30),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 250,
                          child: AppText(
                            text: Strings.mountainHikeGives,
                            color: AppColor.textColor2,
                            size: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        GestureDetector(
                          onTap: (){
                            BlocProvider.of<AppCubit>(context).getData();
                          },
                          child: Container(
                              child: ResponsiveButton(width: 120)
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDot) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          height: index == indexDot ? 25 : 8,
                          width: 8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexDot
                                  ? AppColor.mainColor
                                  : AppColor.mainColor.withOpacity(0.3)),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
