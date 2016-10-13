//
//  ViewController.swift
//  Tumblr
//
//  Created by Matthew Carroll on 10/12/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import AFNetworking

class PhotoViewController: UIViewController {
    
    var post : NSDictionary?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadTumblrData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadTumblrData() {
        let apiKey = "Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV"
        let url = URL(string:"https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=\(apiKey)")
        let request = URLRequest(url: url!)
        let session = URLSession(
            configuration: URLSessionConfiguration.default,
            delegate:nil,
            delegateQueue:OperationQueue.main
        )
        
        let task : URLSessionDataTask = session.dataTask(with: request,completionHandler: { (dataOrNil, response, error) in
            if let data = dataOrNil {
                if let responseDictionary = try! JSONSerialization.jsonObject(with: data, options:[]) as? NSDictionary {
                    NSLog("response: \(responseDictionary)")
                    self.post = responseDictionary
                }
            }
        });
        task.resume()
    }
    
}

