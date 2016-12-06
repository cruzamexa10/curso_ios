//
//  ViewController.swift
//  AppDemo
//
//  Created by L85 on 05/12/16.
//  Copyright © 2016 Integra IT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let datos = [("David", 28), ("Luis", 26)]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return datos.count
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
    }
}

