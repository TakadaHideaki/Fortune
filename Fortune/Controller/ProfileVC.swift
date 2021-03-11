import UIKit
import Firebase

class ProfileVC: UIViewController {
    
    var firebaseModel: FirebaseModel?
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileBackGroundView: UIView!
    @IBOutlet weak var userNameTF: UITextField!
    
    
    let profireImage = UIImage(systemName: "person.crop.circle.badge.plus")?
        .withTintColor(.lightGray,
                       renderingMode: .alwaysOriginal)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.isUserInteractionEnabled = true
        userNameTF.becomeFirstResponder()

        initialUI()
    }
    
    
    
    private func initialUI() {
        
        profileImageView.image = profireImage
        profileBackGroundView.layer.cornerRadius = profileBackGroundView.layer.frame.size.width / 2
        
        profileBackGroundView.layer.shadowOffset = CGSize(width: 5, height: 5)
        profileBackGroundView.layer.shadowColor = UIColor.black.cgColor
        profileBackGroundView.layer.shadowOpacity = 0.3
        profileBackGroundView.layer.shadowRadius = 5
        
        userNameTF.layer.cornerRadius = 10
        userNameTF.layer.masksToBounds = false
        userNameTF.layer.shadowOffset = CGSize(width: 5, height: 5)
        userNameTF.layer.shadowColor = UIColor.black.cgColor
        userNameTF.layer.shadowOpacity = 0.3
        userNameTF.layer.shadowRadius = 5
        
    }
    
    @IBAction func profiletap(_ sender: Any) {
        log.debug("profiletap")
    }
    
    @IBAction func RegistBtnTap(_ sender: Any) {
        log.debug("regist　Tap")
        let displayName = userNameTF.text ?? "ゲスト"
        var image: UIImage?
        if profileImageView.image == profireImage {
            image = nil
        } else {
            image = profireImage
        }
        firebaseModel = FirebaseModel()
        
       //(displayName: displayName,
                                      //icon: image)
        firebaseModel?.uploadToStorege()
        
    }
    
    
    
}

extension ProfileVC: UITextViewDelegate {
//    func textViewDidChange(_ textView: UITextView) {
//        var frame = textView.frame
//        frame.size.height = textView.contentSize.height
//        textView.frame = frame
//    }
    
    
    
}


extension ProfileVC: FirebaseModelDelegate {
    func failure(result: String?) {
        alert(title: "エラー", msg: result!, actionTitle: "String")
    }
    
    func success() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
