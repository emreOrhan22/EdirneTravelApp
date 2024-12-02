//
//  detailsViewController.swift
//  tableWiev
//
//  Created by Emre on 10.10.2024.
//

import UIKit

class detailsViewController: UIViewController {

    @IBOutlet weak var landMarkNameLabel: UILabel!
    @IBOutlet weak var landMarkImageView: UIImageView!
    @IBOutlet weak var landMarkDescriptionLabel: UILabel!
    
    var selectedLandMarkName = ""
    var selectedLandMarkImage = UIImage()
    var selectedLandMarkDescription = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        landMarkNameLabel.text = selectedLandMarkName
        landMarkImageView.image = selectedLandMarkImage
        landMarkDescriptionLabel.text = selectedLandMarkDescription

       
    }
    

    

}
