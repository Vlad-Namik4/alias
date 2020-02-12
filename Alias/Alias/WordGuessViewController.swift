//
//  WordGuessViewController.swift
//  Alias
//
//  Created by  Vladyslav on 1/30/20.
//  Copyright © 2020  Vladyslav. All rights reserved.
//

import UIKit

class WordGuessViewController: UIViewController {
    var stop = "производство"
    
    var wordsToGuess = ["«банда»", "«бритоголовый»", "«вздутие»»", "«власть", "«волшебник»", "«воровство»", "«граница»", "«долг»", "«заслуга»", "«захлопывать", "«корзина»", "«лестница»", "«лифт»", "«лом", "место", "образец", "прогулка", "список", "существование", "тайна", "«тормоз»", "«упражняться»", "фильтры", "хол", "цветы", "шаблон", "шайка", "школа", "абсолют", "абстрактный", "автомобиль", "авторитаризм",  "автор", "агент", "агитация", "агрегат", "агрессия", "ажиотаж",  "аксиома", "активность",  "акция", "алкоголь", "альтруизм",  "амнистия",  "анатомия", "анкета",   "антропология",  "апостол", "аргумент", "аренда", "арендодатель",  "аристократия", "аристократ", "аристотель", "армия", "артефакт", "артист", "аскетизм", "атеист", "бандит", "банк", "банка", "банкир", "банкротство",  "бартер", "бегство", "бедность", "бездействие",  "безналичные",  "безопасность", "безработица", "безразличие", "белый", "бесконечно", "бесконечность", "бесплатный", "беспорядок",  "бессмысленность",  "биология", "биосфера",  "благо", "благодать", "блаженство", "близость", "бог",  "богатство",  "богема",  "болезнь",  "большинство", "борьба", "брак",  "бродяга", "буддизм",  "бумага",  "буржуазия", "быстро",  "бюджет", "бюджетный",  "бюрократия",  "валюта", "вверх",  "ведущий", "вексель", "величина",  "вера", "верификация",  "верования", "вертикальная",  "верующий", "верящий", "весь", "вето",  "вещество",  "взаимодействие", "взнос", "взрослый",  "вина",  "владелец",  "владение",  "власть", "влечение", "влияния", "влиять",  "вместе", "вместо", "вмешательства", "внедрения",  "вниз", "внутри", "внушение",  "возбуждения", "возврат", "воздействия",  "возмещения", "возможности",  "вознаграждение", "возраст", "возрастает",  "война",  "воля", "воображение", "вопрос", "воспитание",  "восприятие", "воспроизводить",  "восхождение",  "вред",  "временный", "время",  "вход", "выбор", "выборы",  "вывод", "выкуп",  "выплаты",  "выполнение", "выполнить",  "выпуск",  "высший", "выход",  "география", "геополитика",  "гипноз", "говорить", "головоломка", "голосование", "горизонт", "города",  "государство",  "готовность",  "гражданин", "граница",  "греческий", "грубый",  "группа", "губернатор", "давление",  "дата",  "дверь", "движение",   "дедукция", "дееспособность", "действие",  "действительность",  "дела", "делимое", "деловой", "демагог", "демография", "демократия", "демократическая",  "демпинг",  "деньги", "депозит", "депрессия", "депутат",  "дети", "детерминизм", "дефицит",  "дефолт", "деяние",  "диалект", "диктатура", "динамика", "дискриминация",  "добровольный", "договариваться", "договор",  "документ",  "долг",  "должник",  "должность",  "достижение",  "доход",  "драгоценности","друг",  "единственный",  "желание",  "жена", "женщина",  "жертва", "жест", "животное",  "жизнь", "забастовка",  "заблуждение",  "завоевания", "задание", "задача", "задержка", "займ", "заказчик", "закон", "закрытие",  "закупка",  "залог",  "занятия", "заплатить", "запрет","заставить",  "затраты", "захват",  "здания", "земля", "знак",  "знания", "значение", "золото", "зрение",  "идеализм",  "идея", "идеология", "идея", "иерархия",  "избыток", "издевательства", "изменения", "изобретения", "изоляция", "изоморфизм",  "имидж", "империя", "импичмент", "импорт", "имущество",  "инвестирование", "инвестиции", "инстинкт", "инструмент", "интерес", "интроверт", "интуиция",  "инфляция", "информация", "инфраструктура", "ипотека", "иррационализм", "искусство", "искусственно",  "исполнитель",  "исследования",  "истина","исторический", "источник", "исчезновение",  "капитал",  "капитализм",  "картель", "касты",  "категория", "качества", "квалификация",  "квота", "книга",  "кодекс",  "количество", "коллективный", "командная",  "комиссия",  "коммунисты", "комплекс", "конкуренты", "конкурентоспособность", "конкуренция",  "консервативное", "консерватизм", "конституция", "контракт", "контролировать", "контроль",  "контролёр",  "конфедерация", "конфликт", "корзина",  "косвенный",  "коэффициент",  "красиво", "красноречие","краткий", "кредит","кредитование","кредитоспособность",  "кровь", "ксенофобия", "культ",  "культура", "купить",  "купля-продажа",  "курение", "лаконичный",  "легитимный", "ленин", "лестница",  "лидер", "лидерство", "лизинг", "ликвидность",  "лицо",  "лицензия",   "личность", "личный",  "лобби", "логика",  "ложь", "локальный", "ломать", "лучший",  "любовь", "любой",  "люди",  "максималист",  "маржа", "маркетинг", "масса", "материальный", "материя", "меланхолик", "мембрана", "меньше",  "мероприятие","местность", "место", "месть", "метод", "механизм",  "механик", "мечта",  "минимальный", "минимум", "мир", "мирный", "мистика", "мнение", "множество", "мобильность",  "мода", "модель", "момент", "монета", "моногамия", "монополист",  "монополия", "мудрость",  "муж", "мужчина", "мужчинами", "мужчиной", "мужчины",  "мультипликатор", "мысль",  "мыслить", "мышления", "награда", "надзор", "название", "наименование", "найм", "найти", "наказание",  "наличие", "наличные", "налог",    "налогоплательщик",  "направление", "например", "наркотики", "народный", "народность", "народ",  "нарушения",  "население", "натуральный", "наука",  "национализация", "национализм",  "нация",  "невозможность", "невозмутимость",  "неделя",  "независимость", "необходимость", "неполноценность", "неприязнь",  "несколько",  "несоответствие",  "неуравновешенный",  "нирвана",  "номенклатура", "нравы",  "обвинение", "облигация", "обман", "обмен", "оболочка", "оборудование", "обоснование", "образ", "образец",  "обращение", "обучение", "общество", "общие", "объект",  "объяснить",  "объём", "обыкновенная", "обыск", "обычаи", "обязан",  "обязанности", "обязательные",  "ограничение", "одежда", "одновременно", "ожидаемое", "олигарх", "олигархия", "опасный", "описание", "опознавательный",  "определённый",  "опрос", "опыт",  "орган", "организация", "организм","оружие", "осваивать", "освобождение", "оскорбительный", "осмотр",  "особенность", "особый",  "остров", "осуждение", "осуществлять", "отбросы", "отбывания",  "ответственность", "отдать",  "отечественный", "отказ", "отклонить", "отменить",  "отношения", "отправка", "отражение", "отрезок", "отрицание",  "отсутствие",  "пакет", "память",  "парадигма", "параметр", "парламент",  "партия",  "патент",  "пацифизм", "пеня", "первоначально", "перемещение", "переработка", "перерождение", "переход", "период", "персонально", "пирамида", "плагиат", "план", "платежеспособный", "плательщик", "платить", "платный", "племя", "плохо",  "победа", "поведение",  "поворот", "повышение",  "подозреваемый",  "подражать",  "подрядчик", "подсознание", "познания", "познать", "поиски",  "покупатель",  "политика",  "политология", "полиция", "полномочия", "полностью",  "положение",  "получатель", "получение", "получить", "пользование", "пользователь", "помощь", "поровну",  "порядок",  "последовательность",  "последствия", "пособие", "посредник",  "построить", "поступления", "потерпевший",  "поток", "потребление", "потребления",  "почва", "почти", "пошлина", "появление",  "права",  "правила",  "править", "правитель",  "правительство",  "право",  "правонарушение", "правообладатель",  "прагматизм", "практика", "превосходство",  "предложение",  "предмет",  "предоставить",  "предпочтение", "предприниматель", "предприятие",  "представление",  "предчувствия",  "президент",  "прекращение", "препятствие", "преследование", "престиж", "преступление",  "преступник",  "претендента", "прибыль", "приватизация", "приверженность", "приговор", "приготовление",  "признать", "пример",  "принадлежит", "принадлежность", "принуждения", "принцип",  "принять", "приобрести",  "приобретение", "природа", "прирост", "приспособиться", "проблема",  "проведение",  "проверка",  "проверять", "проводить",  "прогноз", "прогресс", "прогрессивно", "прогрессивный",  "продажа",  "продать", "продукт", "продукция", "проживание", "прожиточный",  "производитель", "производительность", "производство", "производству", "произвол", "произвола", "прокат", "пролетариат", "промежуточное", "промышленности", "пропорциональная", "пропорционально", "пророчества", "простого", "пространстве", "пространством", "проступок", "протекционизм", "протест", "против", "противника", "противниками", "противовес", "противоречат", "противоречащих", "противоречивость", "противоречие", "протоклетки", "протяжении", "профицит", "процедура", "процент", "процентная", "проценты", "процесс", "процесса", "процессе", "процессы", "прошлого", "прошлом", "прошлому", "прямой", "психики", "психического", "психологизм", "психологии", "психотропных", "пустота", "путем", "путём", "пытаются", "работ", "работать", "работник", "работниками", "работники", "работников", "работником", "работодателем", "работодатель", "работу", "работы", "рабочих", "равновесие", "равновесия", "равновесная", "ради", "радикального", "разбирательства", "развивается", "развивающаяся", "развитие", "развитии", "развития", "разговаривать", "разграничивают", "разделе", "раздельного", "различных", "разменная", "размер", "размера", "размере", "размноженный", "размышлений", "разнообразие", "разным", "разных", "разорения", "разрешается", "разрешение", "разрешений", "разум", "разума", "разумное", "разыгрывания", "рамках", "ране", "ранее", "распались", "распоряжаться", "распределение", "распределены", "распределяются", "расслоение", "расстройства", "рассуждения", "растут", "расходами", "расходов", "расходы", "расчётов", "расчёты", "рациональная", "рациональных", "реализовать", "реального", "революции", "революция", "регресс", "регресса", "регрессу", "регулирование", "регулирования", "регулирующий", "регулярная", "режим", "результате", "результатов", "результатом", "реинкарнации", "реинкарнация", "рейдерство", "рейтинг", "религиозных", "рента", "ренту", "ренты", "респондент", "республика", "ресурсов", "ресурсы", "референдум", "реформ", "реформа", "рецепт", "рецессия", "речи", "решения", "решит", "ригидность", "риме", "ритор", "риторика", "роботов", "родстве", "родством", "роды", "рождения", "рок-музыке", "ролей", "роли", "роль", "рост", "роста", "росте", "ростом", "рубль", "руках", "руки", "руководством", "руководствуется", "рынка", "рынке", "рынок", "рыночная", "рыночного", "рыночной", "самом", "самореализация", "самостоятельная", "самоубийство", "сангвиник", "санкции", "санкций", "санкция", "сансара", "сбежать", "сбережения", "сбивают", "сбор", "сброда", "сбыта", "сверху", "сверхъестественные", "сверхьестественными", "свести", "свобод", "свобода", "свободе", "свободен", "свободное", "свободные", "свободы", "своего", "своей", "свои", "своим", "своими", "своих", "свой", "свойственным", "свою", "своём", "связанная", "связанных", "связей", "связи", "связь", "священника", "священников", "сговора", "сделать", "сделки", "сделок", "сдерживания", "себе", "себя", "сегрегация", "сект", "сельской", "сельскохозяйственной", "семейной", "семейных", "семьи", "семья", "сенат", "сети", "сила", "силами", "силовой", "силой", "силу", "сильная", "сильнейший", "сильно", "сильный", "символический", "символических", "символов", "символы", "синтез", "систем", "система", "систематизации", "систематическое", "системе", "системы", "ситуация", "сказка", "скинхедс", "скинхеды", "складывается", "скупка", "слабый", "славян", "славянских", "следит", "следователем", "следствия", "следствиям", "следует", "следующего", "следующие", "слепо", "слизь", "слишком", "слова", "слои", "слой", "служит", "случае", "случаи", "смена", "сменяющегося", "смерти", "смета", "смысл", "снижается", "снижение", "снизиться", "снизу", "снисхождение", "собираемых", "собирается", "соблюдать", "собой", "собрание", "собственников", "собственное", "собственной", "собственности", "собственность", "собственный", "событием", "совершение", "совершения", "совершенствования", "совершить", "совет", "совладельца", "совокупная", "совокупность", "современное", "современных", "согласится", "согласно", "согласные", "согласовании", "согласовать", "соглашение", "соглашения", "содержание", "содержащий", "создаваемый", "создание", "созданию", "создания", "созданная", "созданного", "созданные", "созданы", "создать", "создают", "сознание", "сокращение", "солнечной", "солнца", "сооружений", "сооружения", "соответствие", "соответствии", "соответствующий", "соотношение", "соратников", "сортировки", "сословия", "сосредоточена", "сосредоточены", "состава", "составе", "составление", "состоит", "состояние", "состояния", "состоящая", "состоящий", "софисты", "сохранение", "сохранению", "сохранения", "сохранять", "социал-дарвинизм", "социализации", "социализация", "социализме", "социалистического", "социалистическое", "социальная", "социального", "социальное", "социальной", "социальную", "социальные", "социальные-", "социальный", "социальных", "социологии", "социологической", "социометрия", "союз", "спад", "спада", "спарте", "специализированных", "специальном", "специальности", "специфическая", "списке", "списком", "список", "спичрайтеры", "сплочённых", "спора", "спортом", "способ", "способности", "способность", "спрос", "спроса", "сравнению", "среди", "средневековая", "средний", "средой", "средств", "средства", "средствами", "средство", "среды", "срок", "срока", "ссуд", "став", "ставка", "стагфляции", "стадии", "стал", "стандарты", "станки", "старейшин", "стариков", "старой", "старости", "статика", "статус", "статуса", "статусов", "статусы", "статьи", "стачка", "стереотип", "стереотипов", "стиль", "стимулирования", "стоимость", "сторона", "стороне", "стороны", "стран", "страна", "странах", "стране", "страну", "страны", "страстность", "стратификация", "страты", "страх", "стремилась", "стремление", "стремлению", "стремятся", "стриминг", "строгие", "строгий", "строительство", "строя", "структура", "структуры", "ступени", "стыд", "субкультура", "сублимация", "субъективный", "суверенитет", "суда", "судебного", "судебном", "судить", "судом", "суждение", "суждений", "суждения", "суицид", "сумеют", "сумма", "суммой", "сумму", "суммы", "суперэго", "суровой", "существование", "существования", "существует", "существуют", "существующем", "сфере", "сферу", "сферы", "схоластика", "сценок", "счастья", "счетах", "считали", "считают", "счёт", "счёте", "сырья", "табака", "табу", "тавтология", "тайное", "такая", "также", "такие", "таким", "таких", "такое", "такой", "таланта", "таланты", "таможенные", "таможенных", "танцующая", "творить", "темперамента", "теократия", "теология", "теоретическая", "теоретическое", "теории", "теория", "термин", "терминологии", "территориального", "территории", "территорию", "тесно", "тестов", "техника", "техники", "технику", "технических", "технократы", "технологический", "технофобы", "течение", "тимократия", "тиранию", "тирания", "товар", "товара", "товарами", "товарный", "товаров", "товары", "того", "токсинов", "толпа", "толпу", "толпы", "только", "тому", "торговли", "торговлю", "торговля", "торговые", "тоталитаризм", "точка", "точки", "традиционных", "транс", "транспортная", "транспортной", "требования", "требуют", "тревога", "тревоги", "тресты", "труд", "труда", "трудиться", "трудовая", "трудовой", "трудом", "туда", "увеличение", "увеличивается", "уверенность", "уголовного", "уголовным", "угрозам", "угрозы", "удалось", "удержания", "удовлетворения", "удовлетворить", "удостоверяющая", "удостоверяющий", "указанное", "указы", "указывающие", "улаживать", "улучшить", "умеет", "умения", "уменьшается", "умеренный", "умозаключение", "умысел", "универсалии", "унитарное", "уничтожения", "уплатить", "уплачена", "упорядочить", "управление", "управлении", "управления", "управляющему", "управляющий", "упрощение", "уравновешенный", "урбанизация", "уровень", "уровне", "уровня", "урожай", "усилителя", "условием", "условий", "условия", "условиям", "условиях", "усложнение", "услуг", "услугами", "услуги", "услуги:", "успех", "успехов", "успокоения", "установить", "установление", "установлении", "установлению", "установленном", "установленных", "установлены", "устной", "устойчивости", "устройства", "устройстве", "уступки", "усыновлении", "утверждение", "утописты", "утопию", "утопия", "участие", "участков", "участники", "участников", "учение", "ученики", "учеников", "учитель", "учителя", "учредитель", "учредителя", "учреждении", "учёбе", "ущерб", "фактам", "факторы", "факты", "фанатик", "федерация", "физика", "физике", "физики", "физиократы", "физические", "физический", "физических", "физического", "фиксированной", "фиксированную", "философии", "философия", "философия»", "философская", "философских", "финансирования", "финансовая", "финансовый", "финансовых", "фирм", "фирма", "фирме", "фирменное", "фирмой", "фирмы", "фискальная", "флегматик", "фобии", "фольклор", "фондовый", "форма", "формальная", "формальностей", "формации", "форме", "формула", "формы", "французского", "фратрии", "фундаментальные", "функционализм", "функцию", "характера", "характеризующий", "характеризующийся", "характерной", "харизма", "хозяйственной", "хозяйство", "холдинги", "холе»", "холерик", "хорошего", "хорошие", "хорошо", "хотят", "хочет", "христа", "христианского", "художественных", "художников", "царство", "целей", "цель", "целью", "целях", "цена", "ценам", "ценах", "цене", "ценз", "цензура", "ценная", "ценностей", "ценности", "ценность", "ценностях", "ценных", "ценовая", "ценой", "центрального", "центральных", "центре", "центром", "цену", "цены", "цепочке", "церковь", "цивилизации", "цивилизаций", "цивилизация", "цикл", "цикла", "части", "частичное", "частную", "частные", "частных", "часто", "часть", "чего", "чекодателя", "чекополучателю", "человек", "человека", "человеке", "человеком", "человеку", "человеческих", "человеческой", "человечество", "чередование", "через", "четыре", "чиновник", "численности", "число", "чистой", "членами", "членов", "чтобы", "чувств", "чувства", "чувственного", "чувство", "чудеса", "чудотворения", "чужаками", "чужим", "чужой", "чёрная", "шаре", "школа", "штатах", "штатом", "штраф", "штрейкбрехеры", "эволюции", "эгалитарная", "эгоизм", "экзистенциализм", "экзит-полл", "экологии", "экологические", "экономика", "экономике", "экономики", "экономисты", "экономическая", "экономические", "экономический", "экономического", "экономической", "экспедитор", "экспедиция", "эксплуататорский", "эксплуатируемый", "экспорт", "экспорте", "экспрессивная", "экстраверт", "экстремизм", "эластичного", "электрификация", "элементарная", "элементов", "элита", "эмбарго", "эмиссии", "эмиссия", "энергией", "энергии", "энергичной", "этапов", "этика", "этике", "этнической", "этнос", "этноцентризм", "этот", "эффективность", "эффективный", "южных", "юридические", "юридических", "юридическое", "явления", "является", "являются", "ядро", "язык", "языковой", "ясный"]
   
