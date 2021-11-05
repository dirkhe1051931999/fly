/// 首页
import 'package:flutter/material.dart';
import 'package:fly/shell/model/homelist.dart';
import 'package:fly/shell/values/app_theme.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  List<HomeList> homeList = HomeList.homeList;
  AnimationController? animationController;
  bool multiple = true;

  @override
  void initState() {
    // 首页页面元素加载动画
    animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(
      const Duration(milliseconds: 1000),
      () => 'Data loaded',
    );
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: FutureBuilder<bool>(
        /*异步数据来动态更新UI*/
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            // 没数据的loading动画
            return Center(
              child: Column(
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 156),
                    child: Text('加载中...'),
                  )
                ],
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  appBar(),
                  Expanded(
                    /*Expanded widget 组件含义：创建一个扩展 [Row]、[Column] 或 [Flex] 子项的小部件，以便子项沿着 flex 小部件的主轴填充可用空间。 */
                    child: GridView(
                      padding:
                          const EdgeInsets.only(top: 0, left: 12, right: 12),
                      physics:
                          const BouncingScrollPhysics() /*允许滚动偏移超出内容边界的环境的滚动物理，然后将内容弹回到这些边界的边缘 */,
                      scrollDirection: Axis.vertical,
                      children: List<Widget>.generate(
                        /*列表遍历，渲染列表*/
                        homeList.length,
                        (int index) {
                          final int count = homeList.length;
                          final Animation<double> animation =
                              Tween<double>(begin: 0.0, end: 1.0).animate(
                            /*将非线性曲线应用于动画对象*/
                            CurvedAnimation(
                              parent: animationController!,
                              curve: Interval(
                                (1 / count) * index,
                                1.0,
                                curve: Curves.fastOutSlowIn,
                              ),
                            ),
                          );
                          animationController?.forward();
                          return HomeListView(
                            animation: animation,
                            animationController: animationController,
                            listData: homeList[index],
                            callBack: () {
                              Navigator.push<dynamic>(
                                context,
                                // 安卓和ios的route过渡
                                MaterialPageRoute<dynamic>(
                                  builder: (BuildContext context) {
                                    return homeList[index].navigateScreen!;
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                      // 在横轴上创建具有固定数量图块的网格布局
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: multiple ? 2 : 1,
                        mainAxisSpacing: 12.0,
                        crossAxisSpacing: 12.0,
                        childAspectRatio: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget appBar() {
    return SizedBox(
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: SizedBox(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
            ),
          ),
          // appbar标题
          const Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  'Flutter Fly',
                  style: TextStyle(
                    fontSize: 22,
                    color: AppTheme.darkText,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          // appbar右边的按钮
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              color: Colors.white,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius:
                      BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    multiple ? Icons.dashboard : Icons.view_agenda,
                    color: AppTheme.darkGrey,
                  ),
                  onTap: () {
                    setState(() {
                      multiple = !multiple;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeListView extends StatelessWidget {
  const HomeListView({
    Key? key,
    this.listData,
    this.callBack,
    this.animationController,
    this.animation,
  }) : super(key: key);

  final HomeList? listData;
  final VoidCallback? callBack;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        // FadeTransition 淡入淡出动画
        return FadeTransition(
          opacity: animation!,
          // Transform
          child: Transform(
            // x y z
            transform: Matrix4.translationValues(
              0.0,
              50 * (1.0 - animation!.value),
              0.0,
            ),
            child: AspectRatio(
              // 横纵比
              aspectRatio: 1.5,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    // 创建一个将左、上、右和下设置为 0.0 的定位对象，除非传递了它们的值。
                    Positioned.fill(
                      child: Image.asset(
                        listData!.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        /*响应触摸的材料的矩形区域。 */
                        splashColor: Colors.grey.withOpacity(0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4.0)),
                        onTap: callBack,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
