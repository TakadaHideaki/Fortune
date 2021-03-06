import UIKit
import Stripe

class SignupVC: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    var userName = "ゲスト様"

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        userNameLabel.text = userName
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    @IBAction func signupTapped(_ sender: Any) {
        
        let sb = UIStoryboard(name: "modal", bundle: nil)
        let modalVC = sb.instantiateViewController(withIdentifier: "modal") 
        modalVC.modalPresentationStyle = .custom //.custom →UIPresentationController
        modalVC.transitioningDelegate = self
        present(modalVC, animated: true, completion: nil)
     
    }
    
   
    
    @IBAction func stripeBtnTapped(_ sender: Any) {
        
        let sb = UIStoryboard(name: "Profile", bundle: nil)
        let modalVC = sb.instantiateViewController(withIdentifier: "Profile")
        modalVC.modalPresentationStyle = .custom //.custom →UIPresentationController
        modalVC.transitioningDelegate = self
        present(modalVC, animated: true, completion: nil)
        
        
        
        
        
        
        
//        let customerId = "firestoreから取得"
//        let customerContext = STPCustomerContext(keyProvider: StripeProvider(customerId: customerId))
//        paymentContext = STPPaymentContext(customerContext: customerContext)
//        paymentContext!.delegate = self
//        paymentContext!.hostViewController = self
//        paymentContext!.paymentAmount = 5000
//        paymentContext!.presentPaymentOptionsViewController()
    }
    
    
    @IBAction func mypage(_ sender: Any) {
        
        let sb = UIStoryboard(name: "MyPage", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MyPageVC")
        let nv = UINavigationController(rootViewController: vc)
        nv.modalPresentationStyle = .fullScreen
        present(nv, animated: true, completion: nil)
    }
    
    
    
}

extension SignupVC: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CustomPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
