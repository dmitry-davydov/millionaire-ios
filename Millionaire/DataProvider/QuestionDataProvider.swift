//
//  QuestionDataProvider.swift
//  Millionaire
//
//  Created by Дима Давыдов on 18.02.2021.
//

import Foundation

class QuestionDataProvider {
    
    static var shared = QuestionDataProvider()
    private init() {}
    
    /// тут можно дергать апи, если хочется подтянуть откуда-то вопросы
    class func loadQuestions() -> [Question] {
        return [
            Question(text: "Сколько будет 2+2?", variants: [
                Answer.a: Variant(text: "1", isRight: false),
                Answer.b: Variant(text: "2", isRight: false),
                Answer.c: Variant(text: "3", isRight: false),
                Answer.d: Variant(text: "4", isRight: true),
            ]),
            Question(text: "А сколько будет 100+100?", variants: [
                Answer.a: Variant(text: "Не сосчитать", isRight: false),
                Answer.b: Variant(text: "Столько пальцев нет на руке", isRight: true),
                Answer.c: Variant(text: "Не знаю", isRight: false),
                Answer.d: Variant(text: "199", isRight: false),
            ]),
            Question(text: "Получится ли устроиться на работу IOS разработчиком после окончания курсов GeekBrains?", variants: [
                Answer.a: Variant(text: "Да!!", isRight: false),
                Answer.b: Variant(text: "Конечно!", isRight: false),
                Answer.c: Variant(text: "Не знаю", isRight: true),
                Answer.d: Variant(text: "Нет", isRight: false),
            ]),
            Question(text: "Вы оптимист?", variants: [
                Answer.a: Variant(text: "Спросите у моей мамы", isRight: true),
                Answer.b: Variant(text: "Да", isRight: false),
                Answer.c: Variant(text: "Нет", isRight: false),
                Answer.d: Variant(text: "Не знаю", isRight: false),
            ])
        ]
    }
}
