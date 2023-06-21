# FlutterFusion

A starter project to begin any new flutter project.
It has the `GetX` package and some more custom made helpers and packages to help the dev to build their apps with ease.
It uses the `MVC` pattern which is one of the best pattern among developers.

### Getting Started

#### Clone the repository

```shell
git clone https://github.com/thedevsbuddy/flutter_fusion.git myAwesomeProject
```

#### Now remove git from your project.
- Change working directory to `myAwesomeProject` (if not already).
    ```shell
    cd myAwesomeProject
    ```
- Delete `.git` directory.
    ```shell
    rm -rf .git
    ```

#### Initialize your own repository

You can now initialize your own repositry for your project.

### Features

Here are some awesome features which you will get by default when scaffolding your project with this starting project.

- **MVCs Pattern**: We are using MVC pattern to manage whole project easily as it separates the Logic and UI and models. But i added new layer as Service which will help us communicate with APIs.
- **Modular Structure**: Most of the developers are the fan of Modular Structure as it gives the flexibility to use a module on any project we build.
- **Module Generator Tool**: I have built a simple module generator tool to help you generate any module with just a single command.
- **Mock-Able Services**: Sometimes we don't have any api to test and build our apps so we need to do some mockups for apps here we cover that as well.

## New features

#### Modulr Package - Generate modules in the project

This package is added as a helper toolkit to generate the module in the project with just a command
line.

### Generate Module

```shell
flutter pub run modulr:generate Blog
```

This will generate all the files required for a `Module`

Generated Files Inside your project's `lib/app/modules` directory.

```txt
📂 Blog
├── 📂 controllers
│   └── 📄 BlogController.dart
├── 📂 routes
│   ├── 📄 BlogRouter.dart
│   └── 📄 BlogRoutes.dart
├── 📂 services
│   ├── 📄 AppBlogService.dart
│   ├── 📄 BlogService.dart
│   └── 📄 MockBlogService.dart
├── 📂 views
│   └── 📄 BlogPage.dart
└── 📄 BlogModule.dart
```


### Generate Controller

```shell
flutter pub run modulr:controller Comment --on=Blog
```

This will generate the new controller (`CommentController.dart`) inside the `Blog` Module.

```txt
📂 Blog
├── 📂 controllers
│   ├── 📄 BlogController.dart
│   └── 📄 CommentController.dart
```

### Generate Service

```shell
flutter pub run modulr:service Comment --on=Blog
```

If any module doesn't have services already you can generate services for the module using this command.

Generated Files:

```txt
📂 Blog
├── 📂 services
│   ├── 📄 AppCommentService.dart
│   ├── 📄 CommentService.dart
│   └── 📄 MockCommentService.dart
```

**_Note: This will check for the services directory inside the provided module name. if it exists it wont generate any file and return void._**
