# Flutter Helpers

Flutter helpers is a basic set of helpers that can be used to help in your any flutter projects.

**NOTE:-** Some of the helpers depends on a third party package called ```GetX``` which is providing some ```Utilities``` to be used in our helpers. So if you decided to use these helpers you will need to install ```GetX``` package in your project.

### Install the ```GetX``` package

```
flutter pub add get
```

## Helpers we have

* **```ColorPalette```:-** Color palette provides you a seperated file to manage all of your color palette to be used in your project or application.
* **```Keyboard```**:- Keyboard helper only provide a method to hide opened keyboard of the application.
* **```Sizes```**:- It provides you some spacing ```variables``` which are ```consistant``` and they provides you consistancy in sizes of the application.
* **```Snackbar```**:- It provides you ```context``` less snackbar to use in your project/application.
* **```Str```**:- It is an helper to work with ```String```s and provides you some ```String``` related helpers.
* **```TextStyl```**:- It helps you to style any text in your project it provides you some basic text formatting helpers.
* **```Utils```**:- It provides some ```String``` helpers to check ```String``` for specific condition.
* **```Validator```**:- Validator is the best helper to work with any form validation in your project. It provides you some of the basic validation methods which can be used in any form input field.


## How to use

### **ColorPalette**

Import ```Helpers.dart``` file in your page

#### Usage

```dart
import '../helpers/Helpers.dart';

Column(
    children: [
        /// Heading1 text style
        Text(
            "I am heading1", 
            style: TextStyl.heading1(context),
        ),
        /// Heading2 text style
        Text(
            "I am heading2", 
            style: TextStyl.heading2(context),
        ),
        /// Title text style
        Text(
            "I am title", 
            style: TextStyl.title(context),
        ),
        /// Body | Normal text style
        Text(
            "I am body", 
            style: TextStyl.body(context),
        ),
        /// Body SM (slightly smaller than body) text style
        Text(
            "I am bodySm", 
            style: TextStyl.bodySm(context),
        ),
        /// Button text style
        TextButton(
            onPressed: () {},
            child: Text(
                "I am a button",
                style: TextStyl.button(context),
            ),
        ),
    ]
)
```

If you want to override the default style you still can override them.

### Overriding

```dart
import '../helpers/Helpers.dart';

Column(
    children: [
        /// Title text style
        Text(
            "I am title", 
            style: TextStyl.title(context)?.copyWith(
                color: kcPrimary,
            ), // Here we have override default title color and also used our ColorPalette Helper
        ),
        /// Body | Normal text style
        Text(
            "I am body", 
            style: TextStyl.body(context)?.copyWith(
                color: kcDarkAlt,
                fontWeight: FontWeight.w600,
            ), // Here we have override default body color and also used our ColorPalette Helper
        ),
        /// Button text style
        TextButton(
            onPressed: () {},
            child: Text(
                "I am a button",
                style: TextStyl.button(context),
            ),
        ),
    ]
)
```