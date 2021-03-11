 import UIKit
 import Validator

class LoginVC: UIViewController {
    
    @IBOutlet weak private var emailTF: UITextField!
    @IBOutlet weak private var passwordTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    var loginModel: Login?
    private var customTF: CustomTextField?
    private var securityBtnClick = true
    private var securityButton = UIButton(type: .custom)
    private var validation: Validation?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emailTF.text = ""
        passwordTF.text = ""
        
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
        
        emailTF.delegate = self
        passwordTF.delegate = self
        emailTF.becomeFirstResponder()
    }
    
    private func initTF() {
        customTF = CustomTextField()
        //textField左にアイコン設置
        customTF?.textFieldIconSet(textField: emailTF, image: Icon.meail)
        customTF?.textFieldIconSet(textField: passwordTF, image: Icon.passWord)
        //passwordを伏字化
        passwordTF.isSecureTextEntry = true
        //伏せ字Btn設置
        addSecurityBtn(textField: passwordTF)
        //validationCheck
        validation = Validation(email_TextField: emailTF,
                                password_TextField: passwordTF)
        validation?.validationCheck()
    }



    
    
    @IBAction func loginBtnTap(_ sender: Any) {
        guard let e = emailTF.text,
              let p = passwordTF.text
        else {return}
        loginModel = Login()
        loginModel?.login(email: e, password: p)
    }
    


}
 
 extension LoginVC {
    
        
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
            passwordTF.isSecureTextEntry.toggle()
            let securityBtnImage = securityBtnClick ? Icon.slashEye.icon: Icon.eye.icon
            securityButton.setImage(securityBtnImage, for: .normal)
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
 
 extension LoginVC: UITextFieldDelegate {
         
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         textField.resignFirstResponder()
         return true
     }
 }

