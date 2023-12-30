import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/widget/Input%20Field/custom_searchbar.dart';
import 'package:find_me/core/widget/custom_appbar.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:find_me/core/widget/loading.dart';
import 'package:find_me/feature/Profile/presentation/pages/profile_screen.dart';
import 'package:find_me/feature/settings_features/followRequest/data/models/search_model.dart';
import 'package:find_me/feature/settings_features/followRequest/presentation/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widget/follow_request_list_tile.dart';

class FollowRequestScreen extends StatefulWidget {
  const FollowRequestScreen({super.key});

  @override
  State<FollowRequestScreen> createState() => _FollowRequestScreenState();
}

class _FollowRequestScreenState extends State<FollowRequestScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    context.read<SearchCubit>().emit(SearchInitial());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations? translate = AppLocalizations.of(context);
    return Scaffold(
      appBar: CustomAppbar(title: translate!.followRequest),
      body: Column(
        children: [
          Padding(
            padding: primaryPadding,
            child: CustomSearchBar(
              searchController: searchController,
              onChanged: (searchValue) {
                if (searchValue == null || searchValue == "") {
                  context.read<SearchCubit>().emit(SearchInitial());
                } else {
                  context
                      .read<SearchCubit>()
                      .searchFollow(query: searchValue ?? "");
                }
              },
            ),
          ),
          BlocConsumer<SearchCubit, SearchState>(
            listener: (context, state) {
              if (state is SearchError) {
                showSnackBar(title: state.errorMsg);
              }
            },
            builder: (context, state) {
              if (state is SearchInitial) {
                return Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return FollowRequestListTile(
                          title: translate!.translate('Mustafa Jamail'),
                          subTitle: translate!.translate('@Mustaja'),
                          leadingImage:
                              "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3569&q=80",
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: AppColors.lightGrey2,
                          thickness: 1,
                          height: 0,
                        );
                      },
                      itemCount: 10),
                );
              } else if (state is SearchLoading) {
                return const Loading(
                  isSmall: false,
                );
              } else if (state is SearchLoaded) {
                if (state.searchModel.result?.isEmpty ?? false) {
                  return const Center(
                    child: Text("No data Found"),
                  );
                } else {
                  return Expanded(
                    child: ListView.separated(
                      itemCount: state.searchModel.result?.length ?? 0,
                      itemBuilder: (context, index) {
                        SearchResult? searchData =
                            state.searchModel.result?[index];
                        return FollowRequestListTile(
                          title: translate!.translate("${searchData?.name}"),
                          subTitle:
                              translate!.translate("${searchData?.purpleId}"),
                          leadingImage: (searchData!.picture!.isEmpty)
                              ? null
                              : searchData?.picture?.first.url,
                          onTap: () {
                            cupertinoNavigator(
                                screenName: ProfileScreen(
                              followUserID: searchData?.resultId,
                            ));
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: AppColors.lightGrey2,
                          thickness: 1,
                          height: 0,
                        );
                      },
                    ),
                  );
                }
              } else {
                return Text(translate.oopsSomethingWentWrong);
              }
            },
          ),
        ],
      ),
    );
    ;
  }
}
