import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/constants/local_storege_key.dart';
import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/models/follow_model.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:find_me/core/widget/loading.dart';
import 'package:find_me/feature/Profile/presentation/pages/profile_screen.dart';
import 'package:find_me/feature/contacts/data/model/contacts_model.dart';
import 'package:find_me/feature/contacts/data/model/search_model.dart';
import 'package:find_me/feature/contacts/presentation/cubit/contacts_cubit.dart';
import 'package:find_me/feature/contacts/presentation/cubit/search_cubit.dart';
import 'package:find_me/feature/contacts/presentation/widget/contacts_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/constants/theme_constants.dart';
import '../../../../core/widget/Input Field/custom_searchbar.dart';
import '../../../../core/widget/custom_appbar.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  TextEditingController searchController = TextEditingController();
  // String searchQuery = '';
//Query
  @override
  void initState() {
    context.read<SearchCubit>().emit(SearchInitial());
    String? userId = sharedPreferences!.getString(LocaleStorageKey.userID);
    context.read<ContactsCubit>().fetchContactList(userID: userId!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations? translate = AppLocalizations.of(context);
    return Scaffold(
      appBar: CustomAppbar(title: translate!.contacts),
      body: Padding(
        padding: primaryPadding,
        child: Column(
          children: [
            CustomSearchBar(
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
            BlocConsumer<SearchCubit, SearchState>(
              listener: (context, state) {
                if (state is SearchError) {
                  showSnackBar(title: state.errorMsg);
                }
              },
              builder: (context, state) {
                if (state is SearchInitial) {
                  return BlocConsumer<ContactsCubit, ContactsState>(
                    listener: (context, state) {
                      if (state is ContactsError) {
                        showSnackBar(title: state.errorMsg);
                      }
                    },
                    builder: (context, state) {
                      if (state is ContactsLoading) {
                        return const Loading(
                          isSmall: false,
                        );
                      } else if (state is ContactLoaded) {
                        List<ContactResult>? data = state.contactModel.result;
                        return Expanded(
                          child: ListView.builder(
                            physics: const ScrollPhysics(
                                parent: BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics())),
                            shrinkWrap: true,
                            itemCount: data?.length ?? 0,
                            itemBuilder: (context, index) {
                              Follow? contactData = data?[index].follower;
                              return ContactsListTile(
                                title: translate
                                    .translate(contactData?.name ?? ""),
                                subTitle: translate
                                    .translate("${contactData?.purpleId}"),
                                leadingImage: contactData?.picture?.first.url,
                                OnMenuClick: () {
                                  cupertinoNavigator(
                                      screenName: ProfileScreen(
                                    followUserID: contactData?.followId,
                                  ));
                                },
                                onShareClick: () {
                                  Share.share(
                                      "$userDetailsBaseURL/${contactData?.followId}");
                                },
                              );
                            },
                          ),
                        );
                      } else if (state is ContactsError) {
                        return Center(
                          child: Text(state.errorMsg),
                        );
                      } else {
                        return Center(
                          child: Text(translate!.oopsSomethingWentWrong),
                        );
                      }
                    },
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
                          return ContactsListTile(
                            title: translate!.translate("${searchData?.name}"),
                            subTitle:
                                translate!.translate("${searchData?.purpleId}"),
                            leadingImage: (searchData!.picture!.isEmpty)
                                ? null
                                : searchData?.picture?.first.url,
                            OnMenuClick: () {
                              cupertinoNavigator(
                                  screenName: ProfileScreen(
                                followUserID: searchData?.resultId,
                              ));
                            },
                            onShareClick: () {
                              Share.share(
                                  "$userDetailsBaseURL/${searchData?.resultId}");
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
      ),
    );
  }
}
