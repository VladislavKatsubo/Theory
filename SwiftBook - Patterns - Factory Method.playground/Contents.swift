//Разница с Простой Фабрикой в том, что под каждый класс должна быть отдельная фабрика

//написали проток для ТС
protocol Vehicle {
    func drive()
}

//
class Car: Vehicle {
    func drive() {
        print("Drive a car")
    }
}

class Truck: Vehicle {
    func drive() {
        print("Drive a truck")
    }
}

class Bus: Vehicle {
    func drive() {
        print("Drive a bus")
    }
}
// Cоздаем ТС. Классы реализовываются по протоколу Vehicle
protocol VehicleFactory {
    func produce() -> Vehicle
}

class CarFactory: VehicleFactory {
    func produce() -> Vehicle {
        print("Car was produces")
        return Car()
    }
}

class TruckFactory: VehicleFactory {
    func produce() -> Vehicle {
        print("Truck was produces")
        return Truck()
    }
}

class BusFactory: VehicleFactory {
    func produce() -> Vehicle {
        print("Bus was produces")
        return Bus()
    }
}
//Все ТС соответствуют Vehicle и создаются отдельными фабриками.
let busFactory = BusFactory()
let busMan = busFactory.produce()

let truckFactory = TruckFactory()
let truck = truckFactory.produce()
