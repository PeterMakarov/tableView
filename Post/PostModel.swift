//
//  PostModel.swift
//  Navigation
//
//  Created by Петр Макаров on 12.05.2022.
//

import Foundation
import UIKit

struct PostModel {
    
    var title: String
    var author: String
    var description: String
    var image: UIImage?
    var likes: Int
    var views: Int
    
    
    static func makeSomePost() -> [[PostModel]] {
        
        var model = [[PostModel]]()
        
        var section = [PostModel]()
        
        section.append(PostModel(title: "Коты всегда собирают много лайков", author: "User ID 1035325", description: "просто кошка", image: UIImage(named: "125029d8-203e-4870-8a30-93238b320951"), likes: 999, views: 999))
        
        section.append(PostModel(title: "NEWS", author: "Breaking IT news", description: "Cвежие новости к этому часу", image: UIImage(named: "IMG_9113"), likes: 257, views: 125))
        
        section.append(PostModel(title: "Курорты Красной поляны", author: "sochi krasnaya polyana", description: "Экологически чистый деревянный сруб Белый гриб вырос в зоне выката на отметке +960 и встречает своих гостей с исконно кубанским радушием и гостеприимством. Национальное застолье на Кубани всегда отличалось обилием подаваемых закусок и частой переменой блюд. Жителям и гостям олимпийской столицы будет предложено с головой окунуться в хлебосольную атмосферу уютной старины. Белый гриб превратит ваше застолье в настоящий пир – яркий, роскошный и удивительно вкусный.", image: UIImage(named: "IMG_6520"), likes: 400, views: 755))
        
        section.append(PostModel(title: "Сова является амбивалентным символом. Это птица мудрости.", author: "User ID 9646801", description: "Новый пазл собран", image: UIImage(named: "IMG_6394"), likes: 115, views: 195))
        
        for _ in 0...section.count - 1 {
            model.append(section)
        }

        return model
    }
}

