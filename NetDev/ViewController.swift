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
        
//        fetchStringData(withURL: "https://orangevalleycaa.org/api/videos.php")
//        fetchJsonData(withURL: "https://orangevalleycaa.org/api/videos.php")
        fetchBinaryData(withURL: "https://cdn.pixabay.com/photo/2018/02/09/21/46/rose-3142529_1280.jpg")
    }
    
    
    private func fetchStringData(withURL url: String) {
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
    
    
    private func fetchJsonData(withURL url: String) {
        if let urlString = URL(string: url) {
            let task = URLSession.shared.dataTask(with: urlString) { (data, response, error) in
                if error != nil || data == nil {
                    // handle error
                } else {
                    if let jsonResponse = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) {
                        if jsonResponse is [Any] {
                            print("Array: \(jsonResponse)")
                        } else if jsonResponse is [String: Any] {
                            print("Dict: \(jsonResponse)")
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    
    private func fetchBinaryData(withURL url: String) {
        if let urlString = URL(string: url) {
            let task = URLSession.shared.dataTask(with: urlString) { (data, response, error) in
                if error != nil || data == nil {
                    // handle error
                } else {
                    let img = UIImage(data: data!)
                    
                    DispatchQueue.main.async {
                        let imageView = UIImageView(frame: self.view.frame)
                        imageView.contentMode = .scaleAspectFit
                        imageView.image = img
                        self.view.addSubview(imageView)
                    }
                }
            }
            task.resume()
        }
    }

}

