

CCTransition  快速自定义转场动画

![Demo](https://raw.githubusercontent.com/xiongcaichang/CCTransition/master/Demo.gif)


## (开始)Getting started

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


 ```Objective-C

	 CCNavigationController *navigationController = [[CCNavigationController alloc] initWithRootViewController:viewController];

	 CCLayerAnimation *layerAnimation = [[CCLayerAnimation alloc] initWithType:CCLayerAnimationCover];
	 navigationController.animationController = layerAnimation;
 ```

  如果你是用 storyBord,  请确保你的控制器被 `CCNavigationController`管理

 * 使用方法, 你可以在 `viewDidLoad` 添加以下代码

 ```Objective-C
    CCNavigationController *fancyNavigationController = (CCNavigationController *)self.navigationController;
    CCLayerAnimation *layerAnimation = [[CCLayerAnimation alloc] initWithType:CCLayerAnimationCover];
    fancyNavigationController.animationController = layerAnimation;
 ```

 2. 自定义 Modal  转场

  确保你用来 modal 的控制器是 `CCViewController` 的子类


 ```Objective-C


    CCMainViewController *mainController = [[CCMainViewController alloc] initWithNibName:@"CCFirstViewController" bundle:nil];
    CCSlideAnimation *slideAnimation = [[CCSlideAnimation alloc] init];
    slideAnimation.type = CCSlideAnimationFromTop;
    mainController.animationController = slideAnimation;


    CCModalViewController *modalController = [[CCModalViewController alloc] initWithNibName:@"CCModalViewController" bundle:nil];
    modalController.transitioningDelegate = mainController.transitioningDelegate; // this is important for the transition to work
    [modalController.navigationController presentViewController:viewController animated:YES completion:nil];

 ```
 
 
 3. 交互


 ```Objective-C

    //导航动画交互
    navigationController.interactionEnabled = YES;

    // 模态奇偶奥胡
    mainViewController.interactionEnabled = YES;
 ```
