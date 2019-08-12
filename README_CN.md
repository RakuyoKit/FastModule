# FastModule

> 这个项目只提供一个可行性的方法，并将其实现出来。它可能不够简洁优雅，但是我仍希望它可以帮到你。

使用 Ruby 脚本快速创建可用于组件化的 Swift 基础项目。

本项目根据我个人的习惯和需求简化了许多步骤，所以看起来不是那么灵活，甚至是难以改造，以符合您的需求的。但是不要担心， “使用方法” 介绍了最简单的使用步骤，另外通过阅读源码，相信您也可以快速的改造本项目，以符合您的需求。 

说到这里，有必要提一下 “我个人的习惯”： 

1. 我所有的项目都使用 Swift 编写，所以本项目没有提供 Objective-C 的模板代码。

2. 对于每个组件，我几乎都会创建两个项目：`ExampleModule` 和 `ExampleModuleRouter`,

3. 我使用同一个 `Workspace` 管理上述两个项目，并使用 `CocoaPods` 管理依赖。

4.  `ExampleModuleRouter` 依赖了 [URLNavigator](https://github.com/devxoul/URLNavigator)，作为模块的**路由组件**。

5.  `ExampleModule`  会依赖  `ExampleModuleRouter`，具体的内容可以参考本项目的 [Podfile](https://github.com/rakuyoMo/FastModule/blob/master/Podfile) 文件

# 使用方法

1. `fork` 本项目, 然后根据您的需求修改模板项目 (记得将 [fast_create_module.rb](https://github.com/rakuyoMo/FastModule/blob/master/fast_create_module.rb) 文件内的 模板项目的 git 地址替换为您  `fork` 后的地址  )

```ruby
def clone_template

  # 修改该地址为您 fork 后的仓库地址
  `git clone -b develop https://github.com/rakuyoMo/FastModule.git`
  
end
```

2. 在 GitHub 或其他代码仓库平台，创建您的组件化项目，并将其克隆到本地

3. 打开命令行，使用 `cd` 命令进入到第二步所克隆的项目的路径下

4. 执行 `ruby fast_create_module.rb`，或其他方法执行这个脚本

稍等片刻，您就可以得到一个配置好的基础项目了。

# 举个例子

举个例子，现在我需要一个名为 `ExampleModule` 的组件：

1. `fork` 本项目，并在 [fast_create_module.rb](https://github.com/rakuyoMo/FastModule/blob/master/fast_create_module.rb) 中修改 URL 地址。  

2. 将本项目克隆到本地，例如到桌面：`/Users/rakuyo/Desktop`

2. 打开 GitHub 并且创建一个名为 `ExampleModule` 的项目，它的 URL 看起来像是：`https://github.com/rakuyoMo/ExampleModule.git`

3. 克隆这个项目到本地，它的本地路径看起来是：`/Users/rakuyo/Desktop/ExampleModule`

4. `cd /Users/rakuyo/Desktop/ExampleModule`

5. `ruby /Users/rakuyo/Desktop/FastModule/fast_create_module.rb`

当脚本执行完毕时，如果一切顺利，`ExampleModule` 的项目目录看起来会是下面这样：

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

# 说在最后

我仅仅是一个 iOS 开发者，除了一些基本的 CocoaPods 操作外，几乎没有接触过 Ruby，所以这个项目可能会有很多不足之处。

如果您发现了什么问题，或者有什么意见和建议，欢迎提 `issues` 给我。

最后由衷的希望本项目可以帮助到您。
