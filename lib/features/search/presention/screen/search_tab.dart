import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart' show CachedNetworkImage;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_c17_me/core/resources/colors_app.dart';
import 'package:movie_c17_me/core/resources/image&icon.dart';
import 'package:movie_c17_me/core/resources/style_app.dart';
import 'package:movie_c17_me/di.dart';
import 'package:movie_c17_me/features/search/presention/bloc/saerch_event.dart';
import 'package:movie_c17_me/features/search/presention/bloc/search_bloc.dart';
import 'package:movie_c17_me/features/search/presention/bloc/search_state.dart';
import '../../../details/presentation/widgets/similar_gridView.dart';

class SearchTab extends StatelessWidget {
  SearchTab({super.key});
  TextEditingController controller = TextEditingController();
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchBloc>(),
      child: BlocConsumer<SearchBloc, SearchState>(
        builder: (context, state) {
          final movies = state.searchModel?.data?.movies;

          if (state.SearchStatus == RequestStatus.error) {
            return Center(
              child: Text(
                state.errorMassage.toString(),
                style: TextStyle(color: Colors.red),
              ),
            );
          }

          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      textInputAction: TextInputAction.search,
                      onFieldSubmitted: (value) {
                        context.read<SearchBloc>().add(getSearchEvent(value));
                        FocusScope.of(context).unfocus();
                      },
                      onChanged: (value) {
                        if (_debounce?.isActive ?? false) _debounce!.cancel();
                        _debounce = Timer(Duration(milliseconds: 500), () {
                          if (value.trim().isNotEmpty) {
                            context.read<SearchBloc>().add(getSearchEvent(value.trim()));
                          }
                        });
                      },
                      controller: controller,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(13.h),
                          child: ImageIcon(
                            AssetImage(IconApp.searchIc),
                            color: Colors.white,
                            size: 24.h,
                          ),
                        ),
                        hintText: 'Search',
                        hintStyle: StyleApp.smText,
                        fillColor: ColorsApp.sceondry,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    movies == null || movies.isEmpty
                        ? SizedBox(
                      height: 500.h,
                      child: Center(
                        child: Image.asset(ImageApp.emptyList),
                      ),
                    )
                        : GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 3,
                        mainAxisSpacing: 37.h,
                        crossAxisSpacing: 37.w,
                      ),
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final searchList = movies[index];

                        return Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.r),
                              child: CachedNetworkImage(
                                imageUrl: searchList. largeCoverImage??'',
                                placeholder: (context, url) => CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              ),
                            ),
                            Positioned(
                              top: 8.h,
                              left: 8.w,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(18, 19, 18, 0.71),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      searchList.rating?.toString() ?? '',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    SizedBox(width: 4.w),
                                    ImageIcon(
                                      AssetImage(IconApp.star),
                                      color: ColorsApp.primaryGold,
                                      size: 16.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, SearchState state) {},
      ),
    );
  }
}