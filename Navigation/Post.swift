//
//  Post.swift
//  Navigation
//
//  Created by Наргиза Тамеева on 09.05.2023.
//

import Foundation
import UIKit

struct Post {
    let author: String
    let description: String
    let image: String
    var likes: Int
    var views: Int
}

let posts = [
    Post(author: "marvel.official", description: "Сэмюэл Л Джексон воюет со скруллами в новом трейлере сериала Marvel «Секретное вторжение»", image: "marvelPost", likes: 10, views: 100),
    Post(author: "Evropa Plus", description: "Майли Сайрус в новой фотосессии для британского Vogue", image: "Майли Сайрус", likes: 150, views: 200),
    Post(author: "travelBloger", description: "Прекрасный, но опасный: чего следует остерегаться на Алтае", image: "Алтай", likes: 20, views: 300),
    Post(author: "Kino Info ", description: "Харрисон Форд не сдержал слёз", image: "HF", likes: 107, views: 400)
]
