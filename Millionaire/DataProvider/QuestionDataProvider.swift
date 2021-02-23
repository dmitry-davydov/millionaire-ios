//
//  QuestionDataProvider.swift
//  Millionaire
//
//  Created by Дима Давыдов on 18.02.2021.
//

import Foundation

class QuestionDataProvider {
    /// тут можно дергать апи, если хочется подтянуть откуда-то вопросы
    class func loadQuestions() -> [Question] {
        return [
            Question(text: "Сколько будет 2+2?", variants: [
                Answer.A: Variant(text: "1", isRight: false),
                Answer.B: Variant(text: "2", isRight: false),
                Answer.C: Variant(text: "3", isRight: false),
                Answer.D: Variant(text: "4", isRight: true),
            ]),
            Question(text: "А сколько будет 100+100?", variants: [
                Answer.A: Variant(text: "Не сосчитать", isRight: false),
                Answer.B: Variant(text: "Столько пальцев нет на руке", isRight: true),
                Answer.C: Variant(text: "Не знаю", isRight: false),
                Answer.D: Variant(text: "199", isRight: false),
            ]),
            Question(text: "Получится ли устроиться на работу IOS разработчиком после окончания курсов GeekBrains?", variants: [
                Answer.A: Variant(text: "Да!!", isRight: false),
                Answer.B: Variant(text: "Конечно!", isRight: false),
                Answer.C: Variant(text: "Не знаю", isRight: true),
                Answer.D: Variant(text: "Нет", isRight: false),
            ]),
            Question(text: "Вы оптимист?", variants: [
                Answer.A: Variant(text: "Спросите у моей мамы", isRight: true),
                Answer.B: Variant(text: "Да", isRight: false),
                Answer.C: Variant(text: "Нет", isRight: false),
                Answer.D: Variant(text: "Не знаю", isRight: false),
            ])
        ]
    }
}
