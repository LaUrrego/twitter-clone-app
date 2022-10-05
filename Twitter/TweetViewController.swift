//
//  TweetViewController.swift
//  Twitter
//
//  Created by Larry Urrego on 10/3/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController,UITextViewDelegate {

    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func tweetButton(_ sender: Any) {
        if (!tweetTextView.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true)
            }, failure: { (error) in
                print("Error posting tweet \(error)")
                self.dismiss(animated: true)
            })
        } else {
            self.dismiss(animated: true)
        }
    }
    
    
    @IBOutlet weak var tweetTextView: UITextView!
    
    
    @IBOutlet weak var tweetCharLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.becomeFirstResponder()
        tweetTextView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    let maxLength = 280
    func textViewDidChange(_ textView: UITextView) {
            tweetCharLabel.text = "\(maxLength - textView.text.count)"
        }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            return textView.text.count + (text.count - range.length) <= maxLength
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
