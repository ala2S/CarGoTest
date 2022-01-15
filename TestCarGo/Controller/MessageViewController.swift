//
//  MessageViewController.swift
//  TestCarGo
//
//  Created by alaa on 14/01/2022.
//

import UIKit

class MessageViewController: UIViewController {
    
    //MARK:- Outlets
    
    
    //MARK:- Variables

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    //MARK:- Load Methods
    
    // will   always load with calling screen
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupTools()
    }
    
    
    // load only one time
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        
    }
  
    
    //MARK:- Actions
  
    
    //MARK:- Methods
    
    func setupTools() {
        
        let logo = UIImage(named: "logo.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView

    
    }
    
  
    
    
    //MARK:- Networking
    
    



}
