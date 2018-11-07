//
//  ViewController.swift
//  LoadImageURL
//
//  Created by Trần Đức Anh on 11/6/18.
//  Copyright © 2018 Trần Đức Anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    var url = URL(string: "https://www.lawliberty.org/wp-content/uploads/2017/12/AdobeStock_105994137-1024x680.jpeg")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        uRL = NSURL(string: "http://i.imgur.com/w5rkSIj.jpg")
//        url = URL(string: "https://www.lawliberty.org/wp-content/uploads/2017/12/AdobeStock_105994137-1024x680.jpeg")
//        let data = try! Data(contentsOf: url!)
//        myImageView.image = UIImage(data: data)
//        // Do any additional setup after loading the view, typically from a nib.
        myImageView.load(url: url!)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

