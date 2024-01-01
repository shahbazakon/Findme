import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:find_me/core/widget/loading.dart';
import 'package:find_me/core/widget/profile_stack_banner.dart';
import 'package:find_me/feature/portfolio_feature/businessPortfolio/data/models/business_portfolio_model.dart';
import 'package:find_me/feature/portfolio_feature/businessPortfolio/presentation/cubit/business_portfolio_cubit.dart';
import 'package:find_me/feature/portfolio_feature/personalPortfolio/presentation/widget/attachment_list_tile.com.dart';
import 'package:find_me/feature/portfolio_feature/personalPortfolio/presentation/widget/video_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../../core/constants/app_color.dart';
import '../../../../../core/utils/download_files.dart';

class BusinessPortfolioScreen extends StatefulWidget {
  final String businessCardID;

  const BusinessPortfolioScreen({super.key, required this.businessCardID});

  @override
  State<BusinessPortfolioScreen> createState() =>
      _BusinessPortfolioScreenState();
}

class _BusinessPortfolioScreenState extends State<BusinessPortfolioScreen> {
  BusinessResult? data;
  @override
  void initState() {
    apiCall();
    super.initState();
  }

  // fetch Academic Portfolio Data
  void apiCall() {
    context
        .read<BusinessPortfolioCubit>()
        .fetchBusinessPortfolioDetails(cardID: widget.businessCardID);
  }

  //get Social Mi
  String getSocialMediaURL({required String name}) {
    for (var element in data?.social ?? []) {
      if (name.toLowerCase() == element.title.toLowerCase()) {
        return element.label;
      }
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations? translate = AppLocalizations.of(context);
    return Scaffold(
      body: BlocConsumer<BusinessPortfolioCubit, BusinessPortfolioState>(
        listener: (context, state) {
          if (state is BusinessPortfolioError) {
            showSnackBar(title: state.errorMsg);
          }
        },
        builder: (context, state) {
          if (state is BusinessPortfolioLoading) {
            return const Loading(isSmall: false);
          } else if (state is BusinessPortfolioLoaded) {
            data = state.businessPortfolioModel.result;
            String? profilePicture = data?.picture?.first.url;
            var age = calculateAge(
                dobString: data?.dob?.toString() ?? DateTime.now().toString());
            return SingleChildScrollView(
              child: Column(
                children: [
                  ProfileStackBanner(
                    backgroundImage: profilePicture, // TODO: add cover Image
                    title: translate!.translate(
                        "${data?.suffix ?? ""} ${data?.firstName ?? ""} ${data?.middleName ?? ""} ${data?.lastName ?? ""}" ??
                            ""),
                    subTitle: translate.translate(
                        "${data?.gender != null ? "${data?.gender}," : ""} ${age != 0 ? "" : ""}"),
                  ),
                  SizedBox(height: height * .03),
                  sectionTitle(
                      title: translate!.projects,
                      isPadding: false,
                      isCenter: true),
                  Column(
                    children: [
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: data?.projects?.length ?? 0,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          bool isProjectLeftSide = (index % 2) == 0;
                          List<Widget> projectData = [
                            Text("${data?.projects?[index].title}"),
                            Text("${data?.projects?[index].detail}"),
                            Text("${data?.projects?[index].label}"),
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
                                indicatorStyle: timelineSubIndicator(
                                    isLeft: isProjectLeftSide),
                                endChild: !isProjectLeftSide
                                    ? null
                                    : Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Column(
                                          crossAxisAlignment: isProjectLeftSide
                                              ? CrossAxisAlignment.start
                                              : CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: projectData,
                                        ),
                                      ),
                                startChild: isProjectLeftSide
                                    ? null
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: Column(
                                          crossAxisAlignment: isProjectLeftSide
                                              ? CrossAxisAlignment.start
                                              : CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: projectData,
                                        ),
                                      ),
                              ),
                              Visibility(
                                visible:
                                    index == (data?.projects?.length ?? 0) - 1,
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
                      GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                        childAspectRatio: 15 / 11,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(data?.videoLink?.length ?? 0,
                            (index) {
                          return Hero(
                            tag: "AttachedVideo",
                            child: CustomVideoContainer(
                              videoUrl: data!.videoLink![index].link.toString(),
                            ),
                          );
                        }),
                      ),
                      sectionTitle(title: translate!.attachments),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const ScrollPhysics(
                            parent: NeverScrollableScrollPhysics()),
                        shrinkWrap: true,
                        itemCount: /* data.achievements?.length ?? 0*/
                            data?.coverLetter?.length ?? 0,
                        itemBuilder: (context, index) {
                          return AttachmentListTile(
                            title: data!.coverLetter![index].name ??
                                translate!.coverLetter,
                            onClick: () {
                              if (data?.resume?[index].url != null) {
                                openFile(
                                    url: data!.coverLetter![index].url!,
                                    fileName: data!.coverLetter?[index].name);
                              } else {
                                showSnackBar(title: translate.documentNotFound);
                              }
                            },
                            onDownloadClick: () {
                              downloadFile(
                                  url: data!.coverLetter![index].url!,
                                  fileName: data!.coverLetter?[index].name);
                            },
                          );
                        },
                      ),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const ScrollPhysics(
                            parent: NeverScrollableScrollPhysics()),
                        shrinkWrap: true,
                        itemCount: /* data.achievements?.length ?? 0*/
                            data?.resume?.length ?? 0,
                        itemBuilder: (context, index) {
                          return AttachmentListTile(
                            title:
                                data!.resume![index].name ?? translate!.resume,
                            onClick: () {
                              if (data?.resume?[index].url != null) {
                                openFile(
                                    url: data!.coverLetter![index].url!,
                                    fileName: data!.coverLetter?[index].name);
                              } else {
                                showSnackBar(title: translate.documentNotFound);
                              }
                            },
                            onDownloadClick: () {
                              downloadFile(
                                  url: data!.coverLetter![index].url!,
                                  fileName: data!.coverLetter?[index].name);
                            },
                          );
                        },
                      ),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const ScrollPhysics(
                            parent: NeverScrollableScrollPhysics()),
                        shrinkWrap: true,
                        itemCount: /* data.achievements?.length ?? 0*/
                            data?.transcipt?.length ?? 0,
                        itemBuilder: (context, index) {
                          return AttachmentListTile(
                            title: data!.transcipt![index].name ??
                                translate!.transcript,
                            onClick: () {
                              if (data?.resume?[index].url != null) {
                                openFile(
                                    url: data!.coverLetter![index].url!,
                                    fileName: data!.coverLetter?[index].name);
                              } else {
                                showSnackBar(title: translate.documentNotFound);
                              }
                            },
                            onDownloadClick: () {
                              downloadFile(
                                  url: data!.coverLetter![index].url!,
                                  fileName: data!.coverLetter?[index].name);
                            },
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: Text(translate!.oopsSomethingWentWrong),
              //TODO: make String Code dynamic
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
