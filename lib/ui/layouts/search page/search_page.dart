import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_pojo/bloc/cubit.dart';
import 'package:news_pojo/bloc/states.dart';
import 'package:news_pojo/repository/home_repo.dart';
import 'package:news_pojo/ui/widgets/artical_item.dart';
import 'package:news_pojo/ui/widgets/description_sheet.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocProvider(
              create: (context) => HomeCubit(HomeRepo())..performSearch(controller.text),
              child: BlocConsumer<HomeCubit, HomeStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  var bloc = context.read<HomeCubit>();
                  // var bloc = BlocProvider.of<HomeCubit>(context);
                  var articles = bloc.newsResponse?.articles ?? [];
                  return Column(
                    children: [
                      TextField(
                        onSubmitted: (value) {
                          // Update the cubit's query and call maybePerformSearch
                          //final cubit = context.read<HomeCubit>();
                          bloc.query = value;
                          bloc.maybePerformSearch();
                        },
                        controller: controller,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onDoubleTap: () => Navigator.pop(context),
                            child: IconButton(
                              onPressed: () {
                                // Clear the controller and trigger a search (if needed)
                                controller.clear();
                                // final cubit = context.read<HomeCubit>();
                                bloc.query = '';
                                bloc.maybePerformSearch();
                              },
                              icon: Icon(Icons.close,
                                  color:
                                      Theme.of(context).secondaryHeaderColor),
                            ),
                          ),
                          prefixIcon: IconButton(
                            onPressed: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              // Update and call maybePerformSearch when the search icon is tapped
                              //final cubit = context.read<HomeCubit>();
                              bloc.query = controller.text;
                              bloc.maybePerformSearch();
                            },
                            icon: Icon(Icons.search,
                                color: Theme.of(context).secondaryHeaderColor),
                          ),
                          hintText: "search".tr(),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      BlocConsumer<HomeCubit, HomeStates>(
                        listener: (context, state) {
                          if (state is GetArticalsErrorState ||
                              state is GetSearchErrorState) {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AlertDialog(
                                      title: Text(
                                        'Error',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      content: Center(
                                        child: Text(
                                          //state.error,
                                          'failed'.tr(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Close',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
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
                          if (state is GetSearchLoadingState ||
                              state is GetArticalsLoadingState) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return Expanded(
                            child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 8.h),
                              itemCount: articles.length,
                              itemBuilder: (context, index) {
                                var data = articles[index];
                                return GestureDetector(
                                  onTap: () async {
                                    await showDialog(
                                      context: context,
                                      builder: (context) {
                                        return DescriptionSheet(
                                            description: data.description,
                                            image: data.urlToImage);
                                      },
                                    );
                                  },
                                  child: ArticalItem(
                                      image: data.urlToImage,
                                      title: data.title,
                                      author: data.author,
                                      date: data.publishedAt),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
