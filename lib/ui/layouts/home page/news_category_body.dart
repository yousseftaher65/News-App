import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_pojo/bloc/cubit.dart';
import 'package:news_pojo/bloc/states.dart';
import 'package:news_pojo/ui/widgets/articals_fragment.dart';

class NewsCategoryBody extends StatelessWidget {
  final String categoryName;

  const NewsCategoryBody({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    //var data = snapshot.data!.sources;
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeCubit()..getSources(categoryName),
        child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var bloc = BlocProvider.of<HomeCubit>(context);
            var data = bloc.sourcesResponse?.sources;
            if (state is GetSourcesLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is GetSourcesErrorState ||
                state is GetArticalsErrorState) {
              return Center(
                child: Text(
                  'failed'.tr(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              );
            } else {
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
                    ArticalsFragment(
                        //homeCubit: bloc,
                        ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
