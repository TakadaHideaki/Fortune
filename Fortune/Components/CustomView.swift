import UIKit

class CustomView: UIView {

    override init(frame: CGRect){
           super.init(frame: frame)
           initView()
       }
       
       required init(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)!
           initView()
       }
    
    
    func initView() {
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 5
        
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = false
    }

}
