import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/colors/app_colors.dart';
import 'package:flutter_golang_yt/screens/add_task.dart';
import 'package:flutter_golang_yt/screens/home_screen.dart';
import 'package:flutter_golang_yt/widgets/button_widgets.dart';
import 'package:flutter_golang_yt/widgets/task_widget.dart';
import 'package:get/get.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List myData = [
      "Try Harder",
      "Try Smarter",
    ];

    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color(0xFF2e3253).withOpacity(0.5),
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        child: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
    );

    final rightDeleteIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.redAccent,
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, top: 60),
            alignment: Alignment.topLeft,
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 3.2,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/header1.jpg",
                    ))),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back,
                color: AppColors.secondaryColor,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.home),
                  color: AppColors.secondaryColor,
                  onPressed: () {
                    Get.to(() => const HomeScreen(),
                        transition: Transition.leftToRightWithFade,
                        duration: const Duration(milliseconds: 500));
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  icon: const Center(
                    child: Icon(
                      Icons.add_task,
                      size: 20,
                    ),
                  ),
                  // color: Colors.white,
                  onPressed: () {
                    Get.to(() => const AddTask(),
                        transition: Transition.leftToRightWithFade,
                        duration: const Duration(milliseconds: 500));
                  },
                ),

                Expanded(child: Container()), //This is just for the space
                Icon(
                  Icons.calendar_month_sharp,
                  color: AppColors.secondaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "2",
                  style:
                      TextStyle(fontSize: 20, color: AppColors.secondaryColor),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Flexible(
              child: ListView.builder(
                  itemCount: myData.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      background: leftEditIcon,
                      secondaryBackground: rightDeleteIcon,
                      onDismissed: (DismissDirection direction) {},
                      confirmDismiss: (DismissDirection direction) async {
                        if (direction == DismissDirection.startToEnd) {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              barrierColor: Colors.transparent,
                              context: context,
                              builder: (_) {
                                return Container(
                                  height: 300,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF2e3253)
                                          .withOpacity(0.4),
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ButtonWidget(
                                            backgroundColor:
                                                AppColors.mainColor,
                                            text: "View",
                                            textColor: Colors.white),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        ButtonWidget(
                                            backgroundColor:
                                                AppColors.mainColor,
                                            text: "Edit",
                                            textColor: Colors.blueAccent)
                                      ],
                                    ),
                                  ),
                                );
                              });

                          return false;
                        } else {
                          return Future.delayed(Duration(seconds: 1),
                              () => direction == DismissDirection.endToStart);
                        }
                      },
                      key: ObjectKey(index),
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 10),
                        child: TaskWidget(
                          text: myData[index],
                          color: Colors.blueGrey,
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
