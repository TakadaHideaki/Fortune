import UIKit

enum Icon {
    case paerson
    case personPlus
    case meail
    case passWord
    case eye
    case slashEye
    case profireImage
    
    var icon: UIImage? {
        let image = UIImage()
        let person = "person"
        let personPlus = "person.crop.circle"
        let mail = "envelope"
        let pass = "lock"
        let eye = "eye"
        let slashEye = "eye.slash"
        let profireImage = "person.crop.circle.badge.plus"
        
        switch self {
        case .paerson:
            return
                image.imageCustom(image: UIImage(systemName: person)!)
        case .personPlus:
            return
                UIImage(systemName: personPlus)!
        case .meail:
            return
                UIImage(systemName: mail)!
        case .passWord:
            return
                UIImage(systemName: pass)!
        case .eye:
            return
                image.imageCustom(image: UIImage(systemName: eye)!)
        case .slashEye:
            return
                image.imageCustom(image: UIImage(systemName: slashEye)!)
        case .profireImage:
            return
                image.imageCustom(image: UIImage(systemName: profireImage)!)
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


