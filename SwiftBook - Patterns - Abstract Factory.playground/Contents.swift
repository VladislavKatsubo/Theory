//Еще более детальное разбиение на фабрики.

protocol Car {
    func drive()
}

class LittleSizeCar: Car {
    func drive() {
        print("Drive little car")
    }
}

class MiddleSizeCar: Car {
    func drive() {
        print("Drive middle car")
    }
}

protocol Bus {
    func drive()
}

class LittleSizeBus: Bus {
    func drive() {
        print("Drive little bus")
    }
}

class MiddleSizeBus: Bus {
    func drive() {
        print("Drive middle bus")
    }
}

protocol Factory {
    func produceBus() -> Bus
    func produceCar() -> Car
}

class LittleSizeFactory: Factory {
    func produceBus() -> Bus {
        print("Little size bus created")
        return LittleSizeBus()
    }
    func produceCar() -> Car {
        print("Little size car created")
        return LittleSizeCar()
    }
}

class MiddleSizeFactory: Factory {
    func produceBus() -> Bus {
        print("Middle size bus created")
        return MiddleSizeBus()
    }
    func produceCar() -> Car {
        print("Middle size car created")
        return MiddleSizeCar()
    }
}

let littleFactory = LittleSizeFactory()
littleFactory.produceBus()
//Используется при создании общих настроек интерфейса? Настройки создаются в фабрике..
