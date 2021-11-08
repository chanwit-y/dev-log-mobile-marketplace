part of explore;

class _TabBarContent extends StatelessWidget {
  final List<Widget> tabs;
  final List<Widget> children;

  const _TabBarContent({
    Key? key,
    required this.tabs,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: this.tabs.length,
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: TabBar(
              tabs: this.tabs,
              indicator: DotIndicator(
                color: Theme.of(context).primaryColor,
                distanceFromCenter: kSpacing,
                radius: 3,
                paintingStyle: PaintingStyle.fill,
              ),
              unselectedLabelColor: kFontColorPallets[1],
              labelColor: Theme.of(context).primaryColor,
              isScrollable: true,
            ),
          ),
          SizedBox(height: kSpacing,),
          Expanded(
            child: TabBarView(
              children: this.children,
            ),
          )
        ],
      ),
    );
  }
}
