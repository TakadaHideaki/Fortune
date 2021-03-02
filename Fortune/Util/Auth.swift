import Foundation
import FirebaseAuth

class Auth {
    static func signUp(email: String, pass: String, failure:@escaping (String) -> Void, success:@escaping () -> Void) {

        Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
            if error == nil, let user = user {
            print(user)
            } else {
                if let errCode = AuthErrorCode(rawValue: error!._code) {
                    switch errCode {
                    case .invalidEmail: failure("メールアドレスの形式が違います。")
                    case .emailAlreadyInUse: failure("このメールアドレスはすでに使われています。")
                    case .weakPassword: failure("パスワードは6文字以上で入力してください。")
                    default: failure("エラーが起きました。\nしばらくしてから再度お試しください。")

                    }
                }
            }


    }
}
}


