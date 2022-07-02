# money_manager

The idea of the app is have a record of bank accounts, wallet, credit card, services, and grocery app.

For now, only works as grocery app or shopping list, in the future I want to add the all stuff.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## MobX

To update the files generated, example: `**.g.dart`

Run this command: `flutter pub run build_runner build --delete-conflicting-outputs`

## Flutter Launcher Icons

Run the package to generate new icons
```
flutter pub get
flutter pub run flutter_launcher_icons:main
```

[Package page](https://pub.dev/packages/flutter_launcher_icons)

# Testing

Generate file with all project for coverage (I used into Ubuntu)
```
file=test/coverage_helper_test.dart

echo "// Helper file to make coverage work for all dart files\n" > $file

echo "// ignore_for_file: unused_import" >> $file

find lib -not -name '*.g.dart' -and -not -name 'generated_plugin_registrant.dart' -and -name '*.dart' | cut -c4- | awk -v package="money_manager" '{printf "import '\''package:%s%s'\'';\n", package, $1}' >> $file

echo "void main(){}" >> $file
```

Run command `flutter test --coverage`, this will run the all test in folder `test/` and generate new file in `coverage/lcov.info`

I'm generate a html files with genhtml reading the lcov.info

```
# Remove output to update all files
rm -R coverage/output

# Update lcov.info to remove *g.dart
# Files generated from `flutter pub run build_runner`
lcov --remove coverage/lcov.info 'lib/modules/**/*.g.dart' -o coverage/lcov.info

# Generate new output for coverage
genhtml coverage/lcov.info -o coverage/output
```
