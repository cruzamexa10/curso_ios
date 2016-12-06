//
//  AgregarViewController.swift
//  AppDemo
//
//  Created by L85 on 06/12/16.
//  Copyright © 2016 Integra IT. All rights reserved.
//

import UIKit

protocol AgregarViewControllerDelegate {
    func agregarRegistro(nombre:String, edad:Int)
    func editarRegistro(nombre:String, edad:Int, fila:Int)
}

class AgregarViewController: UIViewController {
    
    var nombre = ""
    var edad = 0
    var fila = -1
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtEdad: UITextField!
    @IBOutlet weak var lblValidacionNombre: UILabel!
    
    var delegado: AgregarViewControllerDelegate? = nil
    
    
    @IBAction func btnGuardarClick(_ sender: Any) {
        
        lblValidacionNombre.isHidden = true
        
        if(delegado != nil){
            if(txtNombre.text != nil && (txtNombre.text?.characters.count)! > 0) &&
                (txtEdad.text != nil && (txtEdad.text?.characters.count)! > 0){
                
                if(fila == -1){
                    delegado?.agregarRegistro(nombre: txtNombre.text!, edad: Int(txtEdad.text!)!)
                }
                else{
                    delegado?.editarRegistro(nombre: txtNombre.text!, edad: Int(txtEdad.text!)!, fila: fila)
                }
                self.navigationController!.popViewController(animated: true)
            }
            else{
                lblValidacionNombre.isHidden = false
                let alert = UIAlertController(title: "Error", message: "Los campos introducidos no son válidos", preferredStyle: .actionSheet)
                
                let defaultAction = UIAlertAction(title: "OK", style: .default, handler: {(UIAlertAction) in
                    
                })
                
                let cancelarAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: {(UIAlertAction) in
                    self.navigationController!.popViewController(animated: true)
                })
                
                alert.addAction(defaultAction)
                alert.addAction(cancelarAction)
                
                present(alert, animated: true, completion: {
                    
                })
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtNombre.text = nombre
        txtEdad.text = "\(edad)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
