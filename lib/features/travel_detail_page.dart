import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_buddy/cubit/app_cubit_states.dart';
import 'package:travel_buddy/cubit/app_cubits.dart';
import 'package:travel_buddy/utils/app_color.dart';
import 'package:travel_buddy/widgets/app_button.dart';
import 'package:travel_buddy/widgets/app_large_text.dart';
import 'package:travel_buddy/widgets/app_text.dart';
import 'package:travel_buddy/widgets/responsive_button.dart';


class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStar = 4;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, CubitStates>(

      builder: (context, state) {
        DetailPageState detail = state as DetailPageState;
        return Scaffold(
          body: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                    child: Container(
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  decoration:  BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage("http://mark.bslmeiyu.com/uploads/${detail.place.img}"),
                          fit: BoxFit.cover)),
                )),
                Positioned(
                    top: 70,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              BlocProvider.of<AppCubit>(context)
                                  .navigateToHome();
                            },
                            icon: const Icon(
                              Icons.menu_open,
                              color: Colors.white,
                            )),
                        const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                      ],
                    )),
                Positioned(
                    top: 320,
                    child: Container(
                      padding:
                          const EdgeInsets.only(right: 20, left: 20, top: 26),
                      height: 500,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(
                                text:detail.place.name,
                                size: 22,
                                color: Colors.black,
                              ),
                              AppLargeText(
                                text: "\$ ${detail.place.price}",
                                size: 22,
                                color: AppColor.mainColor,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                color: AppColor.mainColor,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              AppText(
                                text: "USA,",
                                color: AppColor.mainColor,
                                size: 12,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              AppText(
                                text: detail.place.location,
                                color: AppColor.mainColor,
                                size: 12,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(5, (index) {
                                  return Icon(
                                    Icons.star,
                                    color: index < detail.place.stars
                                        ? AppColor.starColor
                                        : AppColor.textColor2,
                                    size: 22,
                                  );
                                }),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              AppText(
                                text: "[4.5]",
                                color: AppColor.textColor2,
                                size: 12,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          AppLargeText(
                            text: "People",
                            color: Colors.black54,
                            size: 20,
                          ),
                          AppText(
                            text: "Number of people in your group",
                            size: 14,
                            color: AppColor.mainColor.withOpacity(0.5),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Wrap(
                            spacing: 10,
                            children: List.generate(5, (index) {
                              return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: AppButton(
                                    size: 50,
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    backGroundColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColor.btnBackgroundColor,
                                    borderColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColor.btnBackgroundColor,
                                    text: (index + 1).toString(),
                                  ));
                            }),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AppLargeText(
                            text: "Description",
                            size: 20,
                            color: Colors.black54,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppText(
                            text:detail.place.description,
                            color: AppColor.mainColor.withOpacity(0.5),
                            size: 16,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )),
                Positioned(
                    left: 20,
                    bottom: 25,
                    child: Row(
                      children: [
                        AppButton(
                          size: 60,
                          color: AppColor.textColor2,
                          borderColor: AppColor.textColor2,
                          backGroundColor: Colors.white,
                          isIcon: true,
                          icon: Icons.favorite_border_outlined,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        ResponsiveButton(
                          width: 240,
                          isResponsive: true,
                        )
                      ],
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
