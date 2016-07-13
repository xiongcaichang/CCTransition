

# CCTransition  快速自定义转场动画


[![Pod Version](http://img.shields.io/cocoapods/v/CCTransition.svg?style=flat)](http://cocoadocs.org/docsets/CCTransition/)
[![Pod Platform](http://img.shields.io/cocoapods/p/CCTransition.svg?style=flat)](http://cocoadocs.org/docsets/CCTransition/)
[![Pod License](http://img.shields.io/cocoapods/l/CCTransition.svg?style=flat)](https://www.apache.org/licenses/LICENSE-2.0.html)
[![Support](https://img.shields.io/badge/support-iOS%206%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)&nbsp;


###截图


<img src="https://github.com/xiongcaichang/CCTransition/blob/master/demo.gif" alt="Drawing" width="300px" />







## 开始(Getting started)

* 使用 cocopods ( Using CocoaPods)
  

  ```
	pod 'CCTransition', '~> 1.0.0'
  ```


* 常规使用   (Using narmal)

   将   CCTransition  文件夹拖入项目

### Basic usage

 1. 自定义导航控制器转场

 创建一个 `CCNavigationController` 实例 
给控制器设置一种转场类型


 ```objc

	 CCNavigationController *navigationController = [[CCNavigationController alloc] initWithRootViewController:viewController];

	 CCLayerAnimation *layerAnimation = [[CCLayerAnimation alloc] initWithType:CCLayerAnimationCover];
	 navigationController.animationController = layerAnimation;
 ```

  如果你是用 storyBord,  请确保你的控制器被 `CCNavigationController`管理

 * 使用方法, 你可以在 `viewDidLoad` 添加以下代码

 ```objc
     //初始化控制器
    CCNavigationController *fancyNavigationController = (CCNavigationController *)self.navigationController;
    //初始化动画效果
    CCLayerAnimation *layerAnimation = [[CCLayerAnimation alloc] initWithType:CCLayerAnimationCover];
    //设置动画效果
    fancyNavigationController.animationController = layerAnimation;
 ```

 2. 自定义 Modal  转场

  确保你用来 modal 的控制器是 `CCViewController` 的子类


 ```objc

   //初始化用来 modal 操作控制器   一般是 self 
    CCMainViewController *mainController = [[CCMainViewController alloc] initWithNibName:@"CCMainViewController" bundle:nil];
     //初始化动画效果
    CCSlideAnimation *slideAnimation = [[CCSlideAnimation alloc] init];
    slideAnimation.type = CCSlideAnimationFromTop;
    //设置动画效果
    mainController.animationController = slideAnimation;


   //初始化被 Modal 出的控制器
    CCModalViewController *modalController = [[CCModalViewController alloc] initWithNibName:@"CCModalViewController" bundle:nil];
    //设置代理
    modalController.transitioningDelegate = mainController.transitioningDelegate;
    
    //进行 Modal 操作
    [modalController.navigationController presentViewController:viewController animated:YES completion:nil];

 ```
 
 
 3. 交互


 ```objc

    //导航动画交互
    navigationController.interactionEnabled = YES;

    // 模态奇偶奥胡
    mainViewController.interactionEnabled = YES;
 ```
