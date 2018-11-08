//
//  ViewController.swift
//  SwiftWKWebView
//
//  Created by 神崎泰旗 on 2018/11/08.
//  Copyright © 2018年 taiki. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate{

    @IBOutlet var webView: WKWebView!
    
    var urlString:String = "https://www.youtube.com/"
    var indicator:UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setIndicator()
        
        guard let url = URL(string: urlString) else{
            return
        }
        
        let req = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 100)
        //.returnCacheDataElseLoadはキャッシュがあったらそれを利用してという意味
        
        self.webView.load(req)
        
    }
    
    @IBAction func back(_ sender: Any) {
        
        webView.goBack()
        
    }
    
    @IBAction func next(_ sender: Any) {
        
        webView.goForward()
        
    }
    
    @IBAction func refresh(_ sender: Any) {
        
        webView.reload()
        
    }
    
    
    func setIndicator(){
        
        
    //インディケーターの初期化を行う
        
        indicator = UIActivityIndicatorView()
        
    //サイズ決定
        indicator.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        indicator.center = CGPoint(x:UIScreen.main.bounds.size.width/2, y: UIScreen.main.bounds.size.height/2)
        indicator.hidesWhenStopped = true
        indicator.style = .gray
        
        
    //webViewにaddsubView
        self.webView.addSubview(indicator)
        

    }

    
    //通信が開始されたタイミングで呼ばれる
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
        //インディケーターを回したい
        indicator.startAnimating()
        
        
        
    }
    
    //通信が完了したタイミングで呼ばれる
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        indicator.stopAnimating()
        
    }

}

