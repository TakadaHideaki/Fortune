 import UIKit

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    var loginModel: Login?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    @IBAction func loginBtnTap(_ sender: Any) {
        guard let e = emailTF.text,
              let p = passwordTF.text
        else {return}
        loginModel = Login()
        loginModel?.login(email: e, password: p)
        
        
    }
    


}
 
 extension LoginVC: LoginDelegate {
    func result(result: LoginResult) {
        switch result {
        case .success:
            self.dismiss(animated: true, completion: nil)
        case .failure(let i):
            alert(title: "Error", msg: i, actionTitle: "ok")
        }
    }
    
    
 }
