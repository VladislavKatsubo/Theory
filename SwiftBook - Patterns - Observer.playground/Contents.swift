import Foundation

protocol Subject {
    func add(observer: PropertyObserver)
    func remove(observer: PropertyObserver)
    func notify(with string: String)
}

class Teacher: Subject {
    var observerCollection = NSMutableSet()
    var homeTask = "" {
        didSet {
            notify(with: homeTask)
        }
    }
    func add(observer: PropertyObserver) {
        observerCollection.add(observer)
    }
    
    func remove(observer: PropertyObserver) {
        observerCollection.remove(observer)
    }
    
    func notify(with string: String) {
        for obs in observerCollection {
            (obs as! PropertyObserver).didGetNewTask(newTask: string)
        }
    }
    
}

protocol PropertyObserver {
    func didGetNewTask(newTask task: String)
}

class Pupil: NSObject, PropertyObserver {
    
    var homeTask = ""
    func didGetNewTask(newTask task: String) {
        homeTask = task
        print("new homework to be done\n",homeTask)
    }
}


let pupil = Pupil()
let teacher = Teacher()
teacher.add(observer: pupil)
teacher.homeTask = "Выучить все паттерны"

// Паттерн наблюдатель полезен тем, что позволяет передавать данные или выполнять какие-либо действия от одного объекта ко многим. Чтобы получать обновления нужно быть подписанным на протокол, который используется как делегат у родительского паттерна. UserDefaults наверное Observer. NotificationCenter - observer.
