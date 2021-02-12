//
//  AuthStackView.swift
//  Shop
//
//  Created by Пазин Даниил on 21.01.2021.
//

import UIKit
import FirebaseAnalytics

final class AuthStackView: UIStackView {
    
    // Замыкание, которое будет задаваться в AuthViewController.
    var signInButtonTapped: (() -> Void)?

    private lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.backgroundColor = .lightGray
        button.addTarget(self,
                         action: #selector(signIn),
                         for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.numberOfLines = 0
        label.textColor = .red
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addArrangedSubviews(usernameTextField, passwordTextField, signInButton, errorLabel)
    }
    
    private func setupConstraints() {
      //add code here to layout views
    }
    
    @objc private func signIn() {
        signInButtonTapped?()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

// MARK: - View Configuration
extension AuthStackView {
    // Проверяет поля и подтверждает, что введённые данные верны. Если всё заполненно правильно — метод вернёт nil. В другом случае возвращает сообщение об ошибке.
    public func validateFields() -> String? {
        // Проверка, что все поля заполнены.
        if usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            errorLabel.isHidden = false
            errorLabel.text = "Please complete all fields."
            return errorLabel.text
        }
        
        return nil
    }
    
    // Создание модели данных пользователя.
    public func getSignInFieldsDetails() -> [String:String]? {
        // Проверка полей ввода.
        let error = validateFields()
        
        if error != nil {
            // Показывает сообщение об ошибке, если некорректно заполнены поля.
            print(error!)
            // Лог события "Неуспешный вход".
            Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
              AnalyticsParameterItemID: "id-AuthStackView",
              AnalyticsParameterItemName: "Неуспешный вход",
              AnalyticsParameterContentType: "cont"
              ])
            return nil
        } else {
            return [
                "password": passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines),
                "username": usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)]
        }
    }
}
