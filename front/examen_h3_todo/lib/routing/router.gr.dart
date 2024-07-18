// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddProfileScreen(),
      );
    },
    EditTaskRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditTaskScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LoadDataRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoadDataScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    SelectProjectRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SelectProjectScreen(),
      );
    },
    SignupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignupScreen(),
      );
    },
  };
}

/// generated route for
/// [AddProfileScreen]
class AddProfileRoute extends PageRouteInfo<void> {
  const AddProfileRoute({List<PageRouteInfo>? children})
      : super(
          AddProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditTaskScreen]
class EditTaskRoute extends PageRouteInfo<void> {
  const EditTaskRoute({List<PageRouteInfo>? children})
      : super(
          EditTaskRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditTaskRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoadDataScreen]
class LoadDataRoute extends PageRouteInfo<void> {
  const LoadDataRoute({List<PageRouteInfo>? children})
      : super(
          LoadDataRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoadDataRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SelectProjectScreen]
class SelectProjectRoute extends PageRouteInfo<void> {
  const SelectProjectRoute({List<PageRouteInfo>? children})
      : super(
          SelectProjectRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectProjectRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignupScreen]
class SignupRoute extends PageRouteInfo<void> {
  const SignupRoute({List<PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
