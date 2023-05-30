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
    Post(author: "marvel.official", description: "Сэмюэл Л Джексон воюет со скруллами в новом трейлере сериала Marvel «Секретное вторжение \n О сериале :Инопланетная раса скруллов получает контроль над всеми аспектами жизни землян. Нику Фьюри вместе с командой агентов организации «Щ.И.Т.» предстоит спасти положение и заодно всю планету от неминуемой гибели.»", image: "marvelPost", likes: 10, views: 100),
    Post(author: "Evropa Plus", description: "Майли Сайрус в новой фотосессии для британского Vogue", image: "Майли Сайрус", likes: 150, views: 200),
    Post(author: "travelBloger", description: "Прекрасный, но опасный: чего следует остерегаться на Алтае", image: "Алтай", likes: 20, views: 300),
    Post(author: "Kino Info ", description: "Не сдержал слез: Харрисон Форд попрощался с ролью Индианы Джонса. \n Это пятый и последний фильм 80-летнего актера об  \"Индиане Джонсе\", франшизе, в которой он играет главную роль. Новая часть – первый выход персонажа на большой экран после фильма \"Индиана Джонс и Королевство хрустального черепа\"2008 года. \"Индиана Джонс и циферблат судьбы \" выйдет в кинотеатрах США 30 июня.", image: "HF", likes: 107, views: 400)
]
