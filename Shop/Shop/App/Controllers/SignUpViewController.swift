//
//  SignUpViewController.swift
//  Shop
//
//  Created by Пазин Даниил on 20.01.2021.
//

import UIKit
import FirebaseAnalytics

class SignUpViewController: UIViewController {
    
    let requestFactory = RequestFactory()
    
    lazy var signUpStackView: SignUpStackView = {
        let stackView = SignUpStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var authButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("I already have an account", for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.addTarget(self,
                         action: #selector(auth),
                         for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        view.backgroundColor = .white
        
        signUpStackView.signUpButtonTapped = {
            self.signUp()
        }
    }
    
    // MARK: - Setting Views
    
    private func setupViews() {
        view.addSubviews(signUpStackView, authButton)
    }
    
    // MARK: - Setting Constraints
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            signUpStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            signUpStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100)
        ])
        
        NSLayoutConstraint.activate([
            authButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            authButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            view.bottomAnchor.constraint(equalTo: authButton.bottomAnchor, constant: 40)
        ])
    }
    
    // MARK: - Register User
    
    private func signUp() {
        guard let signUpData = signUpStackView.getSignUpFieldsDetails() else { return }
        
        let signUp = requestFactory.makeSignUpRequestFactory()
        signUp.register(userID: 123, userName: signUpData.username, password: signUpData.password, email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { [weak self] response in
            switch response.result {
            case .success(let register):
                print(register.userMessage)
                // Лог события "Регистрация".
                Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
                  AnalyticsParameterItemID: "id-AuthViewController",
                  AnalyticsParameterItemName: "Регистрация",
                  AnalyticsParameterContentType: "cont"
                  ])
                DispatchQueue.main.async {
                    self?.transitionToMainTabBarController()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Navigation
    
    // Переход на контроллер авторизации.
    @objc func auth() {
        let authViewController = AuthViewController()
        authViewController.modalPresentationStyle = .fullScreen
        present(authViewController, animated: true)
    }
    
    // Переход на главный экран
    private func transitionToMainTabBarController() {
        view.window?.rootViewController = MainTabBarController()
        view.window?.makeKeyAndVisible()
    }
}
