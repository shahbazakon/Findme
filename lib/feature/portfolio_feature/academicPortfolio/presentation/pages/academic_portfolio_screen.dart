import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:find_me/core/widget/loading.dart';
import 'package:find_me/core/widget/profile_stack_banner.dart';
import 'package:find_me/feature/portfolio_feature/academicPortfolio/data/models/academic_details_model.dart';
import 'package:find_me/feature/portfolio_feature/academicPortfolio/presentation/cubit/academic_portfolio_cubit.dart';
import 'package:find_me/feature/portfolio_feature/personalPortfolio/presentation/widget/video_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../../core/constants/app_color.dart';

class AcademicPortfolioScreen extends StatefulWidget {
  const AcademicPortfolioScreen({super.key, required this.academicCardID});
  final String academicCardID;
  @override
  State<AcademicPortfolioScreen> createState() =>
      _AcademicPortfolioScreenState();
}

class _AcademicPortfolioScreenState extends State<AcademicPortfolioScreen> {
  @override
  void initState() {
    apiCall();
    super.initState();
  }

  // fetch Academic Portfolio Data
  void apiCall() {
    context
        .read<AcademicPortfolioCubit>()
        .fetchAcademicPortfolioDetails(userID: widget.academicCardID);
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
    AppLocalizations? translate = AppLocalizations.of(context);
    return Scaffold(
      body: BlocConsumer<AcademicPortfolioCubit, AcademicPortfolioState>(
        listener: (context, state) {
          if (state is AcademicPortfolioError) {
            showSnackBar(title: state.errorMsg);
          }
        },
        builder: (context, state) {
          if (state is AcademicPortfolioLoading) {
            return const Loading(
              isSmall: false,
            );
          } else if (state is AcademicPortfolioLoaded) {
            AcademicResult? data = state.academicDetailsModel.result;
            var age = calculateAge(
                dobString: data?.dob?.toString() ?? DateTime.now().toString());
            return SingleChildScrollView(
              child: Column(
                children: [
                  ProfileStackBanner(
                    backgroundImage: data?.picture?.first.url,
                    title: translate!.translate(
                        "${data?.suffix ?? ""} ${data?.firstName ?? ""} ${data?.middleName ?? ""} ${data?.lastName ?? ""}" ??
                            " "),
                    subTitle: translate.translate(
                        "${data?.gender != null ? "${data?.gender}," : ""} ${age != 0 ? "" : ""}"),
                  ),
                  Column(
                    children: [
                      customTimeline(
                          title: translate.projects,
                          timelineData: data?.projects ?? [],
                          isDataTypeList: false),
                      customTimeline(
                          title: translate.achievements,
                          timelineData: data?.achievements ?? []),
                      customTimeline(
                          title: translate.certifications,
                          timelineData: data?.certification ?? []),
                      sectionTitle(title: translate.video),
                      GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                        childAspectRatio: 15 / 11,
                        shrinkWrap: true,
                        children: List.generate(data?.videoLink?.length ?? 0,
                            (index) {
                          return Hero(
                            tag: "AttachedVideo",
                            child: CustomVideoContainer(
                              videoUrl: data!.videoLink![index].link.toString(),
                            ),
                          );
                        }),
                      )
                    ],
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: Text(translate!.oopsSomethingWentWrong),
            );
          }
        },
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
    required List<Achievement> timelineData,
    bool isDataTypeList = true,
  }) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: timelineData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        Achievement dataIndex = timelineData[index];
        List<Widget> data = isDataTypeList
            ? [
                Text(dataIndex.title.toString()),
              ]
            : [
                Text(dataIndex.title.toString()),
                Text(dataIndex.detail.toString()),
                Text(dataIndex.label.toString()),
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
