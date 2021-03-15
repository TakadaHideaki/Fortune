import Foundation
import Firebase

struct SignOut {
    
    func signOut(handler: @escaping (String?) -> Void) {
        let user = Auth.auth().currentUser
        user?.delete { error in
            if let error = error {
                handler(error.localizedDescription)
            } else {
                handler(nil)
            }
        }
    }
}
