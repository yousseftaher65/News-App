import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_pojo/bloc/cubit.dart';
import 'package:news_pojo/bloc/states.dart';
import 'package:news_pojo/ui/widgets/artical_item.dart';
import 'package:news_pojo/ui/widgets/description_sheet.dart';

class ArticalsFragment extends StatelessWidget {
  final ScrollController scrollController;
  const ArticalsFragment({
    super.key,
    required this.scrollController
  });

  @override
  Widget build(BuildContext context) {
    //var article = snapshot.data!.articles![index];
    final cubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is GetArticalsLoadingState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                  backgroundColor: Colors.transparent,
                  content: Center(child: CircularProgressIndicator()));
            },
          );
        } else if (state is GetArticalsErrorState) {
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
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    content: Center(
                      child: Text(
                        state.error,
                        //'failed'.tr(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Close',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        } else if (state is GetArticalsSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        // var bloc = BlocProvider.of<HomeCubit>(context);
        var snapshot = cubit.newsResponse?.articles ?? [];
        return Expanded(
          child: ListView.separated(
              controller: scrollController,
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
              itemCount: snapshot.length,
              separatorBuilder: (context, index) => SizedBox(height: 8.h),
              itemBuilder: (context, index) {
                var article = snapshot[index];
                return GestureDetector(
                  onTap: () async {
                    await showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (context) => DescriptionSheet(
                        description: article.description,
                        image: article.urlToImage ?? "",
                      ),
                    );
                  },
                  child: ArticalItem(
                    image: article.urlToImage,
                    author: article.author,
                    date: article.publishedAt,
                    title: article.title,
                  ),
                );
              }),
        );
      },
    );
  }
}
