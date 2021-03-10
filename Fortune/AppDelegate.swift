import UIKit
import Firebase
import GoogleSignIn
import Stripe


let stripePublicKey = "pk_test_51INAFRCUTuKKKoWWsqqDlJ2uRD5OUHy8VRcDGq7uNLSjF0iXvrVDUXOyke2WgXjkEaI6A3w3aavKEIaFeFyuYWAT00yGPCRGUP"

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
//        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
//        GIDSignIn.sharedInstance().delegate = self
        StripeAPI.defaultPublishableKey = stripePublicKey
        
//        window = UIWindow(frame: UIScreen.main.bounds)
//        // Or "Admin"
//        window!.rootViewController = UIStoryboard(name: "SignupVC", bundle: nil).instantiateInitialViewController()!
//        window!.makeKeyAndVisible()
      //firebase.auth().currentUser

        
//        if Auth.auth().currentUser != nil {
//            log.debug("ログイン中")
//        } else {
//            log.debug("ログアウト中")
//        }
        
        UserDefaults.standard.register(defaults: [Constants.signup : false,
                                                  Constants.login: false])

        
        
        
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }


}

