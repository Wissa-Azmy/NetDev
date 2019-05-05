//
//  ViewController.swift
//  NetDev
//
//  Created by Wissa Azmy on 5/5/19.
//  Copyright © 2019 Wissa Azmy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        fetchData(withURL: "https://orangevalleycaa.org/api/videos.php")
    }
    
    
    private func fetchData(withURL url: String) {
        if let urlString = URL(string: url) {
            let task = URLSession.shared.dataTask(with: urlString) { (data, response, error) in
                if error != nil || data == nil {
                    // handle error
                } else {
                    let stringData = String(data: data!, encoding: .ascii)
                    print(stringData!)
                }
            }
            task.resume()
        }
    }

}

