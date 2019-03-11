//
//  NewsData.swift
//  inShorts
//
//  Created by Hitesh Agarwal on 11/03/19.
//  Copyright © 2019 Hitesh  Agarwal. All rights reserved.
//

import Foundation

class NewsData {
    static var newsHeadLine = ["Great learning offers AI program with University of Texas at Austin",
                        "NASA captures pics of shockwaves merging from supersonic jets",
                        "My lucky day: Man saved from Ethiopia crash by being 2 mins late",
                        "Indian e-comm, internet startups raised over $7 bn in 2018: EY"]
    static var newsMessage = [
        "Professionals can upskill in Artificial Intelligence with Great Learning's program, offered in collaboration with Great Lakes and The University of Texas at Austin. Rated 4.7/5 by learners, it offers practical skills in AI and ML through state-of-the-art GPU labs and industry-relevant projects, guided by experienced industry practitioners. Learners receive certificates from UT Austin and Great Lakes upon program completion.",
        "NASA has captured what it claims the 'first-ever' images of the interaction of shockwaves from two supersonic aircraft in flight. They were captured by an aircraft, fitted with an updated imaging system, flying above two 'T-38' jets. The images were captured as the three aircraft were at the exact right place at the right time, NASA said.",
        "Greece's Antonis Mavropoulos, who was saved from the Ethiopian Airlines crash after he arrived two minutes late for the flight, has written a Facebook post titled 'My lucky day', following the accident. He revealed he was questioned by airport authorities as he was the only passenger booked onto the flight who wasn't on board. \"I'm grateful to live,\" Antonis added.",
        "According to a report by Ernst & Young, Indian e-commerce and consumer internet companies have raised over $7 billion across 200 deals in private equity and venture capital in 2018. Of the total investment, startups including OYO Rooms, Swiggy and Byjus, among others, collectively raised $4.6 billion, the report added. Hyperlocal segment attracted the maximum amount of investment."
    ]
    
    static var links = [
        "https://inshorts.com/en/news/great-learning-offers-ai-program-with-university-of-texas-at-austin-1552278651071",
        "https://inshorts.com/en/news/nasa-captures-pics-of-shockwaves-merging-from-supersonic-jets-1552278606463",
        "https://inshorts.com/en/news/my-lucky-day-man-saved-from-ethiopia-crash-by-being-2-mins-late-1552282890729",
        "https://inshorts.com/en/news/indian-ecomm-internet-startups-raised-over-$7-bn-in-2018-ey-1552275021033"
    ]
    
    static var all: [News] = {
        var arrNews = [News]()
        for i in 0..<NewsData.newsHeadLine.count {
            let news = News(headLineArg: NewsData.newsHeadLine[i], message: NewsData.newsMessage[i], link: NewsData.links[i])
            arrNews.append(news)
        }
        return arrNews
    }()

    
}

class News {
    var headeLine: String
    var message: String
    var link: String
    init(headLineArg: String, message: String, link: String) {
        self.headeLine = headLineArg
        self.message = message
        self.link = link
    }
}
