//
//  ViewController.swift
//  SampleWebView
//
//  Created by KooGunMo on 2020/10/14.
//  Copyright © 2020 KooGunMo. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var WebViewMain: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // 1. URL String
        // 2. URL > Request
        // 3. Request > Load
        
//        Introduce myself
//        let urlString = "https://koo9511.github.io"
        
//        RMS
        let urlString = "http://115.68.26.52"
        
//        BDP
//        let urlString = "http://115.68.26.51:8080"
        
        if let url = URL(string : urlString){ // unwrapping 과정 - 옵셔널 바인딩
            let urlReq = URLRequest(url: url)
            WebViewMain.load(urlReq)
        }
        
        var abc = "1"
        var abc1 :String? = nil    //-> 값이 비어있을 수 있다.(null = nil) = unwrapping 해야함
    
        
        self.WebViewMain = WKWebView()
        self.WebViewMain!.isOpaque = false
        self.WebViewMain!.backgroundColor = UIColor.black
        self.WebViewMain!.scrollView.backgroundColor = UIColor.black
        // NullpointerException - java
        // 스위프트에서 옵셔널 바인딩을 통해 널포인터익셉션이 발생할 수 없다.

    }


}

