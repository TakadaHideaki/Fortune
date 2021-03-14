
import UIKit

class CustomNavigationController: UINavigationController {

    // 1. イニシャライザ
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }

    // 2. イニシャライザ
    override init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?) {
        super.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
    }

    // イニシャライザ
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    // 必須イニシャライザ
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // 簡易イニシャライザ (1. 2. をまとめ便利にしたもの)
    convenience init(rootViewController:UIViewController , navigationBarClass:AnyClass?, toolbarClass: AnyClass?){
        self.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
        self.viewControllers = [rootViewController]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // 他にすることがある場合
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
