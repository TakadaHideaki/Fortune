import UIKit

class RoundBtn: UIButton {
    
    override init(frame: CGRect){
           super.init(frame: frame)
           initView()
       }
       
       required init(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)!
           initView()
       }
    
    func initView() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 10
    }
    


}
