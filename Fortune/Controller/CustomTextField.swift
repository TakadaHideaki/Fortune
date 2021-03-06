import UIKit

enum Icon {
    case user
    case meail
    case passWord
    
    var icon: UIImage? {
        
        let user = "person.crop.circle"
        let mail = "envelope"
        let pass = "lock"
        
        switch self {
        case .user: return UIImage(systemName: user)!
        case .meail: return UIImage(systemName: mail)!
        case .passWord: return UIImage(systemName: pass)!
        }
    
    }
}

class CustomTextField {
    
    //Add icon on the left
    func textFieldIconSet(textField: UITextField, image: Icon) {
       //Icon_MarginSiza
        let iconMarginView: UIView = {
            let iconMarginView = UIView()
            iconMarginView.frame = CGRect(x: 0, y: 0, width: 25, height: 20)
            return iconMarginView
        }()
        //Icon_Size
        let iconView: UIImageView = {
            let iconView = UIImageView()
            iconView.frame = CGRect(x: 5, y: 0, width: 20 , height: 20)
            iconView.image = image.icon?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)
            return iconView
        }()
        iconMarginView.addSubview(iconView)
        textField.leftView = iconMarginView
        textField.leftViewMode = .always
    }
    

 

}
