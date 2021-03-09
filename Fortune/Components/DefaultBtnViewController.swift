import UIKit

@IBDesignable
class DefaultBtnViewController: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        customDesign()
      }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customDesign()
      }
      
      override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        customDesign()
      }
      
      private func customDesign() {

        let baseColor = UIColor(displayP3Red: 119/255, green: 65/255, blue: 237/255,alpha: 1.0)
        backgroundColor = baseColor
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        contentEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        layer.cornerRadius = 15
        
        //Shadow
        layer.shadowColor = UIColor(displayP3Red: 158, green: 131, blue: 245, alpha: 0).cgColor
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 10
        
        //Gradation
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = bounds
//
//        let DarkColor = UIColor(displayP3Red: 144/255, green: 58/255, blue: 255/255,alpha: 1.0).cgColor
//        let lightColor =  UIColor(displayP3Red: 119/255, green: 65/255, blue: 237/255,alpha: 1.0).cgColor
//
//        gradientLayer.colors = [DarkColor, lightColor]
//        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
//        gradientLayer.endPoint = CGPoint.init(x: 1, y:1)
//        layer.insertSublayer(gradientLayer, at:0)
      }
    }
        
        







