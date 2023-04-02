//
//  ViewController.swift
//  TestApi
//
//  Created by 永末拓朗 on 2023/02/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var apiBtn: UIButton!
    @IBOutlet weak var apiLabel: UILabel!
    
    let str = "tanaka"
    var result = ""
    
    struct User: Codable {
        let total_count: Int
        let incomplete_results: Bool
        let items: [Item]

        struct Item: Codable {
            let login: String
            let id: Int
            let node_id: String
            let avatar_url: URL
            let gravatar_id: String?
            let url: URL
            let html_url: URL
            let followers_url: URL
            let subscriptions_url: URL
            let organizations_url: URL
            let repos_url: URL
            let received_events_url: URL
            let type: String
            let score: Double
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func searchGithubUser(query: String) {
        let url = URL(string: "https://api.github.com/search/users?q=" + query)!
        let request = URLRequest(url: url)
    //         デフォルトはGET、POSTにしたい場合は↓
    //        request.httpMethod = "POST"
        let decoder: JSONDecoder = JSONDecoder()
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            do {
                let user: User = try decoder.decode(User.self, from: data)
                print(user)
                for value in user.items {
                    self.result = self.result + value.login + "\n"
                }
                let mainQ = DispatchQueue.main
                mainQ.async {
                    self.apiLabel.text = self.result
                }
            } catch let e {
                print("JSON Decode Error :\(e)")
                fatalError()
            }
        }
        task.resume()
    }

    @IBAction func onApiBtn(_ sender: Any) {
        self.searchGithubUser(query: str)
    }
    
}

