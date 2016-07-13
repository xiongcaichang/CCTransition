

# CCTransition  快速自定义转场动画


[![Pod Version](http://img.shields.io/cocoapods/v/CCTransition.svg?style=flat)](http://cocoadocs.org/docsets/CCTransition/)
[![Pod Platform](http://img.shields.io/cocoapods/p/CCTransition.svg?style=flat)](http://cocoadocs.org/docsets/CCTransition/)
[![Pod License](http://img.shields.io/cocoapods/l/CCTransition.svg?style=flat)](https://www.apache.org/licenses/LICENSE-2.0.html)
[![Support](https://img.shields.io/badge/support-iOS%206%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)&nbsp;

<form accept-charset="UTF-8" action="/xiongcaichang/CCTransition/star" class="unstarred" data-form-nonce="b02bcf07aaf5b1ea2ad8cc6dcc5c1150b5b84916" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="j+qdJE0hJE7mz3v75NRam2o9eyoMyU6Pa9LkYDR0PcjtaqKMi38WbdpkVUVN0qke+GMpKg5BAGA29miH5rObxw==" /></div>
      <button
        class="btn btn-sm btn-with-count js-toggler-target"
        aria-label="Star this repository" title="Star xiongcaichang/CCTransition"
        data-ga-click="Repository, click star button, action:files#disambiguate; text:Star">
        <svg aria-hidden="true" class="octicon octicon-star" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74z"></path></svg>
        Star
      </button>
        <a class="social-count js-social-count" href="/xiongcaichang/CCTransition/stargazers">
          点击左边的星星给我鼓励一下吧
        </a>
        
        
        
</form>

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
