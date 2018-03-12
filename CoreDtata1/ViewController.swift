//
//  ViewController.swift
//  CoreDtata1
//
//  Created by Appinventiv mac on 06/03/18.
//  Copyright © 2018 Appinventiv mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var user : [User]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CoreDataHandler.saveObject(username: "Paras", password: "1234")
        user = CoreDataHandler.fetchObject()

        print ("Before Delete")
        for i in user!{
           print ("UserName : \(i.user_name!) \n Password : \(i.password)")
        }
        
        print (user?.count)
       
        if CoreDataHandler.deleteObject(user: user![0]) {
        user = CoreDataHandler.fetchObject()
         print ("After Delete")
        for i in user!{
            print ("UserName : \(i.user_name!) \n Password : \(i.password)")
        }
            print (user?.count)
        }
        
        //MARK :- UNComment this to delete all data
        
//         print ("After Clean Delete")
//        if  CoreDataHandler.cleanDelete() {
//            user = CoreDataHandler.fetchObject()
//            print (user?.count)
//        }
        
        // Adding Objects to  test filter
        
//        user = CoreDataHandler.filterData()
//        for i in user!{
//            print ("UserName : \(i.user_name!) \n Password : \(i.password)")
//        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

