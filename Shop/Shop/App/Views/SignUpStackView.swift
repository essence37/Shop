//
//  SignUpStackView.swift
//  Shop
//
//  Created by Пазин Даниил on 20.01.2021.
//

import UIKit

final class SignUpStackView: UIStackView {
    
    // Замыкание, которое будет задаваться в SignUpViewController.
    var signUpButtonTapped: (() -> Void)?

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
    
    private lazy var confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Confirm Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.backgroundColor = .lightGray
        button.addTarget(self,
                         action: #selector(signUp),
                         for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        addArrangedSubviews(usernameTextField, passwordTextField, confirmPasswordTextField, signUpButton)
    }
    
    private func setupConstraints() {
      //add code here to layout views
    }
    
    @objc private func signUp() {
        signUpButtonTapped?()
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
extension SignUpStackView {
    // Проверяет поля и подтверждает, что введённые данные верны. Если всё заполненно правильно — метод вернёт nil. В другом случае возвращает сообщение об ошибке.
    private func validateFields() -> String? {
        // Проверка, что все поля заполнены.
        if usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || confirmPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please complete all fields."
        } else if passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != confirmPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) {
            return "Please make sure your passwords match."
        }
        return nil
    }
    
    // Создание модели данных пользователя.
    public func getSignUpFieldsDetails() -> SignUpModel? {
        // Проверка полей ввода.
        let error = validateFields()
        
        if error != nil {
            // Показывает сообщение об ошибке, если некорректно заполнены поля.
            print(error!)
            return nil
        } else {
            return SignUpModel(
                username: usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines),
                password: passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines))
        }
    }
}
