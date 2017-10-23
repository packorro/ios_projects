//
//  TableViewController.swift
//  guardaPalabras
//
//  Created by Packo on 10/20/17.
//  Copyright © 2017 Packo. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

    
    //var palabrasTabla:[String] = ["Lunes","Martes","Puerta"]
    
    var managedObjects:[NSManagedObject] = []

    
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
            //A
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        
        let managedContext = appDelegate!.managedObjectContext
        
        //B
        let fetchRequest = NSFetchRequest(entityName: "Lista")
        
        //C
        
        do {
           //let result =  try managedContext.executeFetchRequest(fetchRequest)
           let  result = (try! managedContext.executeFetchRequest(fetchRequest)) as! [NSManagedObject]
            
            managedObjects = result
        } catch let error as NSError {
                print ("No puede recuoerar los datos guardados. El error fue: \(error), \(error.userInfo)")
        }
        

           }

   
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return managedObjects.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let managedObject  = managedObjects[indexPath.row]
        
        cell.textLabel?.text = managedObject.valueForKey("palabra") as? String
        
        // Configure the cell...

        return cell
    }
    
    
    
    @IBAction func agregarPalabras(sender: AnyObject) {
        
        
        let alerta = UIAlertController(title: "Nueva Palabra", message: "Agrega Palabra", preferredStyle: .Alert)
        
        
        let guardar  = UIAlertAction(title: "Agregar", style: .Default, handler:{  (UIAlertAction) in
            let textField = alerta.textFields!.first
           // self.palabrasTabla.append(textField!.text!)
            self.guardaPalabra(textField!.text!)
            self.tableView.reloadData()
            })
        
       
        let cancelar = UIAlertAction(title: "Cancelar", style: .Default)
        {(UIAlertAction) -> Void in }
        
        alerta.addTextFieldWithConfigurationHandler { (textField : UITextField!) -> Void in }
        
        
        alerta.addAction(guardar)
        alerta.addAction(cancelar)
        
        presentViewController(alerta, animated: true, completion: nil)
        
        
        
    }
    
    func guardaPalabra(palabra:String) {
        
        
        let appDelegate  = UIApplication.sharedApplication().delegate as? AppDelegate
        let managedContext = appDelegate?.managedObjectContext
        
        // let managedContext = appDelegate.persistentContainer.viewContext
       
        
        let entity  = NSEntityDescription.entityForName("Lista", inManagedObjectContext: managedContext!)
        
        let managedObject = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        managedObject.setValue(palabra, forKeyPath: "palabra")
        
        do {
         try managedContext!.save()
            managedObjects.append(managedObject)
        } catch let error as NSError {
            print ("No se pudo guardar, error: \(error), \(error.userInfo)")
        }
        
        
    }
    
    
 
}
