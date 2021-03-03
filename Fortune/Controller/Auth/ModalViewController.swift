import UIKit
import Firebase

class ModalViewController: UIViewController {
    
    var signup: SignUp?
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mailTextField.text = ""
        passwordTextField.text = ""

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.signup = SignUp()
        mailTextField.delegate = self
        passwordTextField.delegate = self
//        configureObserver()
        mailTextField.becomeFirstResponder()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    
    @IBAction func signupBtnTapped(_ sender: Any) {
        guard let un = userNameTextField.text,
              let e = mailTextField.text,
              let p = passwordTextField.text else {return}
        
        self.signup?.signUp(email: e, pass: p, name: un, failure: { (error) in
            self.alert(title: "エラー", msg: error, action: "OK")
        }) {
            log.debug("Auth_All_OK")
            let vc = self.presentingViewController as! SignupVC
            vc.userName = un
            self.dismiss(animated: true, completion: nil)
        }
    }
}


extension ModalViewController: UITextFieldDelegate {
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

