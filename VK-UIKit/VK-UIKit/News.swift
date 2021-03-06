//
//  News.swift
//  VK-UIKit
//
//  Created by Владимир on 26.02.2021.
//

import Foundation


struct News {
    
    var autor: User
    var textNews: String
    var photo: String
    
    var likeNamber: Int
    var commentNamber: Int
    var lookNamber: Int
    
    var isLiked = false
    
    func getAutorFullName() -> String {
        return autor.fullName
    }
    
    func getAutorAvatar() -> String {
        return autor.avatar ?? ""
    }
}


class GlobalDataNews {
    
    static var data = GlobalDataNews()
    
    private var news = getGlobalDataNews()
    var count: Int {
        return news.count
    }
    
    
    private init() {}
    
    
    func getNews(index: Int) -> News? {
        var outputNews: News? = nil
        if index >= 0 && index < news.count {
            outputNews = news[index]
        }
        return outputNews
    }
    
    func setLike(index: Int) {
        if index >= 0 && index < news.count {
            news[index].isLiked = !news[index].isLiked
            if news[index].isLiked {
                news[index].likeNamber += 1
            } else {
                news[index].likeNamber -= 1
            }
        }
    }
}




private func getGlobalDataNews() -> [News] {
    
    let text: [String] = [
        "В специальной чистовой камере компании Thales Alenia Space в Каннах (Франция) совместными усилиями российских и европейских специалистов обеспечена установка марсохода на посадочную платформу, а также проведены электрические испытания, включающие проверку передачи данных и питания между платформой и марсоходом. Посадочная платформа с установленным на ней марсоходом образуют «посадочный модуль».\n\nМиссия ExoMars-2022 — второй этап крупнейшего совместного проекта Госкорпорации «Роскосмос» и Европейского космического агентства по исследованию поверхности и подповерхностного слоя Марса в непосредственной близости к месту посадки, проведение геологических исследований и поиск следов возможного существования жизни на планете. Он откроет новый этап исследования космоса для мирового научного сообщества.",
        "Daniil Medvedev vows streaks are made to be broken.\nUnfortunately for the Muscovite – on a 20-match unbeaten stretch – he ran head-on into a man on a 20-match Australian Open streak at Melbourne Park on Sunday night.\nSomething had to give.\n\nWhile it was Djokovic who came out a 7-5 6-2 6-2 victor, Medvedev departed with much to be proud of from his route to a second major final.",
        "Эмма Стоун так и не подтвердила тот факт, что вышла замуж за бойфренда. И, видимо, не собирается делать никаких официальных сообщений о беременности, хотя наблюдатели уже зафиксировали перемены во внешности актрисы, а инсайдеры констатировали радостную новость.",
        "Bitcoin (биржевой тикер - BTC) – это первая криптовалюта, выпуск которой не контролируется ни одним официальным финансовым учреждением, она не привязана к ВВП какого-либо государства. При этом, биткоин выполняет основные функции денег: может быть использован для купли/продажи услуг и товаров, как средство сбережения и обмена. Эта валюта торгуется на биржах, где в зависимости от спроса, устанавливается ее курс по отношению к традиционным и другим цифровым валютам.\n\nЦелью первых разработчиков биткоина было получение независимости от банковской системы и снижение комиссий за транзакции. По их мнению, хранение денег в современных банках связано с большим риском, а именно: средства могут быть заблокированы, банк может отказать в проведении конкретной транзакции, информация о владельцах счетов и деньги могут быть украдены хакерами, банковские комиссии за переводы и обслуживание слишком высокие.",
        "С 19 по 26 февраля в Сочи пройдет Ежегодная выездная конференция по квантовым вычислениям. Конференция станет шагом к построению устойчивой экосистемы квантовых вычислений в России и выходу ее на международный экспертный уровень. Соорганизаторами мероприятия выступят НИТУ «МИСиС» и Центр квантовых коммуникаций НТИ НИТУ «МИСиС»\n\nВ 2020 году под эгидой Госкорпорации «Росатом» был создан новый национальный проект – Национальная квантовая лаборатория, участниками которой стали НИТУ МИСиС, СП «Квант» (входит в состав Госкорпорации «Росатом»), НИУ ВШЭ, МФТИ (НИУ), Физический институт им. П.Н. Лебедева РАН, Российский квантовый центр, Фонд «Сколково» и др., и которая вывела квантовые вычисления в России на новый уровень.\n\nСочи станет площадкой для обсуждения достижений и планов всех участников консорциума Национальной квантовой лаборатории."
    ]
    
    let img: [String] = [
        "ExoMars",
        "ao2021",
        "emma",
        "bitcoin",
        "rqc"
    ]
    
    let autor: [Int] = [1, 3, 5, 7, 11]
    
    
    var outputData = [News]()
    
    if text.count == img.count && autor.count == text.count {
        for i in 0 ..< text.count {
            let news = News(autor: Frends.data.getUser(id: autor[i])!, textNews: text[i], photo: img[i], likeNamber: i, commentNamber: i, lookNamber: Int.random(in: i+10 ... 300))
            outputData.append(news)
        }
    }
    
    return outputData
}
