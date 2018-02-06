
import UIKit

class AlertService{
    private init() {}
    
    static func addUser(in vc: UIViewController, completion: @escaping (User) -> Void){
        let alert = UIAlertController(title: "Add User", message: nil, preferredStyle: .alert)
        alert.addTextField { (nameTF) in
            nameTF.placeholder = "Name"
        }
        
        alert.addTextField { (ageTF) in
            ageTF.placeholder = "Age"
            ageTF.keyboardType = .numberPad
        }
        
        let add = UIAlertAction(title: "Add", style: .default) { _ in
            guard let name = alert.textFields?.first?.text,
            let ageString = alert.textFields?.last?.text,
            let age = Int(ageString)
                else{return}
            
            let user = User(name: name, age: age)
            completion(user)
        }
        
        alert.addAction(add)
        vc.present(alert, animated: true, completion: nil)
    }
    
    static func update(_ user: User, in vc: UIViewController, completion: @escaping (User) -> Void){
        let alert = UIAlertController(title: "Update \(user.name)", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (ageTF) in
            ageTF.placeholder = "Age"
            ageTF.keyboardType = .numberPad
            ageTF.text = String(user.age)
        }
        
        let update = UIAlertAction(title: "Update", style: .default) { _ in
            guard 
                let ageString = alert.textFields?.last?.text,
                let age = Int(ageString)
                else{return}
            
            var updatedUser = user
            updatedUser.age = age
            completion(updatedUser)

        }
        
        alert.addAction(update)
        vc.present(alert, animated: true, completion: nil)
    }
    
    
}
