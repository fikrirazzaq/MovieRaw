import 'package:flutter/material.dart';
import 'package:sanf/presentation/reusable/sliver/collapsing_app_bar.dart';
import 'package:sanf/presentation/reusable/sliver/sliver_body.dart';

class SliverViewWidget extends StatefulWidget {
  final Widget body;
  final String title;
  final String imageUrl;

  const SliverViewWidget({
    Key? key,
    required this.body,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  _SliverViewWidgetState createState() => _SliverViewWidgetState();
}

const double _silverAppBarExtendedHeight = 300.0;
const double _paddingTopOfTitle = 20.0;

class _SliverViewWidgetState extends State<SliverViewWidget> {
  final _scrollDistance = _silverAppBarExtendedHeight - kToolbarHeight;
  ValueNotifier<double> _collapsingAppBarNotifier = ValueNotifier(0.0);
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      _collapsingAppBarNotifier.value = _scrollController.offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        CollapsingAppBar(
          title: widget.title,
          imageUrl: widget.imageUrl,
          expandedHeight: _silverAppBarExtendedHeight,
          paddingTopOfTitle: _paddingTopOfTitle,
          scrollDistance: _scrollDistance,
          collapsingAppBarNotifier: _collapsingAppBarNotifier,
        ),
        SliverBody(
          child: widget.body,
        ),
      ],
    );
  }
}
