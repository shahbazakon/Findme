import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:find_me/core/widget/profile_stack_banner.dart';
import 'package:find_me/feature/portfolio_feature/presonalPortfolio/presentation/widget/attachment_list_tile.com.dart';
import 'package:find_me/feature/portfolio_feature/presonalPortfolio/presentation/widget/video_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../../core/constants/app_color.dart';

class BusinessPortfolioScreen extends StatefulWidget {
  const BusinessPortfolioScreen({super.key});

  @override
  State<BusinessPortfolioScreen> createState() =>
      _BusinessPortfolioScreenState();
}

class _BusinessPortfolioScreenState extends State<BusinessPortfolioScreen> {
  AppLocalizations? translate;

  @override
  void initState() {
    translate = AppLocalizations.of(context);
    super.initState();
  }

  String videoUrl =
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";
  String profileImage =
      "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg";
  List<Map> projectList = [
    {
      "project_name": "Project name 1",
      "description": "Project description 1",
      "role": "Flutter Developer 1",
    },
    {
      "project_name": "Project name 2",
      "description": "Project description 2",
      "role": "Flutter Developer 2",
    },
    {
      "project_name": "Project name 3",
      "description": "Project description 3",
      "role": "Flutter Developer 3",
    },
    {
      "project_name": "Project name 4",
      "description": "Project description 4",
      "role": "Flutter Developer 4",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileStackBanner(
              backgroundImage:
                  "https://fs.npstatic.com/userfiles/7687254/image/MIUI_Super_Wallpapers-w810h462.jpg",
              title: translate!.translate("Aliya Hayat"),
              subTitle: translate!.translate("Female, 27yrs"),
            ),
            SizedBox(height: height * .03),
            sectionTitle(
                title: translate!.projects, isPadding: false, isCenter: true),
            Column(
              children: [
                ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: projectList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    bool isProjectLeftSide = (index % 2) == 0;
                    List<Widget> data = [
                      Text(projectList[index]["project_name"]),
                      Text(projectList[index]["description"]),
                      Text(projectList[index]["role"]),
                    ];
                    return Column(
                      children: [
                        Visibility(
                          visible: index == 0,
                          child: TimelineTile(
                            alignment: TimelineAlign.center,
                            isFirst: true,
                            indicatorStyle: timelineMainIndicator(),
                          ),
                        ),
                        TimelineTile(
                          alignment: TimelineAlign.center,
                          indicatorStyle:
                              timelineSubIndicator(isLeft: isProjectLeftSide),
                          endChild: !isProjectLeftSide
                              ? null
                              : Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Column(
                                    crossAxisAlignment: isProjectLeftSide
                                        ? CrossAxisAlignment.start
                                        : CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: data,
                                  ),
                                ),
                          startChild: isProjectLeftSide
                              ? null
                              : Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Column(
                                    crossAxisAlignment: isProjectLeftSide
                                        ? CrossAxisAlignment.start
                                        : CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: data,
                                  ),
                                ),
                        ),
                        Visibility(
                          visible: index == projectList.length - 1,
                          child: TimelineTile(
                            alignment: TimelineAlign.center,
                            isLast: true,
                            indicatorStyle: timelineMainIndicator(),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                sectionTitle(title: translate!.video),
                SizedBox(
                  width: width,
                  height: height * .2,
                  child: Row(
                    children: [
                      Expanded(
                        child: Hero(
                          tag: "AttachedVideo",
                          child: CustomVideoContainer(
                            thumbnail:
                                "https://mainstreammarketing.ca/wp-content/uploads/2021/08/Post-4-Image-scaled.jpeg",
                            videoUrl: videoUrl,
                          ),
                        ),
                      ),
                      Expanded(
                        child: CustomVideoContainer(
                          thumbnail:
                              "https://mainstreammarketing.ca/wp-content/uploads/2021/08/Post-4-Image-scaled.jpeg",
                          videoUrl: videoUrl,
                        ),
                      )
                    ],
                  ),
                ),
                sectionTitle(title: translate!.attachments),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const ScrollPhysics(
                      parent: NeverScrollableScrollPhysics()),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return AttachmentListTile(
                      title: translate!.resume,
                      onDownloadClick: () {
                        //TODO: Add Download Functionality
                        showSnackBar(title: translate!.download);
                      },
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  //Section Title
  Widget sectionTitle({
    required String title,
    bool isPadding = true,
    bool isCenter = false,
  }) {
    return Container(
      padding: isPadding
          ? const EdgeInsets.symmetric(horizontal: 12, vertical: 15)
          : null,
      alignment: isCenter ? Alignment.center : Alignment.topLeft,
      child: Text(
        title,
        style: TextHelper.h9,
        textAlign: TextAlign.start,
      ),
    );
  }

  //Sub Indicator
  IndicatorStyle timelineSubIndicator({bool isLeft = false}) {
    double indicatorWidth = width * .07;
    return IndicatorStyle(
        height: 2,
        width: indicatorWidth,
        indicatorXY: .05,
        indicator: Container(
          margin: EdgeInsets.only(
            left: isLeft ? width * .035 : 0,
            right: isLeft ? 0 : width * .035,
          ),
          color: Colors.grey,
        ));
  }

  //main Indicator
  IndicatorStyle timelineMainIndicator() {
    double radius = width * .08;
    return IndicatorStyle(
        height: radius,
        width: radius,
        indicator: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: AppColors.lightGrey3, width: 3.5)),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: AppColors.primary, width: 3.5)),
          ),
        ),
        drawGap: false);
  }
}
