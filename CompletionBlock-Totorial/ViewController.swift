//
//  ViewController.swift
//  CompletionBlock-Totorial
//
//  Created by Seokhyun Kim on 2020-11-04.
//

import UIKit
import KRProgressHUD

class ViewController: UIViewController {

    @IBOutlet weak var hello: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewController - viewDidLoad callled")
        
        KRProgressHUD.show()
        
        sayHi(completion: { result in
            print("It is from completion block \(result)")
            KRProgressHUD.showSuccess()
            self.hello.text = result
        })
        print("Is this the end? or not")
    }
    //Asynchronous process and completion block with send with string

    fileprivate func sayHi(completion : @escaping(String) -> () ) {
        print("viewController - sayHi Method callled")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
           // Code you want to be delayed
            completion("Recived data")
        }
    }
}

