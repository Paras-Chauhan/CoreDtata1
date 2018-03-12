

import UIKit
import  CoreData

class CoreDataHandler: NSObject
{
    private class func getContext () -> NSManagedObjectContext
   
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
        
    }
    //MARK :- TO Save Objects
    
    class func saveObject (username : String, password : String)-> Bool
    {
        let context =  CoreDataHandler.getContext ()
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        
        let manageObject  = NSManagedObject(entity: entity!,insertInto : context)
        manageObject.setValue(username, forKey: "user_name")
        manageObject.setValue(password, forKey: "password")
        
        do
        {
            try context.save()
            return true
        }
        catch
        {
            return false
        }
    }
    //MARK :- TO Fetch Objects
    class func fetchObject () -> [User]?
    {
        let  context  = CoreDataHandler.getContext()
        var user:[User]? = nil
        
        do
        {
            user = try context.fetch(User.fetchRequest())
            return user
        }
        catch
        {
            return user
        }
    }
    //MARK :- TO Delete Objects
    class func deleteObject(user : User) -> Bool
    {
         let  context  = CoreDataHandler.getContext()
        context.delete(user)
        do
        {
            try context.save()
            return true
        }
        catch
        {
            return false
        }
    }
       //MARK :- TO  Clean Delete Objects (All Delete)
    
    class func cleanDelete () -> Bool{
        let  context  = CoreDataHandler.getContext()
        let delete = NSBatchDeleteRequest(fetchRequest: User.fetchRequest())
        do
        {
            try context.execute(delete)
            return true
        }
        catch
        {
            return false
        }
    }
    //MARK:- To Filter Data
    
    class func filterData() -> [User]{
          let  context  = CoreDataHandler.getContext()
        
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        
        var user :[User]? = nil
       let  predicate = NSPredicate(format : "username contains[c] %@","2")
        
    fetchRequest.predicate = predicate
        do
        {
            user = try context.fetch(fetchRequest)
            return user!
        }
        catch
        {
            return user!
        }
        
    }
}
