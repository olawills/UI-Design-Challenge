library group_screen.dart;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:livestream_app/features/group/domain/gc_header.dart';
import 'package:livestream_app/features/group/domain/listerners.dart';
import 'package:livestream_app/features/home/domain/chat_header.dart';
import 'package:livestream_app/utils/assets.gen.dart';
import 'package:livestream_app/utils/extensions/num_extension.dart';
import 'package:livestream_app/utils/palette/colors.dart';

@RoutePage(name: 'GroupsPageRoute')
class GroupScreen extends StatefulWidget implements AutoRouteWrapper {
  final ChatHeader chatHeader;
  const GroupScreen({super.key, required this.chatHeader});

  @override
  State<GroupScreen> createState() => _GroupScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}

class _GroupScreenState extends State<GroupScreen> {
  int numberOfIcons = 5;
  static final list = GroupCallHeader.messages();
  static final listeners = Listeners.recorders();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                constraints: BoxConstraints.expand(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * 0.85,
                ),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(AssetsImages.image5PNG),
                    )),
              ),
              Positioned(
                left: 10.w,
                top: 50.h,
                child: Column(
                  children: [
                    const SizedBox(
                      width: 300,
                      child: Text(
                        'Meeting with Lora Adom',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 45,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // 5.sbh,
                    SizedBox(
                      width: 350.w,
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 4),
                        leading: Hero(
                          tag: widget.chatHeader.username,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage(widget.chatHeader.profilePicture),
                          ),
                        ),
                        title: Text(
                          widget.chatHeader.username,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: AssetsFonts.poppinsBoldTTF),
                        ),
                        subtitle: const Text(
                          'Meeting organizer',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 10.w,
                right: 10.w,
                bottom: 80,
                child: SizedBox(
                  height: 250.h,
                  child: ListView.builder(
                      itemCount: list.length,
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) {
                        final groupHeader = list[index];
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey.withOpacity(0.4),
                            backgroundImage:
                                AssetImage(groupHeader.profilePicture),
                          ),
                          title: Text(
                            groupHeader.username,
                            style: const TextStyle(
                              color: Color(0XFFBCC2CC),
                              fontSize: 14,
                              fontFamily: AssetsFonts.poppinsMediumTTF,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(groupHeader.messageSubtitle,
                              style: TextStyle(
                                  color: index == 0
                                      ? const Color(0XFFBCC2CC)
                                      : Colors.white,
                                  fontFamily: AssetsFonts.poppinsRegularTTF,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        );
                      }),
                ),
              ),
              Positioned(
                left: 10.w,
                right: 10.w,
                bottom: 15,
                child: Padding(
                  padding: [10, 5].pad,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(numberOfIcons, (index) {
                      final List<String> svgIcons = [
                        AssetsIcons.icRecorderSVG,
                        AssetsIcons.icAudioSVG,
                        AssetsIcons.icVideoCallSVG,
                        AssetsIcons.icGroupMessageSVG,
                        AssetsIcons.icCloseSVG,
                      ];
                      final List<Color> iconColors = [
                        Colors.grey.withOpacity(0.4),
                        Colors.grey.withOpacity(0.4),
                        const Color(0XFF05028F),
                        DesignColors.red
                      ];
                      return CircleAvatar(
                        radius: 24,
                        backgroundColor: index == 0
                            ? Colors.grey.withOpacity(0.4)
                            : iconColors.elementAt(index - 1),
                        child: SvgPicture.asset(svgIcons[index]),
                      );
                    }),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: [10].pad,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: [20].pad,
                children: List.generate(listeners.length, (index) {
                  final list = listeners[index];
                  return Stack(
                    children: [
                      CircleAvatar(
                        radius: 33,
                        backgroundImage: AssetImage(list.profilePicture),
                      ),
                      Positioned(
                        left: 40.w,
                        bottom: 0,
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: const Color(0XFFBCC2CC),
                            child: SvgPicture.asset(
                              AssetsIcons.icRecorderSVG,
                              // color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
