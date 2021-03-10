import Foundation
import Firebase

protocol SignupDelegate {
    func result(result: SignupResult)
}

enum SignupResult {
    case success
    case failure(String)
}

struct SignUp {
    
    private var delegate: SignupDelegate?
    
    func signUp(email: String, pass: String, name: String) {
        
        Auth.auth().createUser(withEmail: email, password: pass) { (result, error) in
            if error == nil , let user = result?.user {
                self.createUserInfo(uid: user.uid, docDate: ["name" : name])
                
            } else {
                if let errCode = AuthErrorCode(rawValue: error!._code) {
                    switch errCode {
                    case .invalidEmail:
                        self.delegate?.result(result: SignupResult
                                                .failure("メールアドレスの形式が違います。"))
                    case .emailAlreadyInUse:
                        self.delegate?.result(result:SignupResult
                                                .failure("このメールアドレスはすでに使われています。"))
                    case .weakPassword:
                        self.delegate?.result(result:SignupResult
                                                .failure("パスワードは6文字以上で入力してください。"))
                    default:
                        self.delegate?.result(result:SignupResult
                                                .failure("エラーが起きました。\nしばらくしてから再度お試しください。"))
                        
                    }
                }
            }
        }
    }
    
    // FirestoreへuserNmaeを登録
    func createUserInfo(uid: String, docDate: [String : Any]) {
        
        let ref = Firestore.firestore().collection("users")
        ref.document(uid).setData(docDate) { (error) in
            if let error = error {
                // ユーザー情報の登録失敗
                log.debug("Error: Firestore")
                self.delegate?.result(result:SignupResult
                                        .failure(error.localizedDescription))
            }
            // ユーザー情報の登録完了
            log.debug("Success: Firestore")
            UserDefaults.standard.set(true, forKey: Constants.signup)
            self.delegate?.result(result:SignupResult.success)
        }
    }
    
}

//
//
//
//func signUp(email: String, pass: String, name: String,
//            failure: @escaping (String) -> Void,
//            success: @escaping () -> Void) {
//
//    Auth.auth().createUser(withEmail: email, password: pass) { (result, error) in
//        if error == nil , let user = result?.user {
//
//            self.createUserInfo(uid: user.uid,
//                                docDate: ["name" : name],
//                                failure: { (error) in
//                                    log.debug("auth: 成功、useName: 登録失敗")
//                                    failure(error)
//                                }) {
//                log.debug("auth: 成功　userName: 成功")
//                success()
//            }
//
//        } else {
//            if let errCode = AuthErrorCode(rawValue: error!._code) {
//                switch errCode {
//                case .invalidEmail: failure("メールアドレスの形式が違います。")
//                case .emailAlreadyInUse: failure("このメールアドレスはすでに使われています。")
//                case .weakPassword: failure("パスワードは6文字以上で入力してください。")
//                default: failure("エラーが起きました。\nしばらくしてから再度お試しください。")
//
//                }
//            }
//        }
//    }
//}
//
//// FirebaseFirestoreuserNameを保存
//func createUserInfo(uid: String, docDate: [String : Any],
//                    failure: @escaping (String) -> Void,
//                    success: @escaping () -> Void) {
//
//    let ref = Firestore.firestore().collection("users")
//    ref.document(uid).setData(docDate) { (error) in
//        if let error = error {
//            // ユーザー情報の登録失敗
//            log.debug("Error: Firestore")
//            failure(error.localizedDescription)
//        }
//        // ユーザー情報の登録完了
//        log.debug("Success: Firestore")
//        success()
//    }
//}
