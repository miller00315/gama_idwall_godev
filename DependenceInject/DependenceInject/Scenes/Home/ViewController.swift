//
//  ViewController.swift
//  DependenceInject
//
//  Created by Idwall Go Dev 001 on 30/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    let api = ServicesApi()
    
   // private let userApi: ServicesApi
    
    private let apiServiceProtocol: ServicesProtocol
    
    init(apiServiceProtocol: ServicesProtocol) {
        
        self.apiServiceProtocol = apiServiceProtocol
        
        super.init(nibName: nil, bundle: nil)
    }
    
 //   init(userApi: ServicesApi) {
 //       self.userApi = userApi
  //      super.init(nibName: nil, bundle: nil)
  //  }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .orange
        
        api.getUsers { result in
            switch result {
                
            case .success(let users):
                print("Users propriedade \(users)")
            case .failure(let error):
                print("Error propriedade \(error)")
            }
        }
        
        apiServiceProtocol.getUsers { result in
                  switch result {
                      
                  case .success(let users):
                      print("Users protocol \(users)")
                  case .failure(let error):
                      print("Error protocol \(error)")
                  }
             }
        
      //  userApi.getUsers { result in
      //      switch result {
                
       //     case .success(let users):
       //         print("Users parametro \(users)")
       //     case .failure(let error):
        //        print("Error parametro \(error)")
         //   }
       // }
    }


}

