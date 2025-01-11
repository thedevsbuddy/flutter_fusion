# FlutterFusion

A starter project to begin any new flutter project.
It has the `GetX` package and some more custom helpers and packages to help the dev to build their apps with ease.
It uses the `MVC` pattern which is one of the best pattern among developers.

### Getting Started

Clone the repository

```shell
git clone https://github.com/thedevsbuddy/flutter_fusion.git my_awesome_project
```

**Note:- Know about the _[ThemeBuilder\*](#theme-builder)_**

### Features

Here are some awesome features which you will get by default when scaffolding your project with this starting project.

- **MVCs Pattern**: We are using `MVC` pattern to manage whole project easily as it separates the Logic and UI and models. But i added new layer as Service which will help us communicate with APIs.
- **Modular Structure**: Most of the developers are the fan of Modular Structure as it gives the flexibility to use a module on any project we build.
- **Module Generator Tool**: I have built a simple module generator tool to help you generate any module with just a single command.
- **Mock-Able Services**: Sometimes we don't have any api to test and build our apps so we need to do some mockups for apps here we cover that as well.

## New features

#### Modulr Package - Generate modules in the project

This package is added as a helper toolkit to generate the module in the project with just a command
line.

## Modulr

Modulr is a code generator tool specially created for `FlutterFusion` starter kit, This helps you to generate all the files required for a Module.

### Usage of Modulr

Below is the example of how you can use this package and provided commands

1. `modulr:generate`: This is generates whole code for a module.
2. `modulr:controller`: This command generates a Controller file inside the provided module.
3. `modulr:page`: This command generates a Page/View file inside the provided module.

### Generate Module

```shell
dart pub run modulr:generate Blog
```

This will generate all the files required for a `Module`

#### Generated Files Inside your project's `lib/app/modules` directory.

```txt
📂 blog
├── 📂 controllers
│   └── 📄 blog_controller.dart
├── 📂 routes
│   ├── 📄 blog_router.dart
│   └── 📄 blog_routes.dart
├── 📂 services
│   ├── 📄 api_blog_service.dart
│   ├── 📄 blog_service.dart
│   └── 📄 local_blog_service.dart
├── 📂 views
│   └── 📄 blog_page.dart
└── 📄 blog_module.dart
```

### Generate Controller

```shell
dart pub run modulr:controller Comment --on=Blog
```

This will generate the new controller (`comment_controller.dart`) inside the `Blog` Module.

#### Generated files (including previously generated controllers)

```txt
📂 blog
├── 📂 controllers
│   ├── 📄 blog_controller.dart
│   └── 📄 comment_controller.dart
```

### Generate Page/View

```shell
flutter pub run modulr:page Comment --on=Blog
```

This will generate the new view/page (`comment_page.dart`) file inside the `Blog` Module.

#### Generated files (including previously generated views)

```txt
📂 blog
├── 📂 views
│   └── 📄 blog_page.dart
│   └── 📄 comment_page.dart
```

---

## Theme Builder

ThemeBuilder is a helper Widget created to easily manage light and dark theme for your application.

If you want to provide theming feature on your application you can select this project with ThemeBuilder so it will come with the necessary code to manage light and dark theme.
