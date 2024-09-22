//
//  LoginViewController.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 27.07.2024.
//

import UIKit
import SwiftUI
import Alamofire

class LoginViewController: UIViewController, LoginContracts, ClearCacheContract {
    
    private var pinningManager: PinningManager!
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var loginService : LoginService? = nil
    private var clearService : ClearCacheService? = nil
    
    
    func onError(error: any Error) {
        let alert = UIAlertController(title: "Error", message: "\(error)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func onAuthorize(loginResult: LoginResponse) {
        TokenStore.shared.token = Token(accesToken: loginResult.access_token, refreshToken: loginResult.refresh_token)
        self.viewWillAppear(true)
    }
    
    func onAuthorize(clearCahceResult: ClearCacheResponse) {
        print("3 minute")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pinnedKeyHashes = [
            "iYj4f9P2zF3VzLP3ClK5t7G2o1r9V2g7oR4A1s8kD1k="
        ]
        pinningManager = PinningManager(pinnedKeyHashes: pinnedKeyHashes)
    }
    
    private func testNetworkRequest() {
        let url = URL(string: "https://yourserver.com")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Response: \(String(describing: response))")
            }
        }
        
        task.resume()
    }
    
    @IBAction func loginButtonPress(_ sender: Any) {
        
        loginService = LoginService(listener: self)
        clearService = ClearCacheService(listener: self)
        loginService?.authorize(userName: usernameTextField.text!, password: passwordTextField.text!)
        
        let mainTabbarController = MainTabBarController2()
        self.navigationController?.setViewControllers([mainTabbarController], animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        testNetworkRequest()
    }
    
}


extension LoginViewController: URLSessionDelegate {
    
    private func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge) -> (URLSession.AuthChallengeDisposition, URLCredential?) {
        var disposition: URLSession.AuthChallengeDisposition = .performDefaultHandling
        var credential: URLCredential?
        
        pinningManager.validate(challenge: challenge) { (challengeDisposition, urlCredential) in
            disposition = challengeDisposition
            credential = urlCredential
        }
        
        return (disposition, credential)
    }
}
