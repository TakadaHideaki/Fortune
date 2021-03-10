import Foundation
import Firebase


protocol LoginDelegate {
    func result(result: LoginResult)
}

enum LoginResult {
    case success
    case failure(String)
}
struct Login {
    
    private var delegate: LoginDelegate?
    
    
    func login(email: String, password: String) {
        let signin = UserDefaults.standard.bool(forKey: Constants.signup)
        
        if signin != true {
            //サインアップしていない
        } else {
            //signUp中
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
              //guard let strongSelf = self else { return }
                if let error = error {
                    self.delegate?.result(result:LoginResult
                                            .failure(error.localizedDescription))
                } else {
                    UserDefaults.standard.set(true, forKey: Constants.login )
                    self.delegate?.result(result:LoginResult.success)
                }
            }
            
            
        }
        
    }
    
}
