import Foundation
import Firebase

protocol LogOutDelegate {
    func logOutError(err: String)
}

struct LogOut {
    var delegate: LogOutDelegate?

    func logout() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            delegate?.logOutError(err: signOutError.localizedDescription)
        }
    }
}
