// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xeats/controllers/Components/Components.dart';
import 'package:xeats/controllers/Cubit.dart';
import 'package:xeats/controllers/States.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:xeats/views/Profile/Profile.dart';
import 'package:xeats/views/ResturantsMenu/ResturantsMenu.dart';

class Resturantss extends StatelessWidget {
  const Resturantss({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
        create: (context) => Xeatscubit(),
        child: BlocConsumer<Xeatscubit, XeatsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = Xeatscubit.get(context);
            var data_from_api = Xeatscubit.ResturantsList;
            String Salama = "Salama";
            String Koshry = "Koshary El-Tahrir";
            String mac = "Mac";
            String Rosto = "Rosto";
            var Connection = false;

            return Scaffold(
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Column(children: [
                    Container(
                        width: width,
                        height: 170.h,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12)),
                            color: Color.fromARGB(255, 9, 134, 211)),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Resturants",
                            style: GoogleFonts.kanit(
                                fontWeight: FontWeight.normal, fontSize: 28),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.all(25.h),
                      child: Column(
                        children: [
                          ConditionalBuilder(
                            condition:
                                data_from_api.isNotEmpty && Connection == false,
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator()),
                            builder: (context) => ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                if (data_from_api[index]['image'] == null) {
                                  return CircularProgressIndicator();
                                } else {
                                  return InkWell(
                                    onTap: () {
                                      if (index == 0) {
                                        Navigation(context, ResturantsMenu());
                                      } else if (index == 1) {}
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Row(children: [
                                        Container(
                                          height: 130.h,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color.fromARGB(
                                                    74, 158, 158, 158)),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Image.network(
                                                'https://www.x-eats.com' +
                                                    data_from_api[index]
                                                        ['image'],
                                                loadingBuilder: (context, child,
                                                    loadingProgress) {
                                                  if (loadingProgress == null)
                                                    return child;
                                                  return Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      value: loadingProgress
                                                                  .expectedTotalBytes !=
                                                              null
                                                          ? loadingProgress
                                                                  .cumulativeBytesLoaded /
                                                              loadingProgress
                                                                  .expectedTotalBytes!
                                                          : null,
                                                    ),
                                                  );
                                                },
                                              )),
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 120,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Column(children: [
                                                  Text(
                                                      '${data_from_api[index]['Name']}',
                                                      style: GoogleFonts.kanit(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 20,
                                                      )),
                                                ]),
                                                if (data_from_api[index]
                                                        ['Name'] ==
                                                    Salama) ...[
                                                  Text(
                                                      "Egyptian,Kebda,Sandwichs",
                                                      style: GoogleFonts.kanit(
                                                        color: Color.fromARGB(
                                                            150, 0, 0, 0),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                      ))
                                                ] else if (data_from_api[index]
                                                        ['Name'] ==
                                                    Koshry) ...[
                                                  Text("Egyptian,Koshry,Tagen",
                                                      style: GoogleFonts.kanit(
                                                        color: Color.fromARGB(
                                                            150, 0, 0, 0),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                      ))
                                                ] else if (data_from_api[index]
                                                        ['Name'] ==
                                                    mac) ...[
                                                  Text("Chicken,Meat,Sandwichs",
                                                      style: GoogleFonts.kanit(
                                                        color: Color.fromARGB(
                                                            150, 0, 0, 0),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                      ))
                                                ] else if (data_from_api[index]
                                                        ['Name'] ==
                                                    Rosto) ...[
                                                  Text("Chicken,Meat,Fast Food",
                                                      style: GoogleFonts.kanit(
                                                        color: Color.fromARGB(
                                                            150, 0, 0, 0),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                      ))
                                                ],
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Row(children: const [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  Text(' 4.1'),
                                                  Text(' (100+)')
                                                ]),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                        Icons.timer_sharp),
                                                    Text(
                                                      ' 36 mins',
                                                      style: GoogleFonts.kanit(
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    SizedBox(
                                                      width: 25.w,
                                                    ),
                                                    Icon(Icons
                                                        .delivery_dining_outlined),
                                                    SizedBox(
                                                      width: 2.w,
                                                    ),
                                                    Text(
                                                      'EGP 10',
                                                      style: GoogleFonts.kanit(
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  );
                                }
                              },
                              separatorBuilder: ((context, index) =>
                                  Dividerr()),
                              itemCount: data_from_api.length,
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            );
          },
        ));
  }
}
