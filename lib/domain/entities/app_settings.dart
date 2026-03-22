class AppSettings {
  final bool isDarkMode;

  AppSettings({
    this.isDarkMode = false,
  });

  AppSettings copyWith({
    bool? isDarkMode,
  }) {
    return AppSettings(
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}
