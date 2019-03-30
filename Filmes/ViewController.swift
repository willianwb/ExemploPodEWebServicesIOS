//
//  ViewController.swift
//  Filmes
//
//  Created by PUCPR on 29/03/19.
//  Copyright © 2019 PUCPR. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var titulonavi: UINavigationItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlBase = "https://api.themoviedb.org/3/tv/60574?api_key="
        let key = "3a853d9e89266d9ab9634e88897e9a8e"
        let url = "\(urlBase)\(key)"
        let baseImage = "https://image.tmdb.org/t/p/w500"
        
        Alamofire.request(url).responseJSON{(response) in
            //print(response.result.value!)
            
            if response.result.isSuccess {
                let json = JSON(response.result.value!)
                 print(json)
   //             print(json["title"])
    //            print(json["production_companies"][0]["name"])
                for i in json["production_companies"]{
                    print(i.1["name"])
                    
                }
                self.titulonavi.title = json["name"].stringValue
                // montar o caminho
                let imagePath = "\(baseImage)\(json["poster_path"].stringValue)"
                print(imagePath)
                
                // criar a URL
                
                let urlImage = URL(string: imagePath)
                
                // faz o download dos bytes da imagem
                
                let bytes = try? Data(contentsOf: urlImage!)
                
                //criar a imagem a partir dos bytes lidos
                let image = UIImage(data: bytes!)
                
                //mostrar a imagem na view
                
                self.imageview.image = image
                
            }
        }
        
    }


}

