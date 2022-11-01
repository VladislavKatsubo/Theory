
// Помогает изменять инстансы класса более просто. Создается объект, который отвечает за инициализацию класса. Если нужно внести изменения в инициализатор - то менять нужно будет только в одном месте - в фабрике.

protocol Car {
    func drive()
}

enum CarType {
    case huge, fast
}

class HugeCar: Car {
    func drive() {
        print("Driving a CyberTrack")
    }
}

class FastCar: Car {
    func drive() {
        print("Driving an AMG One")
    }
}

let hugeCar = HugeCar()
hugeCar.drive()

let fastCar = FastCar()
fastCar.drive()


class CarFactory {
    
    static func produceCar(type: CarType) -> Car {
        var car: Car
        
        switch type {
        case .fast:
            car = FastCar()
        case .huge:
            car = HugeCar()
        }
        return car
    }
    
}
