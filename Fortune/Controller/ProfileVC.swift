import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileBackGroundView: UIView!
    @IBOutlet weak var userNameTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.isUserInteractionEnabled = true
        initialUI()
    }
    
    private func initialUI() {
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
        log.debug("tap")
    }
    
}

extension ProfileVC: UITextViewDelegate {
//    func textViewDidChange(_ textView: UITextView) {
//        var frame = textView.frame
//        frame.size.height = textView.contentSize.height
//        textView.frame = frame
//    }
}
