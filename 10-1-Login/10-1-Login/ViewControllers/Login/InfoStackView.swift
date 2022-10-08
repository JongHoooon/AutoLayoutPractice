//
//  InfoStackView.swift
//  10-1-Login
//
//  Created by JongHoon on 2022/10/07.
//

import Then
import SnapKit
import UIKit

final class InfoStackView: UIStackView {
    
    private let title: String
    private let placeholder: String
    private let message: String
    
    private lazy var titleLabel = UILabel().then {
        $0.text = title
        $0.font = .systemFont(ofSize: 14.0)
        $0.textColor = UIColor.loginDarkgray
    }
    
    lazy var textField = UITextField().then {
        $0.placeholder = placeholder
        $0.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [
                .font: UIFont.systemFont(ofSize: 14.0)
            ]
        )
        $0.leftView = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: 16.0,
            height: 0.0
        ))
        $0.leftViewMode = .always
        $0.rightView = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: 48.0,
            height: 0.0
        ))
        $0.rightViewMode = .always
        
        $0.backgroundColor = UIColor.loginLightgray
        
        $0.layer.cornerRadius = 8.0
        
    }
    
    lazy var messageLabel = UILabel().then {
        $0.text = "*\(message)"
        $0.font = .systemFont(ofSize: 12.0)
        $0.textColor = UIColor(rgb: 0xE35E5E)
    }
    
    // MARK: - Lifecycle
    
    init(title: String, placeholder: String, message: String) {
        self.title = title
        self.placeholder = placeholder
        self.message = message
        
        super.init(frame: .zero)
        
        setupLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private

private extension InfoStackView {
    func setupLayout() {
        [
            titleLabel,
            textField
        ].forEach { addArrangedSubview($0) }
        
        axis = .vertical
        distribution = .equalSpacing
        spacing = 11.0
        
        textField.snp.makeConstraints {
            $0.height.equalTo(48.0)
        }
    }
}
