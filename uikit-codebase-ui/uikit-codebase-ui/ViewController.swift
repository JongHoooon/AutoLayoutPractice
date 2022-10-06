//
//  ViewController.swift
//  uikit-codebase-ui
//
//  Created by JongHoon on 2022/10/06.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let yellowView = UIView()
        yellowView.backgroundColor = .yellow
        yellowView.translatesAutoresizingMaskIntoConstraints = false
                
        view.addSubview(yellowView)
        
        NSLayoutConstraint.activate([
            // 크기
            yellowView.widthAnchor.constraint(equalToConstant: 100),
            yellowView.heightAnchor.constraint(equalToConstant: 100),
            
            // 위치
            yellowView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            yellowView.topAnchor.constraint(
                equalTo: self.view.safeAreaLayoutGuide.topAnchor,
                constant: 100
            )
        ])
        
        

        
        print(#function)
    }
}

#if DEBUG
import SwiftUI

struct ViewControllerPresentable: UIViewControllerRepresentable {
    func updateUIViewController(
        _ uiViewController: UIViewControllerType,
        context: Context
    ) {
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        ViewController()
    }
}

struct ViewControllerPrepresentable_PreviewProvider:
    PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerPresentable()
                .previewDevice("iPhone 11 Pro")
            .ignoresSafeArea()
            ViewControllerPresentable()
                .previewDevice("iPhone 11 Pro")
                .ignoresSafeArea()
            ViewControllerPresentable()
                .previewDevice("iPhone 11 Pro")
                .ignoresSafeArea()
        }
    }
}
#endif
