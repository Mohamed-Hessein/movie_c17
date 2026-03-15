import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_c17_me/core/resources/style_app.dart';
import 'package:movie_c17_me/di.dart';
import 'package:movie_c17_me/features/browser/persentation/bloc/browser_bloc.dart';
import 'package:movie_c17_me/features/browser/persentation/bloc/browser_event.dart';
import 'package:movie_c17_me/features/search/data/model/search_model.dart';

import '../../../../core/resources/colors_app.dart';
import '../../../../core/resources/image&icon.dart';
import '../widget/chips_list_view.dart';
import '../widget/grid_view_browser.dart';

class ExploreTab extends StatelessWidget {
   ExploreTab({super.key, });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BrowserBloc>()..add(getBrowserChips()),
      child: SafeArea(
        child: SingleChildScrollView(child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ChipsListview(),
      GridViewCustomBrowser(),

        ],),),
      ),
    );
  }
}

