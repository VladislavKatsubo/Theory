//Builder - нужен, чтобы создавать объекты у которых сложная инициализация. У которых перед инициализацией нужно вызвать какие-то методы. Есть еще Director, который следит за выполнением Builder.

import UIKit

protocol ThemeProtocol {
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
}

protocol ThemeBuilderProtocol {
    func setBackgroundColor(color: UIColor)
    func setTextColor(color: UIColor)
    func createTheme() -> ThemeProtocol?
}

class Theme: ThemeProtocol {
    var backgroundColor: UIColor
    var textColor: UIColor
    
    init(backgroundColor: UIColor, textColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.textColor = textColor
    }
}

class ThemeBuilder: ThemeBuilderProtocol {
    var backgroundColor: UIColor?
    var textColor: UIColor?
    func setBackgroundColor(color: UIColor) {
        
    }
    func setTextColor(color: UIColor) {
        
    }
    func createTheme() -> ThemeProtocol? {
        guard let backgroundColor = backgroundColor, let textColor = textColor else { return nil}
        return Theme(backgroundColor: backgroundColor, textColor: textColor)
    }
}

