//
//  TabBarItem.swift
//  10-2-home
//
//  Created by JongHoon on 2022/10/14.
//

import UIKit

enum TabBarItem: CaseIterable {
    case home
    case myStudy
    case favorite
    case message
    case profile
    
    var title: String {
        switch self {
        case .home: return "홈"
        case .myStudy: return "내 스터디"
        case .favorite: return "즐겨찾기"
        case .message: return "쪽지"
        case .profile: return "프로필"
        }
    }
    
    var icon: (
        default: UIImage?,
        selected: UIImage?
    ) {
        switch self {
        case .home:
            return (
                UIImage(named: "homeDefault"),
                UIImage(named: "homeSelected")
            )
        case .myStudy:
            return (
                UIImage(named: "studyDefault"),
                UIImage(named: "studySelected")
            )
        case .favorite:
            return (
                UIImage(named: "favoriteDefault"),
                UIImage(named: "favoriteSelected")
            )
        case .message:
            return (
                UIImage(named: "messageDefault"),
                UIImage(named: "messageSelected")
            )
        case .profile:
            return (
                UIImage(named: "profileDefault"),
                UIImage(named: "prifileSelected")
            )
        }
    }
    
    var viewController: UIViewController {
        switch self {
        case .home:
            return UINavigationController(rootViewController: HomeViewController())
        case .myStudy:
            return UIViewController()
        case .favorite:
            return UIViewController()
        case .message:
            return UIViewController()
        case .profile:
            return UIViewController()
        }
    }
}
