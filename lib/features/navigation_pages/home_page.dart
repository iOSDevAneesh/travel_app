import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_buddy/cubit/app_cubit_states.dart';
import 'package:travel_buddy/cubit/app_cubits.dart';
import 'package:travel_buddy/utils/app_color.dart';
import 'package:travel_buddy/widgets/app_large_text.dart';
import 'package:travel_buddy/widgets/app_text.dart';
import 'package:travel_buddy/widgets/circle_dot_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "assets/images/kaya.png": "Kayaking",
    "assets/images/hike.png": "Hiking",
    "assets/images/air.png": "Ballooning",
    "assets/images/snor.png": "Snorkeling"
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return BlocBuilder<AppCubit, CubitStates>(builder: (context, state) {
      if (state is LoadedState) {
        var info = state.places;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 70, left: 20),
              child: Row(
                children: [
                  const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  Expanded(child: Container()),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black45),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: AppLargeText(text: "Discover"),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  controller: _tabController,
                  dividerColor: Colors.transparent,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.grey,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  indicator:
                      CircleDotIndicator(color: AppColor.mainColor, radius: 4),
                  tabs: const [
                    Text("Places"),
                    Text("Inspiration"),
                    Text("Explore")
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.only(left: 18),
              height: 300,
              width: double.maxFinite,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: info.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubit>(context)
                                .navigateToDetailPage(info[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 12, right: 10),
                            height: 300,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "http://mark.bslmeiyu.com/uploads/${info[index].img}"),
                                    fit: BoxFit.cover)),
                          ),
                        );
                      }),
                  Text("hello"),
                  Text("h r u")
                ],
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(
                    text: "Explore more",
                    size: 22,
                  ),
                  AppText(
                    text: "See all",
                    color: AppColor.textColor1,
                    size: 14,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              height: 110,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 20),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "http://mark.bslmeiyu.com/uploads/${info[index].img}"),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 12),
                          child: AppText(
                            text: images.values.elementAt(index),
                            color: AppColor.textColor2,
                            size: 14,
                          ),
                        )
                      ],
                    );
                  }),
            )
          ],
        );
      } else {
        return Container();
      }
    });
  }
}
