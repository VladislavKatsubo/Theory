// Адаптер Таргет Адаптии

//adaptee

class SimpleCar {
    func sound() -> String{
        return "Bee-beeep"
    }
}
//target
protocol SuperCarProtocol {
    func makeNoise() -> String
}

class Supercar: SuperCarProtocol {
    func makeNoise() -> String {
        "Vrrrrrr V12"
    }
}
//adapter
class SupercarAdapter: SuperCarProtocol {
    func makeNoise() -> String {
        return simpleCar.sound()
    }
    
    var simpleCar: SimpleCar
    
    init(simpleCar: SimpleCar) {
        self.simpleCar = simpleCar
    }
}
// Используется, чтобы получить функционал какого-то протокола для объекта, у которого его нет. Можно подписаться, а можно создать новый класс, который будет инициализироваться с помощью Адапти, будет подписан на целевой протокол и вызывать метод, который был необходим.
