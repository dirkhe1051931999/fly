import 'package:flutter/material.dart';
import 'package:fly/shell/custom_drawer/home_drawer.dart';
import 'package:fly/shell/values/app_theme.dart';

class DrawerUserController extends StatefulWidget {
  const DrawerUserController({
    Key? key,
    this.drawerWidth = 250,
    this.onDrawerCall,
    this.screenView,
    this.animatedIconData = AnimatedIcons.arrow_menu,
    this.menuView,
    this.drawerIsOpen,
    this.screenIndex,
  }) : super(key: key);

  final double drawerWidth;
  final Function(DrawerIndex)? onDrawerCall;
  final Widget? screenView;
  final Function(bool)? drawerIsOpen;
  final AnimatedIconData? animatedIconData;
  final Widget? menuView;
  final DrawerIndex? screenIndex;

  @override
  _DrawerUserControllerState createState() => _DrawerUserControllerState();
}

class _DrawerUserControllerState extends State<DrawerUserController>
    with TickerProviderStateMixin {
  ScrollController? scrollController;
  AnimationController? iconAnimationController;
  AnimationController? animationController;

  double scrolloffset = 0.0;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    iconAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 0));
    iconAnimationController?.animateTo(1.0,
        duration: const Duration(milliseconds: 0), curve: Curves.fastOutSlowIn);
    // 抽屉滚动监听事件
    scrollController =
        ScrollController(initialScrollOffset: widget.drawerWidth);
    scrollController!.addListener(
      () {
        if (scrollController!.offset <= 0) {
          if (scrolloffset != 1.0) {
            setState(() {
              scrolloffset = 1.0;
              try {
                widget.drawerIsOpen!(true);
              } catch (_) {}
            });
          }
          iconAnimationController?.animateTo(0.0,
              duration: const Duration(milliseconds: 0),
              curve: Curves.fastOutSlowIn);
        } else if (scrollController!.offset > 0 &&
            scrollController!.offset < widget.drawerWidth.floor()) {
          iconAnimationController?.animateTo(
              (scrollController!.offset * 100 / (widget.drawerWidth)) / 100,
              duration: const Duration(milliseconds: 0),
              curve: Curves.fastOutSlowIn);
        } else {
          if (scrolloffset != 0.0) {
            setState(() {
              scrolloffset = 0.0;
              try {
                widget.drawerIsOpen!(false);
              } catch (_) {}
            });
          }
          iconAnimationController?.animateTo(1.0,
              duration: const Duration(milliseconds: 0),
              curve: Curves.fastOutSlowIn);
        }
      },
    );
    WidgetsBinding.instance?.addPostFrameCallback((_) => getInitState());
    super.initState();
  }

  Future<bool> getInitState() async {
    scrollController?.jumpTo(
      widget.drawerWidth,
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: SingleChildScrollView(
        // 可以在其中滚动单个小部件的框。
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        physics: const PageScrollPhysics(parent: ClampingScrollPhysics()),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width + widget.drawerWidth,
          //使用 with 作为屏幕宽度并添加 drawerWidth（来自 navigation_home_screen）
          child: Row(
            children: <Widget>[
              // 抽屉content
              SizedBox(
                width: widget.drawerWidth,
                //将第一个抽屉宽度与 HomeDrawer 和第二个全屏宽度与所有主屏幕分开，我们称为屏幕视图
                height: MediaQuery.of(context).size.height,
                child: AnimatedBuilder(
                  animation: iconAnimationController!,
                  builder: (BuildContext context, Widget? child) {
                    return Transform(
                      //用于稳定抽屉的变换，不需要随着滚动视图移动
                      transform: Matrix4.translationValues(
                        scrollController!.offset,
                        0.0,
                        0.0,
                      ),
                      child: HomeDrawer(
                        screenIndex: widget.screenIndex ?? DrawerIndex.home,
                        iconAnimationController: iconAnimationController,
                        callBackIndex: (DrawerIndex indexType) {
                          onDrawerClick();
                          try {
                            widget.onDrawerCall!(indexType);
                          } catch (e) {
                            print(e);
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
              // 内容页和箭头
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                //带 widget.screenView 的全屏宽度
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: AppTheme.grey.withOpacity(0.6),
                          blurRadius: 24),
                    ],
                  ),
                  child: Stack(
                    children: <Widget>[
                      // 打开抽屉,screenView 无法点击,只能触摸
                      //这个 IgnorePointer 用作触摸（用户界面）widget.screen 视图，例如 scrolloffset == 1 表示抽屉已关闭，我们只允许触摸所有 widget.screen 视图
                      IgnorePointer(
                        ignoring: scrolloffset == 1 || false,
                        child: widget.screenView,
                      ),
                      //widget.screen 的替代触摸（用户界面），例如，抽屉已关闭，需要点击一些主屏幕区域并关闭抽屉
                      if (scrolloffset == 1.0)
                        InkWell(
                          onTap: () {
                            onDrawerClick();
                          },
                        ),
                      // 这只是菜单和箭头图标动画
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top + 8,
                          left: 8,
                        ),
                        child: SizedBox(
                          width: AppBar().preferredSize.height - 8,
                          height: AppBar().preferredSize.height - 8,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(
                                AppBar().preferredSize.height,
                              ),
                              child: Center(
                                // if you use your own menu view UI you add form initialization
                                child: widget.menuView ??
                                    AnimatedIcon(
                                      icon: widget.animatedIconData ??
                                          AnimatedIcons.arrow_menu,
                                      progress: iconAnimationController!,
                                    ),
                              ),
                              onTap: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                onDrawerClick();
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onDrawerClick() {
    //如果 scrollcontroller.offset != 0.0 设置关闭抽屉（用动画偏移零位置）如果不是 1 然后打开抽屉
    if (scrollController!.offset != 0.0) {
      scrollController?.animateTo(
        0.0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      scrollController?.animateTo(
        widget.drawerWidth,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    }
  }
}
