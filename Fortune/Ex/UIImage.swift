import UIKit

enum Icon {
    case user
    case meail
    case passWord
    case eye
    case slashEye
    
    var icon: UIImage? {
        let image = UIImage()
        let user = "person.crop.circle"
        let mail = "envelope"
        let pass = "lock"
        let eye = "eye"
        let slashEye = "eye.slash"
        
        switch self {
        case .user: return UIImage(systemName: user)!
        case .meail: return UIImage(systemName: mail)!
        case .passWord: return UIImage(systemName: pass)!
        case .eye: return image.imageCustom(image: UIImage(systemName: eye)!)
        case .slashEye: return image.imageCustom(image: UIImage(systemName: slashEye)!)
        }
    }
}

extension UIImage {
    
    func imageCustom(image: UIImage) -> UIImage {
        let customImage = image.withTintColor(.lightGray,
                            renderingMode: .alwaysOriginal)
        return customImage
    }
}


