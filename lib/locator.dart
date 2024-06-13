

import 'package:get_it/get_it.dart';
import 'package:stacked_node/services/appconfig_service.dart';
import 'package:stacked_node/services/navigator_service.dart';

import 'helper/firebase_remote_helper.dart';
import 'helper/update_checker.dart';

GetIt locator = GetIt.instance;

// PreferenceService get preferenceService => locator<PreferenceService>();
 NavigationService get navigationService => locator<NavigationService>();
// AppConfigService get appConfigService => locator<AppConfigService>();
// DialogService get dialogService => locator<DialogService>();
// RememberPreference get rememberService => locator<RememberPreference>();
//
// EventBusService get eventBusService => locator<EventBusService>();

void setupLocator() {
  // locator.registerLazySingleton(() => FirebaseRemoteHelper());
   locator.registerLazySingleton(() => AppConfigService());
  // locator.registerLazySingleton(() => DialogService());
  // locator.registerLazySingleton(() => PreferenceService());
  // locator.registerLazySingleton(() => NetworkService());
   locator.registerLazySingleton(() => NavigationService());
  // locator.registerLazySingleton(() => PageStorageService());
  // locator.registerLazySingleton(() => PushNotificationService());
  // locator.registerLazySingleton(() => RememberPreference());
  // locator.registerLazySingleton(() => PermissionService());
  // locator.registerLazySingleton(() => UpdateChecker());
  // locator.registerLazySingleton(() => EventBusService());
  // locator.registerLazySingleton(() => AnalyticsService());



}
