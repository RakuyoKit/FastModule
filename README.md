# FastModule

> [In Chiness](https://github.com/rakuyoMo/FastModule/blob/master/README_CN.md)

> This project only provides a viable method and implements it. It may not be simple and elegant, but I still hope it will help you.

Quickly create Swift base projects for componentization using Ruby scripts and template projects.

This project simplifies many steps based on my personal habits and needs, so it doesn't look so flexible or even difficult to adapt to suit your needs. But don't worry, "Usage Method" introduces the easiest steps to use, and by reading the source code, I believe you can also quickly transform the project to meet your needs.

Having said that, it is necessary to mention "my personal habits":

1. All of my projects are written in Swift, so this project does not provide Objective-C template code.

2. For each component, I will almost always create two projects: `ExampleModule` and `ExampleModuleRouter`,

3. I use the same `Workspace` to manage the above two projects and use `CocoaPods` to manage dependencies.

4. `ExampleModuleRouter` depends on [URLNavigator](https://github.com/devxoul/URLNavigator) as the module's **routing component**.

5. `ExampleModule` will depend on `ExampleModuleRouter`. For details, please refer to [Podfile](https://github.com/rakuyoMo/FastModule/blob/master/Podfile) file of this project.

# Usage

1. `fork` this project, then modify the template project according to your needs (remember to replace the git url of the template project in the [fast_create_module.rb](https://github.com/rakuyoMo/FastModule/blob/master/fast_create_module.rb) with the url after your `fork`)

```ruby
def clone_template

  # Change to your git url
  `git clone -b develop https://github.com/rakuyoMo/FastModule.git`
  
end
```

2. On GitHub or other code repository hosts, create your component repo and clone it.

3. Open the command line and `cd` to the directory of the project cloned in the second step.

4. `ruby fast_create_module.rb` or other methods to execute this script.

After a while, you will get a configured base project.

# Example

For example, now I need a component called `ExampleModule`:

1. `fork` this project and modify the URL in the [fast_create_module.rb](https://github.com/rakuyoMo/FastModule/blob/master/fast_create_module.rb).

2. Clone the project locally, for example to the desktop: `/Users/rakuyo/Desktop`

3. Open GitHub and create a project called `ExampleModule` with an url like this: `https://github.com/rakuyoMo/ExampleModule.git`

4. Clone this project to the local, the path is probably like this: `/Users/rakuyo/Desktop/ExampleModule`

5. `cd /Users/rakuyo/Desktop/ExampleModule`

5. `ruby /Users/rakuyo/Desktop/FastModule/fast_create_module.rb`

When the script finishes executing, if everything goes well, the project directory of `ExampleModule` will look like this:

```
.
├── LICENSE
├── ExampleModule
│   ├── ExampleModule
│   ├── ExampleModule.xcodeproj
│   ├── Tests
│   └── UITests
├── ExampleModule.xcworkspace
├── ExampleModuleRouter
│   ├── ExampleModuleRouter
│   ├── ExampleModuleRouter.xcodeproj
│   └── Tests
├── Podfile
├── Podfile.lock
├── Pods
│   ├── Headers
│   ├── Local\ Podspecs
│   ├── URLNavigator
│   └── URLNavigator.xcodeproj
└── README.md
```

# Why is Ruby?

Speaking of this, it is also the result of exploration... At first, there was no idea about this demand. Later I learned about CocoaPods open source [Xcodeproj](https://github.com/CocoaPods/Xcodeproj).

Initially, I plan to use `Xcodeproj` to create two projects, then configure the project content and add it to `Workspace`. After practice, it was found to be very complicated...

Later, referring to the implementation of `pod lib create`, use the template project instead.

That's it, I didn't use `Xcodeproj` in the end, but the script has already been written, and that's it...

# At the end

I'm just an iOS developer. I've barely touched Ruby except for some basic CocoaPods operations, so this project may have a lot of deficiencies.

If you find something wrong, or have any comments or suggestions, please feel free to give me `issues`.

Finally, I sincerely hope that this project can help you.
