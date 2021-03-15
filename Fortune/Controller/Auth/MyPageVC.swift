
import UIKit
import MessageUI

final class MyPageVC: UIViewController, MFMailComposeViewControllerDelegate {
    
    let defaultColor = UIColor(displayP3Red: 119/255, green: 65/255, blue: 237/255,alpha: 1.0)
    
    private let model = MyPageModel()
    var logout: LogOut?
    var signout: SignOut?
    var mail: Mail?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.bounds, style: .plain)
        let nib = UINib(nibName: "ProFileCellTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ProFileCellTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.tableFooterView = UIView(frame: .zero)

        return tableView
    }()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            view.addSubview(tableView)
            setUpNavigationBar()
            navigationController?.delegate = self
        }
    

    func setUpNavigationBar()  {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = defaultColor
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    //mailComposeControllerを閉じる
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled, .saved, .sent, .failed: break
        default: break
        }
        controller.dismiss(animated: true, completion: nil)
    }

  
    

}
extension MyPageVC: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
         model.sectionTitle.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch Settings(index: indexPath) {
        case .logOut:
            logout = LogOut()
            logout?.logout()
        case .signOut:
            actionAlert(titile: "アカウントを削除してもよろしいですか？",
                        msg: "削除すると全てのデータが削除されます")
        case .inquiry:
            inquiryAction()
 
            
        case .terms:break
        case .privacy:break
            
        case .none:
            break
        }
         
       
     }
    
    func inquiryAction() {
        mail = Mail()
        mail?.sendMail { result in
            switch result {
            case .success(let mailVC):
                mailVC.delegate = self
                self.present(mailVC, animated: true, completion: nil)
            case .failure:
                self.alert(title: "Error", msg: "MailAdressがありません")
            }
        }
    }
    
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
//
//        //ヘッダーにするビューを生成
//        let view = UIView()
//        view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 100)
//        view.backgroundColor = .lightGray
//
//        let imageview = UIImageView()
//        imageview.frame = CGRect(x: 0, y: 5, width: 20, height:  20)
//        imageview.image = Icon.paerson.icon
//        view.addSubview(imageview)
//
//        return view
//    }
    
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//            // 背景色を変更する
//            view.tintColor = .white
//    }
}

extension MyPageVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.rowArray[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return model.sectionTitle[section]
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProFileCellTableViewCell", for: indexPath) as! ProFileCellTableViewCell
            
            cell.setLabrlText(login: false)
            
            

            return cell
            
        default: return  UITableViewCell()
        }
          
        default:
            let cell = UITableViewCell()
            cell.textLabel?.text = model.rowArray[indexPath.section][indexPath.row]
            return cell

        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 100
        default: return 44
        }
    }
  
}

extension MyPageVC: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        navigationItem.title = "Setting"
        navigationController.navigationBar.prefersLargeTitles = true
    }

    
}

extension MyPageVC: LogOutDelegate {
    func logOutError(err: String) {
        let errMsg = """
エラー内容：
\(err)

アプリを再起動してやり直してください
"""
        alert(title: "ログアウトエラー", msg: errMsg)
    }
    
    
}

extension MyPageVC: alertActionDelegate {
    func signOutAlertaction(vc: UIViewController) {
        let vc = vc
        signout = SignOut()
        signout?.signOut(handler: { err in
            if let err = err {
                vc.dismiss(animated: true, completion: nil)
                //アラート表示　＋　[weak self]対応？
                self.alert(title: "Error", msg: err)
            } else {
                //succsess処理(アラートを閉じる)
                vc.dismiss(animated: true, completion: nil)
                //プロフィール画像/名前を初期化
                // ......
            }
        })
    }
    
    
}




//extension InfoViewController: UITableViewDelegate {
//
//}
//
//extension InfoViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ProFileCellTableViewCell", for: indexPath) as! ProFileCellTableViewCell
//        return cell
//    }
//
//
//}


//import SwiftUI
//
//struct InfoVCRepresentable: UIViewControllerRepresentable {
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//        // leave this empty
//    }
//
//    func makeUIViewController(context: Context) -> UIViewController {
//        InfoViewController()
//    }
//}
//
//struct InfoVCPreview: PreviewProvider {
//    static var previews: some View {
//       InfoVCRepresentable()
//    }
//}






