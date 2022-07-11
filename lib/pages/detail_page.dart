// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_buttons.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = 0;
  int gottenStars = 4;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
        return Scaffold(
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.maxFinite,
                      height: 400,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'http://mark.bslmeiyu.com/uploads/${detail.place.img}')),
                      ),
                    )),
                Positioned(
                    left: 10,
                    top: 40,
                    child: Row(
                      children: [
                        IconButton(
                            color: Colors.white,
                            onPressed: () {
                              BlocProvider.of<AppCubits>(context).goHome();
                            },
                            icon: const Icon(Icons.arrow_back_ios_new))
                      ],
                    )),
                Positioned(
                    top: 290,
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 30),
                      width: MediaQuery.of(context).size.width,
                      height: 600,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(
                                text: detail.place.name,
                                color: Colors.black.withOpacity(0.75),
                              ),
                              AppLargeText(
                                text: '\$${detail.place.price}',
                                color: AppColors.mainColor,
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                color: AppColors.mainColor,
                              ),
                              const SizedBox(width: 5),
                              AppText(
                                text: detail.place.location,
                                size: 20,
                                color: AppColors.textColor1,
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(
                                  5,
                                  (index) {
                                    return Icon(
                                      Icons.star,
                                      color: detail.place.stars > index
                                          ? AppColors.starColor
                                          : AppColors.textColor2,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 5),
                              AppText(
                                text: detail.place.stars.toDouble().toString(),
                                color: AppColors.textColor2,
                                size: 15,
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          AppLargeText(
                              text: "People ",
                              color: Colors.black.withOpacity(0.8),
                              size: 25),
                          const SizedBox(height: 5),
                          AppText(
                              text: "Number of people in your group",
                              size: 18,
                              color: AppColors.mainTextColor),
                          const SizedBox(height: 5),
                          Wrap(
                            children: List.generate(
                                5,
                                (index) => InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                        });
                                      },
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        child: AppButton(
                                          color: selectedIndex == index
                                              ? Colors.white
                                              : Colors.black,
                                          backgroundColor:
                                              selectedIndex == index
                                                  ? Colors.black
                                                  : AppColors.buttonBackground,
                                          size: 45,
                                          borderColor:
                                              AppColors.buttonBackground,
                                          text: (index + 1).toString(),
                                        ),
                                      ),
                                    )),
                          ),
                          const SizedBox(height: 20),
                          AppLargeText(
                            text: "Description",
                            size: 25,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: 63,
                            child: SingleChildScrollView(
                              child: AppText(
                                text: detail.place.description,
                                color: AppColors.mainTextColor,
                                size: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
                Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Row(
                      children: [
                        AppButton(
                          color: AppColors.mainColor,
                          backgroundColor: Colors.white,
                          size: 60,
                          borderColor: AppColors.mainColor,
                          isIcon: true,
                          icon: Icons.favorite_border_sharp,
                        ),
                        const SizedBox(width: 20),
                        const ResponsiveButton(
                          isResposive: true,
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
