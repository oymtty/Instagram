
import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = UIColor(red: 1.0, green: 0.44, blue: 0.11, alpha: 1)// アイコンの色
        self.tabBar.barTintColor = UIColor(red: 0.96, green: 0.91, blue: 0.87, alpha: 1)// バーの背景色
        self.delegate = self// UITabBarControllerDelegateプロトコルのメソッドをこのクラスで処理
    }
    // アイコンがタップされた時に呼ばれるdelegateメソッドを処理
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is ImageSelectViewController {
            let imageSelectViewController = storyboard!.instantiateViewController(withIdentifier: "ImageSelect")//タブ切り替えではなくモーダル画面遷移
            present(imageSelectViewController, animated: true)
            return false
        } else {
            return true// その他のViewControllerは通常のタブ切り替えを実施
        }
    }

}
