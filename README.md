# FastModule

Quickly create Swift projects for componentization using ruby

This project simplifies many steps based on my habits and needs, and makes it look less easy to configure.

This project is just to provide a workable idea, it may not be concise and elegant, but still hope to help you.

Having said that, I feel it necessary to elaborate on my "habits".

1. I manage my components with `Workspace` and `CocoaPods`

2.  All my components and projects have the same name, for example, I have a component called `ExampleModule`, then I will create a project called `ExampleModule`

3. I will create two projects, `ExampleModule` and `ExampleModuleRouter`, which serve as the routing template for this component, and then add these two items to a `Workspace`

# Usage

1. `fork` this project, then modify the template file according to your actual needs (remember to replace the repo url in  [fast_create_module.rb](https://github.com/rakuyoMo/FastModule/blob/master/fast_create_module.rb))

```ruby
def clone_template

  # Change to your git url
  `git clone -b develop https://github.com/rakuyoMo/FastModule.git`
  
end
```

2. On GitHub or other code repository hosts, create your component repo and clone it

3. Open the command line and `cd` to the directory of the project cloned in the second step.

4. `ruby fast_create_module.rb` or other methods to execute this script

Wait a moment, you will get the configured project

# Example

For example, I now need a component called `ExampleModule`

1. `fork` this project and repo url in  [fast_create_module.rb](https://github.com/rakuyoMo/FastModule/blob/master/fast_create_module.rb)

2. Open GitHub and create a project called `ExampleModule` with an url like this: `https://github.com/rakuyoMo/ExampleModule.git`

3. Clone this project to the local, the path is probably like this: `/Users/mbcore/Desktop/WorkSpace/ExampleModule`

4. `cd /Users/mbcore/Desktop/WorkSpace/ExampleModule`

5. `ruby fast_create_module.rb`

After the script is executed, if everything is successful, the directory will become like this:

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

# At the end

I am just an iOS developer and rarely touch ruby, so this project will have a lot of deficiencies, for reference only. Also welcome questions and help us improve
