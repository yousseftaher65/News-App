import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_pojo/bloc/cubit.dart';
import 'package:news_pojo/bloc/states.dart';
import 'package:news_pojo/ui/widgets/articals_fragment.dart';

class NewsCategoryBody extends StatelessWidget {
  final String categoryName;
  final Function onTap;

  const NewsCategoryBody(
      {super.key, required this.categoryName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    //var data = snapshot.data!.sources;
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeCubit()..getSources(categoryName),
        child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {
            if (state is GetSourcesLoadingState) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.transparent,
                    content: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              );
            } else if (state
                    is GetSourcesErrorState /* ||
                state is GetArticalsErrorState */
                ) {
              showDialog(
                context: context,
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AlertDialog(
                        title: Text('Error'),
                        content: Center(
                          child: Text(
                            //'failed'.tr(),
                            state.error,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              onTap();
                            },
                            child: Text(
                              'Go To Home',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            }
          },
          builder: (context, state) {
            var bloc = BlocProvider.of<HomeCubit>(context);
            var data = bloc.sourcesResponse?.sources;
            return DefaultTabController(
              length: data?.length ?? 0,
              initialIndex: bloc.selectedTabIndex,
              child: Column(
                children: [
                  TabBar(
                    dividerColor: Colors.transparent,
                    indicatorColor: Theme.of(context).secondaryHeaderColor,
                    labelColor: Theme.of(context).secondaryHeaderColor,
                    isScrollable: true,
                    onTap: (index) {
                      bloc.changeSelectedTab(index);
                    },
                    tabs: data?.map((e) => Tab(text: e.name)).toList() ?? [],
                  ),
                  ArticalsFragment(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
