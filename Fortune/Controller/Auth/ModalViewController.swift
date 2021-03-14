import UIKit
import Firebase
import Validator

class ModalViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var signup: SignUp?
    private var customTF: CustomTextField?
    private var securityBtnClick = true
    private var securityButton = UIButton(type: .custom)
    private var validation: Validation?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mailTextField.text = ""
        passwordTextField.text = ""
        
        if self.parent != nil {
            addBlurEffect()
        }
    }
    
    func addBlurEffect() {
        let blurEffect = UIBlurEffect(style: .regular)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = self.view.frame
        parent?.view.addSubview(visualEffectView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mailTextField.delegate = self
        passwordTextField.delegate = self
//        configureObserver()
        userNameTextField.becomeFirstResponder()
        
        initTF()
    }
        
     private func initTF() {
        customTF = CustomTextField()
        //textField左にアイコン設置
        customTF?.textFieldIconSet(textField: userNameTextField, image: Icon.paerson)
        customTF?.textFieldIconSet(textField: mailTextField, image: Icon.meail)
        customTF?.textFieldIconSet(textField: passwordTextField, image: Icon.passWord)
        //passwordを伏字化
        passwordTextField.isSecureTextEntry = true
        //伏せ字Btn設置
        addSecurityBtn(textField: passwordTextField)
        //validationCheck
        validation = Validation(name_TextField: userNameTextField,
                                email_TextField: mailTextField,
                                password_TextField: passwordTextField)
        validation?.validationCheck()
    }
    
    
    @IBAction func signupBtnTapped(_ sender: Any) {
        
//        guard let un = userNameTextField.text,
//              let e = mailTextField.text,
//              let p = passwordTextField.text else {return}
//
//        self.signup?.signUp(email: e, pass: p, name: un , failure: { (error) in
//            self.alert(title: "エラー", msg: error, action: "OK")
//        }) {
//            log.debug("Auth_All_OK")
//            let presentVC = self.presentingViewController as! SignupVC
//
//            presentVC.userName = un
        
        //        self.signup?.signUp(email: e, pass: p, name: un)
        parent?.view.removeFromSuperview()
            self.dismiss(animated: true, completion: nil)
//        }
    }
}

extension ModalViewController {
    
    //add securityButton on the Right
    func addSecurityBtn(textField: UITextField) {
        
        let button: UIButton = {
            let button = UIButton()
            button.setImage(Icon.slashEye.icon, for: .normal)
            button.imageEdgeInsets = UIEdgeInsets(top: 5, left: -16, bottom: 5, right: 0)
            let textFieldWidth = textField.frame.size.width
            button.frame = CGRect(x: textFieldWidth - 25, y: 5, width: 30, height: 30)
            
            button.addTarget(self,
                             action: #selector(buttonEvent(_:)),
                             for: .touchUpInside)

            return button
        }()
        securityButton = button
        textField.rightView = securityButton
        textField.rightViewMode = .always
    }
    
    @objc func buttonEvent(_ sender: UIButton) {
        securityBtnClick.toggle()
        passwordTextField.isSecureTextEntry.toggle()
        let securityBtnImage = securityBtnClick ? Icon.slashEye.icon: Icon.eye.icon
        securityButton.setImage(securityBtnImage, for: .normal)
    }
    

}


extension ModalViewController: UITextFieldDelegate {
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension ModalViewController: SignupDelegate {
    func result(result: SignupResult) {
        switch result {
        case .success:
            self.dismiss(animated: true, completion: nil)
        case .failure(let i):
            alert(title: "Error", msg: i, actionTitle: "ok")
        }
    }
    
    
}

