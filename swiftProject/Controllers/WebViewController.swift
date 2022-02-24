//
//  WebViewController.swift
//  swiftProject
//
//  Created by eliott LISLE on 23/02/2022.
//

import UIKit
import WebKit



class WebViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var activity2: UIActivityIndicatorView!
    @IBOutlet weak var activity1: UIActivityIndicatorView!
    @IBOutlet weak var amazonWeb: WKWebView!
    @IBOutlet weak var fnacWeb: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activity1.startAnimating()
        self.activity2.startAnimating()
        
        amazonWeb.load("https://www.amazon.fr/Drague-pour-Nuls-BD/dp/2754075615/ref=sr_1_1?crid=2D9CIHWKKR9KD&keywords=la+drague+pour+les+nuls&qid=1645625709&sprefix=la+drague+%2Caps%2C101&sr=8-1")
       
        fnacWeb.load("https://livre.fnac.com/a8661384/Pour-les-Nuls-La-drague-Pour-les-Nuls-BD-Collectif")
        
        
        
        }
    override func viewDidAppear(_ animated: Bool) {
        super.viewSafeAreaInsetsDidChange()
        webViewDidFinishLoad(webView: amazonWeb)
    }
    func webViewDidFinishLoad(webView: WKWebView) {
        self.activity1.removeFromSuperview()
        self.activity2.removeFromSuperview()
    }
    
   

    
        // Do any additional setup after loading the view.



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension WKWebView {
    func load(_ urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            load(request)
        }
    }
}
