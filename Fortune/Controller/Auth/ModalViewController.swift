import UIKit
import Firebase

class ModalViewController: UIViewController {
    
    var signup: SignUp?
    var customTextField: CustomTextField?
    var securityBtnClick = true
    var securityButton = UIButton(type: .custom)
    let eye = UIImage(systemName: "eye")?
        .withTintColor(.lightGray,
                       renderingMode: .alwaysOriginal)
    let slashEye = UIImage(systemName: "eye.slash")?
        .withTintColor(.lightGray,
                       renderingMode: .alwaysOriginal)

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField! //{
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mailTextField.text = ""
        passwordTextField.text = ""
        
        if self.parent != nil {
            addblurEffect()
        }
    }
    
    func addblurEffect() {
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
        mailTextField.becomeFirstResponder()
        
        customTextField = CustomTextField()
        setInitialUI()
        addPasswordEyeButton(textField: passwordTextField)

    }
    func setInitialUI() {
        passwordTextField.isSecureTextEntry = true
        customTextField?.textFieldIconSet(textField: userNameTextField, image: Icon.user)
        customTextField?.textFieldIconSet(textField: mailTextField, image: Icon.meail)
        customTextField?.textFieldIconSet(textField: passwordTextField, image: Icon.passWord)
        
    }
    
    
    @IBAction func signupBtnTapped(_ sender: Any) {
        
//        guard let un = userNameTextField.text,
//              let e = mailTextField.text,
//              let p = passwordTextField.text else {return}
//
//        self.signup?.signUp(email: e, pass: p, name: un, failure: { (error) in
//            self.alert(title: "エラー", msg: error, action: "OK")
//        }) {
//            log.debug("Auth_All_OK")
//            let presentVC = self.presentingViewController as! SignupVC
//
//            presentVC.userName = un
        parent?.view.removeFromSuperview()
            self.dismiss(animated: true, completion: nil)
//        }
    }
}

extension ModalViewController {
    
 

    
    //add securityButton on the Right
    func addPasswordEyeButton(textField: UITextField) {
        
        

        let button: UIButton = {
            let button = UIButton()
            button.setImage(slashEye, for: .normal)
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
        let securityBtnImage = securityBtnClick ? slashEye: eye
        securityButton.setImage(securityBtnImage, for: .normal)



    }
    

}


extension ModalViewController: UITextFieldDelegate {
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

