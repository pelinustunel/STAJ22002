//
//  ViewController.swift
//  SSSL
//
//  Created by Pelin Üstünel on 29.08.2024.
//

import UIKit

class ViewController: UIViewController {

    private var pinningManager: PinningManager!

    override func viewDidLoad() {
        super.viewDidLoad()

        // PinningManager'ı konfigure edin
        let pinnedKeyHashes = [
            "iYj4f9P2zF3VzLP3ClK5t7G2o1r9V2g7oR4A1s8kD1k="  // Örnek public key hash
        ]
        pinningManager = PinningManager(pinnedKeyHashes: pinnedKeyHashes)

        // Bir test URL'si kullanarak isteği test edin
        testNetworkRequest()
    }

    private func testNetworkRequest() {
        let url = URL(string: "https://yourserver.com")! // Test URL'si

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
}

extension ViewController: URLSessionDelegate {

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
