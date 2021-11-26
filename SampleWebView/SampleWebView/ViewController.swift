//
//  ViewController.swift
//  SampleWebView
//
//  Created by KooGunMo on 2020/10/14.
//  Copyright © 2020 KooGunMo. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    // * WKWebView 객체 선언

        private var wkWebView: WKWebView? = nil

     

        override func viewDidLoad() {

            super.viewDidLoad()
            
            // safe area 무효화 처리
            self.wkWebView?.insetsLayoutMarginsFromSafeArea = false
            
            
            // * WKWebView 구성

            //    - 여기서는 self.view 화면 전체를 WKWebView로 구성하였습니다.

            self.wkWebView = WKWebView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))

     

            // * WKWebView WKUIDelegate 사용설정

            self.wkWebView?.uiDelegate = self

     

            // * WKWebView 화면 비율 맞춤 설정
            self.wkWebView?.translatesAutoresizingMaskIntoConstraints = false
            self.wkWebView?.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.RawValue(UInt8(UIView.AutoresizingMask.flexibleWidth.rawValue) | UInt8(UIView.AutoresizingMask.flexibleHeight.rawValue)))

     

            // * WKWebView 여백 및 배경 부분 색 투명하게 변경

//            self.wkWebView?.backgroundColor = UIColor.clear
//
//            self.wkWebView?.isOpaque = false
//
//            self.wkWebView?.loadHTMLString("<body style=\"background-color: transparent\">", baseURL: nil)

       

             // * WKWebView에 로딩할 URL 전달

             //    - 캐시 기본 정책 사용, 타임아웃은 10초로 지정하였습니다.

             let request: URLRequest = URLRequest.init(url: NSURL.init(string: "http://127.0.0.1:8080/withu_exploded")! as URL, cachePolicy: URLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: 10)

             self.wkWebView?.load(request)

     

              // * WKWebView 화면에 표시

              self.view?.addSubview(self.wkWebView!)

        }

       

        

        // * WKWebView 웹보기가 탐색을 위한 필요 함수

        func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView?

        {

           // * targetFrame의 mainframe이 nil일 경우 request를 로드합니다.

            if navigationAction.targetFrame?.isMainFrame == nil {

                webView.load(navigationAction.request)

            }

            return nil

        }

        

        // * WKWebView JavaScript alert 함수 호출 시 호출 이벤트를 수신하는 함수

        func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo,  completionHandler: @escaping () -> Void) {

           // * 전달 받은 message로 팝업 제목에 도메인 주소가 보이지 않도록 UIAlertController를 앱에서 호출하는 부분입니다.

            let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)

            let ac = UIAlertAction(title: "OK", style: .default, handler: { action in

                completionHandler()

            })

           // * 만약 버튼의 색을 변경하고 싶다면 아래 구문을 추가 합니다.

            ac.setValue(UIColor.red, forKey: "titleTextColor")

            alertController.addAction(ac)

            self.present(alertController, animated: true, completion: nil)

        }

     

       // * WKWebView JavaScript confirm 함수 호출 시 호출 이벤트를 수신하는 함수

       func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {

           // * 전달 받은 message로 팝업 제목에 도메인 주소가 보이지 않도록 UIAlertController를 앱에서 호출하는 부분입니다.

            let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)

            let ac = UIAlertAction(title: "OK", style: .default, handler: { action in

                completionHandler(true)

            })

            ac.setValue(UIColor.red, forKey: "titleTextColor")

            alertController.addAction(ac)

            let ac2 = UIAlertAction(title: "NO", style: .cancel, handler: { action in

                completionHandler(false)

            })

            ac2.setValue(UIColor.darkGray, forKey: "titleTextColor")

            alertController.addAction(ac2)

            self.present(alertController, animated: true, completion: nil)

        }

     

       // * WKWebView JavaScript TextInputPanel 이벤트를 처리하는 함수

      

    }





