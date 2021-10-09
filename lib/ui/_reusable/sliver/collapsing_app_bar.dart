import 'package:flutter/material.dart';
import 'package:sanf/presentation/reusable/network_image_loader.dart';
import 'package:sanf/values/colors.dart';

class CollapsingAppBar extends StatefulWidget {
  final double expandedHeight;
  final ValueNotifier<double> collapsingAppBarNotifier;
  final double scrollDistance;
  final double paddingTopOfTitle;
  final String title;
  final String imageUrl;

  const CollapsingAppBar({
    Key? key,
    required this.expandedHeight,
    required this.collapsingAppBarNotifier,
    required this.scrollDistance,
    required this.paddingTopOfTitle,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  _CollapsingAppBarState createState() => _CollapsingAppBarState();
}

class _CollapsingAppBarState extends State<CollapsingAppBar> {
  double _topConstraint = 0.0;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      brightness: Brightness.dark,
      backgroundColor: colorPrimary,
      elevation: 0.0,
      expandedHeight: widget.expandedHeight,
      floating: false,
      title: _appBarTitle(),
      pinned: true,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          _topConstraint = constraints.biggest.height;
          return Stack(
            children: [
              FlexibleSpaceBar(
                background: ShowImageUrlWidget(
                  imageUrl: widget.imageUrl,
                ),
              ),
              Visibility(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: widget.paddingTopOfTitle,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.0),
                        topRight: Radius.circular(24.0),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
                /**if top constraint > (status bar height + toolbar height)*/
                visible: (_topConstraint >
                    MediaQuery.of(context).padding.top + kToolbarHeight),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _appBarTitle() {
    return ValueListenableBuilder(
      valueListenable: widget.collapsingAppBarNotifier,
      builder: (BuildContext context, double value, Widget? child) {
        /**if collapsingOffset > (image height - toolbar height)*/
        if (value >= widget.scrollDistance) {
          return Text(
            widget.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
