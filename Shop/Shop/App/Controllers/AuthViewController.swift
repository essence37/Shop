//
//  AuthViewController.swift
//  Shop
//
//  Created by Пазин Даниил on 19.01.2021.
//

import UIKit
import FirebaseAnalytics
import MessageUI

class AuthViewController: UIViewController {
    
    let requestFactory = RequestFactory()
    
    lazy var authStackView: AuthStackView = {
        let authStackView = AuthStackView()
        authStackView.axis = .vertical
        authStackView.distribution = .fill
        authStackView.alignment = .fill
        authStackView.spacing = 20
        authStackView.translatesAutoresizingMaskIntoConstraints = false
        return authStackView
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.addTarget(self,
                         action: #selector(signUp),
                         for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    // MARK: - View Controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        
        authStackView.signInButtonTapped = {
            self.signIn()
        }
    }
    
    // MARK: - Setting Views
    
    private func setupViews() {
        view.addSubviews(authStackView, registerButton)
        view.backgroundColor = .white
    }
    
    // MARK: - Setting Constraints
    
    private func setupConstraints() {
        // Активировать массив constraint.
        NSLayoutConstraint.activate([
            authStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            authStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            authStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100)
        ])
        
        NSLayoutConstraint.activate([
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            view.bottomAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 40)
        ])
    }
    
    // MARK: - Authenticate User
    
    private func signIn() {
        guard let signInData = authStackView.getSignInFieldsDetails() else { return }
        
        let auth = requestFactory.makeAuthRequestFatory()
        
        auth.login(username: signInData["username"]!, password: signInData["password"]!) { [weak self] response in
            switch response.result {
            case .success(let login):
                print(login.user)
                DispatchQueue.main.async {
                    self?.transitionToMainTabBarController()
                    self?.sendEmail()
                }
                // Лог события "Успешный вход".
                Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
                  AnalyticsParameterItemID: "id-AuthViewController",
                  AnalyticsParameterItemName: "Успешный вход",
                  AnalyticsParameterContentType: "cont"
                  ])
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Navigation
    
    // Переход на контроллер регистрации.
    @objc func signUp() {
        let signUpViewController = SignUpViewController()
        signUpViewController.modalPresentationStyle = .fullScreen
        present(signUpViewController, animated: true)
    }
    
    // Переход на главный экран
    private func transitionToMainTabBarController() {
        view.window?.rootViewController = MainTabBarController()
        view.window?.makeKeyAndVisible()
    }
}

// Отправка лога об аутентификации по email.
extension AuthViewController: MFMailComposeViewControllerDelegate {
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["pazin.d@icloud.com"])
            mail.setMessageBody("<p>Успешный вход!</p>", isHTML: true)

            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
