import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_pojo/bloc/cubit.dart';
import 'package:news_pojo/bloc/states.dart';
import 'package:news_pojo/ui/widgets/artical_item.dart';
import 'package:news_pojo/ui/widgets/description_sheet.dart';

class ArticalsFragment extends StatelessWidget {
  const ArticalsFragment({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    //var article = snapshot.data!.articles![index];
    final cubit = HomeCubit.get(context);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
           // var bloc = BlocProvider.of<HomeCubit>(context);
            var snapshot = cubit.newsResponse?.articles ?? [];
            if (state is GetArticalsLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is GetArticalsErrorState) {
              return Center(
                  child: Text(
                'failed'.tr(),
                style: Theme.of(context).textTheme.titleLarge,
              ));
            } else {
              return ListView.separated(
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
                  });
            }
          },
        ),
      ),
    );
  }
}
