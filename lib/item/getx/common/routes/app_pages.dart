import 'package:fly/item/getx/common/middleware/router_auth.dart';
import 'package:fly/item/getx/pages/404/index.dart';
import 'package:fly/item/getx/pages/dependencyLazyPut/bindings.dart';
import 'package:fly/item/getx/pages/dependencyLazyPut/index.dart';
import 'package:fly/item/getx/pages/dependencyPutFind/index.dart';
import 'package:fly/item/getx/pages/home/index.dart';
import 'package:fly/item/getx/pages/list/index.dart';
import 'package:fly/item/getx/pages/list_details.dart/index.dart';
import 'package:fly/item/getx/pages/login/index.dart';
import 'package:fly/item/getx/pages/my/index.dart';
import 'package:fly/item/getx/pages/state_getBuilder/index.dart';
import 'package:fly/item/getx/pages/state_getx/index.dart';
import 'package:fly/item/getx/pages/state_obx/index.dart';
import 'package:fly/item/getx/pages/state_workers/index.dart';
import 'package:fly/item/getx/pages/valueBuilder/index.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.home;
  static final unknownRoute = GetPage(
    name: AppRoutes.notFound,
    page: () => const NotfoundView(),
  );

  static final routes = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      children: [
        GetPage(
          name: AppRoutes.list,
          page: () => const ListView(),
          children: [
            GetPage(
              name: AppRoutes.listDetails,
              transition: Transition.leftToRight,
              page: () => const ListDetailsView(),
            ),
            GetPage(
              name: AppRoutes.listDetailsDynamicId,
              page: () => const ListDetailsView(),
            ),
          ],
        ),
        GetPage(
          name: AppRoutes.stateObx,
          page: () => StateObxView(),
        ),
        GetPage(
          name: AppRoutes.stateGetx,
          page: () => stateGetxView(),
        ),
        GetPage(
          name: AppRoutes.stateGetBuilder,
          page: () => StateGetBuilderView(),
        ),
        GetPage(
          name: AppRoutes.stateValueBuilder,
          page: () => const StateValueBuilderView(),
        ),
        GetPage(
          name: AppRoutes.stateWorks,
          page: () => StateWorksView(),
        ),
        GetPage(
          name: AppRoutes.dependencyPutFind,
          page: () => DependencyPutFindView(),
        ),
        GetPage(
          name: AppRoutes.dependencyLazyPut,
          binding: DependencyLazyPutBindings(),
          page: () => const DependencyLazyPutView(),
        ),
      ],
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
    ),
    GetPage(
      name: AppRoutes.my,
      page: () => const MyView(),
      middlewares: [
        RouteAuthMiddleware(priority: 1),
      ],
    ),
  ];
}
