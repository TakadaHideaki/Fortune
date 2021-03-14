import Foundation
import Firebase
import FirebaseStorage

protocol ProfileModelDelegate {
    func failure(result: String?)
    func success()
}

enum a {
    case success, filure
}

struct ProfileModel {
    var user: User?
    var icon: UIImage?
    var displayName: String?
    private let storageRef = Storage.storage().reference()
    private var delegate: ProfileModelDelegate?
    
    init(displayName: String?, icon: UIImage?, user: User?) {
        self.displayName = displayName
        self.icon = icon
        self.user = user
    }
    
    //画像をStoregeへUplodeしてURLを取得する
    func uploadToStorege() {
        guard let uid = user?.uid,
              let imageData = icon?.jpegData(compressionQuality: 0.3)
        else {
            return
                userProfileChangeRequest(photoURL: nil)
        }
        
        let imageRef = storageRef.child("images/\(uid).jpg")
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        imageRef.putData(imageData, metadata: metadata) { (metadata, error) in
            
            guard let _ = metadata
            else {
                return
                    userProfileChangeRequest(photoURL: nil)
            }
            
            imageRef.downloadURL { (url, error) in
                if error != nil {
                    delegate?.failure(result: "err")
                } else {
                    guard let photoURL = url
                    else {
                        return
                            userProfileChangeRequest(photoURL: nil)
                    }
                    userProfileChangeRequest(photoURL: photoURL)
                }
            }
        }
    }
    
    //firebaseAuthにプロフィールをdisplayNameを登録
    //StoregeからGetしたImageURLを登録
    private func userProfileChangeRequest(photoURL: URL?) {
        
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
    
        changeRequest?.displayName = displayName
        changeRequest?.photoURL = photoURL
        changeRequest?.commitChanges { (error) in
            if let error = error as NSError? {
                switch (StorageErrorCode(rawValue: error.code)!) {
                case .cancelled:
                    delegate?.failure(result: "err")
                default:
                    delegate?.failure(result: error.localizedDescription)
                }
            } else {
                delegate?.success()
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
}

