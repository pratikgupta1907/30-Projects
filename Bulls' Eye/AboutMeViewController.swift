//
//  AboutMeViewController.swift
//  Bulls' Eye
//
//  Created by Pratik Gupta on 02/08/18.
//  Copyright © 2018 Pratik Gupta. All rights reserved.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    @IBOutlet weak var webAboutMeView: UIWebView!
    
    
    
    @IBAction func close (){
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = Bundle.main.url(forResource: "AboutMe", withExtension: "html") {
            if let htmlData = try? Data(contentsOf: url) {
                let baseUrl = URL(fileURLWithPath: Bundle.main.bundlePath)
                webAboutMeView.load(htmlData, mimeType: "text/html", textEncodingName: "utf-8", baseURL: baseUrl)
            }
        }

    }

}
