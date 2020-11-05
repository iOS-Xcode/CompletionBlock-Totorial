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
        //Called 1
        print("viewController - viewDidLoad callled")
        
        KRProgressHUD.show()
        
        sayHi(completion: { result in
            //Called 4
            print("It is from completion block \(result)")
            KRProgressHUD.showSuccess()
            self.hello.text = result
        })
        //Called 3
        print("Is this the end? or not")
    }
    //Asynchronous process and completion block with send with string

    fileprivate func sayHi(completion : @escaping(String) -> () ) {
        //Called 2
        print("viewController - sayHi Method callled")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
           // Code you want to be delayed
            completion("Recived data")
        }
    }
}

