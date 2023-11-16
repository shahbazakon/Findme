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

class AcademicPortfolioScreen extends StatefulWidget {
  const AcademicPortfolioScreen({super.key});

  @override
  State<AcademicPortfolioScreen> createState() =>
      _AcademicPortfolioScreenState();
}

class _AcademicPortfolioScreenState extends State<AcademicPortfolioScreen> {
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
  List<String> certificationsList = [
    'Certifications 1',
    'Certifications 2',
    'Certifications 3',
    'Certifications 4',
    'Certifications 5',
  ];
  List<String> achievementsList = [
    'Achievements 1',
    'Achievements 2',
    'Achievements 3',
    'Achievements 4',
    'Achievements 5',
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
            Column(
              children: [
                customTimeline(
                    title: translate!.projects,
                    timelineData: projectList,
                    isDataTypeList: false),
                customTimeline(
                    title: translate!.achievements,
                    timelineData: achievementsList),
                customTimeline(
                    title: translate!.certifications,
                    timelineData: certificationsList),
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
  IndicatorStyle timelineSubIndicator() {
    double indicatorWidth = width * .08;
    return IndicatorStyle(
        height: 2,
        width: indicatorWidth,
        indicatorXY: .05,
        indicator: Container(
          margin: EdgeInsets.only(
            left: width * .035,
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

  //Custom Timeline
  ListView customTimeline({
    required String title,
    required dynamic timelineData,
    bool isDataTypeList = true,
  }) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: timelineData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        List<Widget> data = isDataTypeList
            ? [
                Text(timelineData[index]),
              ]
            : [
                Text(timelineData[index]["project_name"]),
                Text(timelineData[index]["description"]),
                Text(timelineData[index]["role"]),
              ];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Visibility(
                visible: index == 0,
                child: TimelineTile(
                  alignment: TimelineAlign.start,
                  isFirst: true,
                  indicatorStyle: timelineMainIndicator(),
                  endChild: sectionTitle(title: title),
                ),
              ),
              TimelineTile(
                alignment: TimelineAlign.start,
                indicatorStyle: timelineSubIndicator(),
                endChild: Padding(
                  padding: EdgeInsets.only(left: 8, bottom: height * .025),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: data,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
