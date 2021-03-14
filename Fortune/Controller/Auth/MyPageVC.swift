
import UIKit

final class MyPageVC: UIViewController {
    
    let defaultColor = UIColor(displayP3Red: 119/255, green: 65/255, blue: 237/255,alpha: 1.0)
    
    private let model = MyPageModel()
    
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

  
    

}
extension MyPageVC: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
         model.sectionTitle.count
    }
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






