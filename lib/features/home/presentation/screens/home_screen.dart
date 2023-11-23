// ignore_for_file: deprecated_member_use

library home_screen.dart;

import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:livestream_app/features/home/domain/chat_header.dart';
import 'package:livestream_app/features/home/domain/home_header.dart';
import 'package:livestream_app/managers/navigation/app_router.dart';
import 'package:livestream_app/utils/assets.gen.dart';
import 'package:livestream_app/utils/extensions/num_extension.dart';
import 'package:livestream_app/utils/palette/colors.dart';

@RoutePage(name: 'HomeScreenRoute')
class HomeScreen extends StatelessWidget implements AutoRouteWrapper {
  static final list = HomeHeader.homeheader();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int numberOfAvatars = 5;
    return Scaffold(
      backgroundColor: DesignColors.backgroundColor,
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      // color: DesignColors.backgroundColor,
                      // borderRadius: BorderRadius.only(
                      //   bottomLeft: Radius.circular(30),
                      //   bottomRight: Radius.circular(30),
                      // ),
                      ),
                  child: Padding(
                    padding: [20, 40].pad,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 40.h,
                              width: 40.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.25),
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: SvgPicture.asset(
                                AssetsIcons.icSearchSVG,
                                color: Colors.white,
                                height: 22.h,
                              ),
                            ),
                            const Text(
                              'Home',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                            const CircleAvatar(
                              radius: 18,
                              backgroundImage:
                                  AssetImage(AssetsImages.image1PNG),
                            )
                          ],
                        ),
                        30.sbh,
                        SizedBox(
                          height: 120.h,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            children: List.generate(numberOfAvatars, (index) {
                              final homeHeader = list[index];
                              List<Color> listOfColors = [
                                Colors.yellow,
                                Colors.pink.shade300,
                                Colors.blue.shade200,
                                Colors.yellow,
                              ];
                              return Padding(
                                padding: [8].pad,
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundColor: index == 0
                                          ? Colors
                                              .blueGrey // Set blueGrey for the first CircleAvatar
                                          : listOfColors.elementAt(index - 1),
                                      child: index == 0
                                          ? Stack(
                                              children: [
                                                DottedBorder(
                                                  borderType: BorderType.Circle,
                                                  strokeWidth: 2,
                                                  radius:
                                                      const Radius.circular(12),
                                                  child: CircleAvatar(
                                                    radius: 28,
                                                    backgroundImage: AssetImage(
                                                        homeHeader
                                                            .profilePicture),
                                                  ),
                                                ),
                                                const Positioned(
                                                  right: 4,
                                                  bottom: 0,
                                                  child: CircleAvatar(
                                                    radius: 8,
                                                    backgroundColor:
                                                        Colors.white,
                                                    child: Icon(
                                                      Icons.add,
                                                      size: 12,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : CircleAvatar(
                                              radius: 28,
                                              backgroundImage: AssetImage(
                                                  homeHeader.profilePicture),
                                            ),
                                    ),
                                    10.sbh,
                                    Text(
                                      index == 0
                                          ? 'My status'
                                          : homeHeader.username,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Positioned(
                //     bottom: 0,
                //     top: MediaQuery.sizeOf(context).height * 0.2,
                //     child: const _MessageBuilder()),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: _MessageBuilder(),
          )
        ],
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}

class _MessageBuilder extends StatefulWidget {
  const _MessageBuilder();

  @override
  State<_MessageBuilder> createState() => _MessageBuilderState();
}

class _MessageBuilderState extends State<_MessageBuilder> {
  static final list = ChatHeader.messages();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 2,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: ListView.separated(
              itemCount: list.length,
              // controller: controller,
              physics: const ClampingScrollPhysics(),
              separatorBuilder: (ctx, index) => 5.sbh,
              itemBuilder: (ctx, index) {
                final chatHeader = list[index];
                return Dismissible(
                  key: Key(chatHeader.username),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {},
                  background: Container(
                    decoration: const BoxDecoration(
                      color: DesignColors.dismissibleColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.black,
                          child:
                              SvgPicture.asset(AssetsIcons.icNotificationSVG),
                        ),
                        15.sbw,
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: DesignColors.red,
                          child: SvgPicture.asset(AssetsIcons.icDeleteSVG),
                        ),
                      ],
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      debugPrint('Hello Will');
                      context.router
                          .push(GroupsPageRoute(chatHeader: chatHeader));
                    },
                    child: Hero(
                      tag: chatHeader.username,
                      child: ListTile(
                        leading: Stack(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  AssetImage(chatHeader.profilePicture),
                            ),
                            index == 0 || index == 1 || index == 4
                                ? const Positioned(
                                    right: 4,
                                    bottom: 0,
                                    child: CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Color(0XFF0FE16D),
                                    ),
                                  )
                                : const Positioned(
                                    right: 4,
                                    bottom: 0,
                                    child: CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Color(0XFF9A9E9C),
                                    ),
                                  ),
                          ],
                        ),
                        title: Text(
                          chatHeader.username,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        subtitle: Text(
                          chatHeader.messageSubtitle,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0XFF797C7B),
                          ),
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              '2 min ago',
                              style: TextStyle(fontSize: 14),
                            ),
                            3.sbh,
                            index == 0
                                ? const CircleAvatar(
                                    radius: 10,
                                    backgroundColor: DesignColors.red,
                                    child: Text(
                                      '3',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    )

        // DraggableScrollableSheet(
        //   initialChildSize: .2,
        //   minChildSize: .1,
        //   maxChildSize: .6,
        //   builder: (context, scrollController) =>)
        ;
  }
}
