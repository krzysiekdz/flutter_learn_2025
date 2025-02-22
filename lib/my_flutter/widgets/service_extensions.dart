enum WidgetsServiceExtensions {
  /// Name of service extension that, when called, will output a string
  /// representation of this app's widget tree to console.
  ///
  /// See also:
  ///
  /// * [WidgetsBinding.initServiceExtensions], where the service extension is
  ///   registered.
  debugDumpApp,

  /// Name of service extension that, when called, will output a string
  /// representation of the focus tree to the console.
  ///
  /// See also:
  ///
  /// * [WidgetsBinding.initServiceExtensions], where the service extension is
  ///   registered.
  debugDumpFocusTree,

  /// Name of service extension that, when called, will overlay a performance
  /// graph on top of this app.
  ///
  /// See also:
  ///
  /// * [WidgetsApp.showPerformanceOverlayOverride], which is the flag
  ///   that this service extension exposes.
  /// * [WidgetsBinding.initServiceExtensions], where the service extension is
  ///   registered.
  showPerformanceOverlay,

  /// Name of service extension that, when called, will return whether the first
  /// 'Flutter.Frame' event has been reported on the Extension stream.
  ///
  /// See also:
  ///
  /// * [WidgetsBinding.initServiceExtensions], where the service extension is
  ///   registered.
  didSendFirstFrameEvent,

  /// Name of service extension that, when called, will return whether the first
  /// frame has been rasterized and the trace event 'Rasterized first useful
  /// frame' has been sent out.
  ///
  /// See also:
  ///
  /// * [WidgetsBinding.initServiceExtensions], where the service extension is
  ///   registered.
  didSendFirstFrameRasterizedEvent,

  /// Name of service extension that, when called, will reassemble the
  /// application.
  ///
  /// See also:
  ///
  /// * [WidgetsBinding.initServiceExtensions], where the service extension is
  ///   registered.
  fastReassemble,

  /// Name of service extension that, when called, will change the value of
  /// [debugProfileBuildsEnabled], which adds [Timeline] events for every widget
  /// built.
  ///
  /// See also:
  ///
  /// * [debugProfileBuildsEnabled], which is the flag that this service extension
  ///   exposes.
  /// * [WidgetsBinding.initServiceExtensions], where the service extension is
  ///   registered.
  profileWidgetBuilds,

  /// Name of service extension that, when called, will change the value of
  /// [debugProfileBuildsEnabledUserWidgets], which adds [Timeline] events for
  /// every user-created widget built.
  ///
  /// See also:
  /// * [debugProfileBuildsEnabledUserWidgets], which is the flag that this
  ///   service extension exposes.
  /// * [WidgetsBinding.initServiceExtensions], where the service extension is
  ///   registered.
  profileUserWidgetBuilds,

  /// Name of service extension that, when called, will change the value of
  /// [WidgetsApp.debugAllowBannerOverride], which controls the visibility of the
  /// debug banner for debug mode apps.
  ///
  /// See also:
  ///
  /// * [WidgetsApp.debugAllowBannerOverride], which is the flag that this service
  ///   extension exposes.
  /// * [WidgetsBinding.initServiceExtensions], where the service extension is
  ///   registered.
  debugAllowBanner,
}