    var teamToPlayRound:Int!
    var age:String = ""
    var teamInfo:[String] = []
    var teamPoints:[Int] = []
    var timeSettings:Int!
    var pointSettings:Int!
    var skipWordSettings:Bool!
    var wordsGuessed = 0
    var wordsSkipped = 0
    var roundPoints = 0
    

    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var wordToGuessLabel: UILabel!
    @IBOutlet weak var teamsScorePageButton: UIButton!
    @IBOutlet weak var wordSkipButton : UIButton!
    @IBOutlet weak var wordGuessedButton : UIButton!
    @IBOutlet weak var WordsSkippedLabel : UILabel!
    @IBOutlet weak var WordsGuesedLabel : UILabel!
    
    
    @IBAction func backToTeams(_ sender: Any) {
    }
    
    @IBAction func wordGuessed(_ sender: Any) {
       showWordToGuess()
        wordsGuessed += 1
        WordsGuesedLabel.text = String(wordsGuessed)
    }
    @IBAction func wordSkipped(_ sender: Any) {
        showWordToGuess()
        wordsSkipped += 1
        WordsSkippedLabel.text = String(wordsSkipped)
    }
    
    
    
//    var seconds = 10 //This variable will hold a starting value of seconds. It could be any amount above 0.
    var seconds = time //This variable will hold a starting value of seconds. It could be any amount above 0.
    var timer = Timer()
    var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if isTimerRunning == false {
            runTimer()
        }
    }
    
    @objc func updateTimer() {
        if  seconds < 1 {
             timer.invalidate()
            teamsScorePageButton.isHidden = false
            print("Total score")
            roundPoints = wordsGuessed - wordsSkipped
            wordSkipButton.isHidden = true
            wordGuessedButton.isHidden = true
            
            let alert = UIAlertController(title: "Раунд", message: "Раунд завершен", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                  switch action.style{
                  case .default:
                        print("default")

                  case .cancel:
                        print("cancel")

                  case .destructive:
                        print("destructive")


            }}))
            self.present(alert, animated: true, completion: nil)
            
            print(roundPoints)
            
             //Send alert to indicate "time's up!"
        } else {
             seconds -= 1
             timerLabel.text = timeString(time: TimeInterval(seconds))
        }
    }
    
    func runTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(self.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        usernameLabel?.text = String(teamToPlayRound)
        teamName.text = teamInfo[teamToPlayRound]
        if (!skipWordSettings){
            wordSkipButton.isHidden = true
        }
        
        showWordToGuess()
        if isTimerRunning == false {
            runTimer()
        }
    }
    
    func showWordToGuess () {
        let number = Int.random(in: 0 ..< wordsToGuess.count)
        let word = wordsToGuess[number]
        wordToGuessLabel.text = word.uppercased()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) // пересылаем данные из данного ViewController-а в следующий
       {
           if segue.destination is TeamResultsViewController
           { // передаем данные
               let vc = segue.destination as? TeamResultsViewController
            vc!.teamToPlayerRoundFromWordGuessController = Int((teamToPlayRound + 1) % teamNames.count)//передаем индекс команды, которая будет играть
            vc!.teamNames = teamNames
            vc!.teamPoints = roundPoints
            vc!.pointsToEndTheGame = pointSettings
            vc?.timeSettings = timeSettings
            vc!.pointSettings = pointSettings
            vc?.skipWordSettings = skipWordSettings // Bool пропуск слова
           }
       }
}
