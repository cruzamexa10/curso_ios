//
//  ViewController.swift
//  AppDemo
//
//  Created by L85 on 05/12/16.
//  Copyright © 2016 Integra IT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DetalleViewControllerDelegate, AgregarViewControllerDelegate {
    
    @IBOutlet weak var tblTabla: UITableView!
    
    var filaSeleccionada = -1
    var datos = [("David", 28), ("Luis", 26)]
    var esEdicion:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier! {
        case "DetalleSegue":
            let view = segue.destination as! DetalleViewController
            view.numeroDeFila = filaSeleccionada
            view.dato = datos[filaSeleccionada].0
            view.datoNumero = datos[filaSeleccionada].1
            view.delegado = self
            break
        case "AgregarSegue":
            let view = segue.destination as! AgregarViewController
            if(esEdicion){
                view.fila = filaSeleccionada
                view.edad = datos[filaSeleccionada].1
                view.nombre = datos[filaSeleccionada].0
                esEdicion = false
            }
            view.delegado = self
            break
        default:
            break
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return datos.count
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let eliminar = UITableViewRowAction(style: .destructive, title: "Borrar", handler: borrarFila)
        let editar = UITableViewRowAction(style: .normal, title: "Editar", handler: editarFila)
        
        return [eliminar, editar]
    }
    
    func borrarFila(sender: UITableViewRowAction, indexPath: IndexPath){
        datos.remove(at: indexPath.row)
        tblTabla.reloadData()
    }
    
    func editarFila(sender: UITableViewRowAction, indexPath: IndexPath){
        esEdicion = true
        filaSeleccionada = indexPath.row
        performSegue(withIdentifier: "AgregarSegue", sender: sender)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    
        let proto = (indexPath.row % 2 == 0) ? "proto1" : "proto2"
        
        let vista = tableView.dequeueReusableCell(withIdentifier: proto, for: indexPath) as! FilaTableViewCell
        vista.lblDerecha.text = "\(datos[indexPath.row].1)"
        vista.lblIzquierda.text = datos[indexPath.row].0
        return vista
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Fila \(indexPath.row)")
        filaSeleccionada = indexPath.row
        performSegue(withIdentifier: "DetalleSegue", sender: self)
    }
    
    func numeroCambiado(numero: Int) {
        print("Número cambiado \(numero)")
        
        datos[numero].1 = datos[numero].1 + 1
        
        tblTabla.reloadData()
    }
    
    func agregarRegistro(nombre: String, edad: Int) {
        datos.append((nombre, edad))
        tblTabla.reloadData()
    }
    
    func editarRegistro(nombre: String, edad: Int, fila: Int) {
        datos[fila].1 = edad
        datos[fila].0 = nombre
        tblTabla.reloadData()
    }
    
    @IBAction func btnAgregarClick(_ sender: Any) {
        performSegue(withIdentifier: "AgregarSegue", sender:self)
    }
}

