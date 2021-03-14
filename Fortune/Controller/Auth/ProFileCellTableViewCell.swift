
import UIKit

class ProFileCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbNale: UIImageView!
    @IBOutlet weak var displayName: UILabel!
    @IBOutlet weak var profileEdditLabrl: UILabel!
    @IBOutlet weak var signupLabel: UILabel!
    @IBOutlet weak var upperHalfLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
//        separatorInset = UIEdgeInsets(top: 0, left: bounds.width, bottom: 0, right: 0)
        round()
        setupLabelFrame()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        separatorInset = UIEdgeInsets(top: 0, left: bounds.width, bottom: 0, right: 0)
        round()
        setupLabelFrame()
    }

    func round() {
//        thumbNale.image = Icon.paerson.icon
        signupLabel.layer.cornerRadius = 10
        signupLabel.clipsToBounds = true
        //thumbNale.layer.frame.size.heightが取得できない
        //cellのHight(100)-(TpoSpace(10)+BotomSpace(20))を代入
        thumbNale.layer.cornerRadius = 35//thumbNale.layer.frame.size.height / 2
        
        thumbNale.layer.shadowOffset = CGSize(width: 3, height: 3)
        thumbNale.layer.shadowColor = UIColor.black.cgColor
        thumbNale.layer.shadowOpacity = 0.3
        thumbNale.layer.shadowRadius = 3
        
        let defaultColor = UIColor(displayP3Red: 119/255, green: 65/255, blue: 237/255,alpha: 1.0)

        upperHalfLabel.backgroundColor = defaultColor
    }

    func setLabrlText(login: Bool) {

        profileEdditLabrl.text = "プロフィール編集"
        profileEdditLabrl.textColor = .lightGray
        profileEdditLabrl.isHidden = login
        
        displayName.text = "高田英明"
        
        
        
    }
    
    func setupLabelFrame() {
        var fixedFrame = profileEdditLabrl.frame
        profileEdditLabrl.sizeToFit()
        fixedFrame.size.height = profileEdditLabrl.frame.size.height
        profileEdditLabrl.frame = fixedFrame
    }
    
}
