import Foundation

import Foundation

enum Settings {
    case logOut
    case signOut
    case inquiry
    case terms
    case privacy
    init?(index: IndexPath) {
        switch (index.section, index.row) {
        case (1, 0):
            self = .logOut
        case (1, 1):
            self = .signOut
        case (2, 0):
            self = .inquiry
        case (2, 1):
            self = .terms
        case (2, 2):
            self = .privacy
        default:
            return nil
        }
    }
}


struct MyPageModel {
    let sectionTitle = [""," "," "]
    let rowArray = [
        [""],
        ["ログアウト", "アカウント削除"],
        ["問い合わせ", "利用規約", "プライバシーポリシー"]
    ]
}
