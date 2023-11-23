import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livestream_app/features/home/domain/home_header.dart';
import 'package:livestream_app/utils/assets.gen.dart';
import 'package:livestream_app/utils/extensions/num_extension.dart';
import 'package:livestream_app/utils/palette/colors.dart';

class HomeHeaderBuilder extends StatelessWidget {
  final HomeHeader homeHeader;
  const HomeHeaderBuilder({super.key, required this.homeHeader});

  @override
  Widget build(BuildContext context) {
    int numberOfAvatars = 5;
    return ColoredBox(
      color: DesignColors.backgroundColor,
      child: Column(
        children: [
          Padding(
            padding: [12, 20].pad,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                ),
                const Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(AssetsImages.image1PNG),
                )
              ],
            ),
          ),
          20.sbh,
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              // shrinkWrap: true,
              children: List.generate(
                  numberOfAvatars,
                  (index) => Padding(
                        padding: [10].pad,
                        child: ListTile(
                          title: CircleAvatar(
                            radius: 40,
                            backgroundColor:
                                index == 1 ? Colors.yellow : Colors.pink,
                            child: CircleAvatar(
                              radius: 38,
                              backgroundImage:
                                  AssetImage(homeHeader.profilePicture),
                            ),
                          ),
                          subtitle: Text(
                            index == 0 ? 'My status' : homeHeader.username,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
