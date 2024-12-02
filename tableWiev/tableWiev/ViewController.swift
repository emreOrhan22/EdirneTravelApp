//
//  ViewController.swift
//  tableWiev
//
//  Created by Emre on 10.10.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var landMarkName = [String]()
    var landMarkSubtitle = [String]()
    var landMarkImage = [UIImage]()
    var landMarkDescription = [String]()
    
    var chosenLandMarkName = ""
    var chosenLandMarkImage = UIImage()
    var chosenLandMarkDescription = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        landMarkName.append("Selimiye Camii")
        landMarkName.append("Meriç Nehri Köprsü")
        landMarkName.append("Edirne Ciğeri")
        
        landMarkSubtitle.append("Tarihi Yapı")
        landMarkSubtitle.append("Tarihi Yapı")
        landMarkSubtitle.append("Yeme-İçme")
        
        landMarkImage.append(UIImage(named: "selimye.jpg")!)
        landMarkImage.append(UIImage(named: "meric.jpg")!)
        landMarkImage.append(UIImage(named: "ciger.jpg")!)
        
        landMarkDescription.append("Selimiye Camii, Osmanlı padişahı II. Selim döneminde Mimar Sinan'ın yaptığı ve Osmanlı'nın önceki başkenti Edirne'de bulunan bir külliyedir. Mimar Sinan'ın 80 yaşında yaptığı ve ustalık eserim şeklinde nitelendirdiği Selimiye Camii, gerek Mimar Sinan'ın, gerek Osmanlı mimarisinin en önemli eserleri arasında sayılır. ")
        landMarkDescription.append("Mecidiye Köprüsü veya diğer adıyla Meriç Köprüsü, 1842'de Abdülmecid zamanında yapımına başlanmış ve 1847'de bitirilmiş köprüdür. Edirne-Karaağaç yolunda, Meriç nehri üzerinde yer alır. 263 metre uzunluk, 7 metre genişlikte, 13 ayak üzerinde 12 sivri kemerli olup yanlara doğru eğimli özellikler taşımaktadır")
        landMarkDescription.append("Ciğer tava, özellikle Edirne'de yapılan tavadır.Edirne Tava Ciğeri Türk Patent ve Marka Kurumu tarafından tescillenmiş ve coğrafi işaret almıştır. Basılı ilk yemek kitabı Melceü’t-Tabbâhîn'de tarifi vardır. Ciğer tavanın kendine has aromasının sırrı kızartma yağıdır. Ciğerin zarı soyulur.")
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landMarkName.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //cell.textLabel?.text = "Text" //Yakında kaldırılıcak eski yöntem ios 18de kaldırıldı
        var content = cell.defaultContentConfiguration()
        content.text = landMarkName[indexPath.row]
        content.secondaryText = landMarkSubtitle[indexPath.row]
        cell.contentConfiguration = content
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandMarkName = landMarkName[indexPath.row]
        chosenLandMarkImage = landMarkImage[indexPath.row]
        chosenLandMarkDescription = landMarkDescription[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destionVC = segue.destination as! detailsViewController
            destionVC.selectedLandMarkName = chosenLandMarkName
            destionVC .selectedLandMarkImage = chosenLandMarkImage
            destionVC .selectedLandMarkDescription = chosenLandMarkDescription
    }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            landMarkName.remove(at: indexPath.row)
            landMarkImage.remove(at: indexPath.row)
            landMarkDescription.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        }
    }




