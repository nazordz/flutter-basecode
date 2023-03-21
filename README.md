# Goorita base code
This app using material design v3 and use this [builder](https://m3.material.io/theme-builder) to generated this theme.
run build runner with `flutter pub run build_runner build` after create/update model files.

## Architecture of this project: MVVM

MVVM (Model View ViewModel) is one of the most popular architectural pattern for Android App development. Basically this pattern separates User interface from business-logic and data-logic. So that it's divided into three layers: Model layer, View layer and View model layer. Let's explore it more deeply.

![mvvm](https://user-images.githubusercontent.com/3769029/137336079-1f3384d0-b9d6-4462-a2c4-4a3d2cc77e8a.png)

## Prerequisites
1. Java SDK >= v11
2. Android SDK >= v29
3. Flutter SDK >= v3.7
3. Install Get CLI [here](https://pub.dev/packages/get_cli) and add `$HOME/.pub-cache/bin` to your PATH.

## Dependecies
1. [get_cli](https://pub.dev/packages/get_cli) - CLI for Get framework
2. [get](https://pub.dev/packages/get) - Get framework
3. [freezed](https://pub.dev/packages/freezed) - JSON Serialization
4. [flutter_dotenv](https://pub.dev/packages/flutter_dotenv) - ENV configuration
5. [dio](https://pub.dev/packages/dio) - Http library
6. [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage) - Persistent Storage
7. [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) - Adapting screen and font size
8. [form_validator](https://pub.dev/packages/form_validator) - Form validator

## Getting Started
Run `flutter run`