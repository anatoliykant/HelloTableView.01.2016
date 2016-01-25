//
//  TableViewController.swift
//  HelloTableView
//
//  Created by anatoliy.kant on 25.01.16.
//  Copyright © 2016 anatoliy.kant. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //создать пустой массив, в котором будут содержаться строки
    var items:[String] = [String]()
    
    override func viewDidLoad() {
        setupData()
        
        super.viewDidLoad()
        //станем у tableView его делегатом и DataSource
        tableView.delegate   = self
        tableView.dataSource = self
    }
    
    func setupData() {
        //семейство шрифтов в виде массива строк с их названиями
            let familyNames = UIFont.familyNames()
        
        //для названия каждого семейства шрифтов
        for aFamilyName in familyNames {
            //найдем все шрифты этого семейства
            let allFontsOFThisFamily:[String]  = UIFont.fontNamesForFamilyName(aFamilyName)
            
            //все строки из allFontsOfThisFamily будут пренесены в items
            items += allFontsOFThisFamily
        }
    }
}

//Поддержка протокола UITableViewDelegate
extension TableViewController: UITableViewDelegate {
    
}

extension TableViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //убедимся, что у нас есть какие-то элементы для отображения
        //guard items != nil else {
        //    return 0
        //}
        return items.count
    }
    
    //indexPath - это адрес ячейки в таблице
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        //Запросить прототип ячейки у TableView
        let cell = tableView.dequeueReusableCellWithIdentifier("JustACellID", forIndexPath: indexPath)
        
        
        let fontName = items[indexPath.row]
        let font = UIFont(name: fontName, size: 14)
        
        //Зная, что по indexPath у нас лежит кокретный текст для конкретной ячейки вставим его туда
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.font = font
        
        //вернем ячейку
        return cell
    }
}
