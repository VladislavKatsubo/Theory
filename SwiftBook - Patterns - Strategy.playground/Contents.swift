
protocol SwimBehaviour {
    func swim()
}

class ProfessionalSwimmer: SwimBehaviour {
    func swim() {
        print("professional swimmer")
    }
}

class NonSwimming: SwimBehaviour {
    func swim() {
        print("Non swimming")
    }
}

protocol DiveBehaviour {
    func dive()
}

class ProfessionalDiver: DiveBehaviour {
    func dive() {
        print("Professional Diver")
    }
}

class NewbieDiver: DiveBehaviour {
    func dive() {
        print("Newbie Diver")
    }
}

class NonDiving: DiveBehaviour {
    func dive() {
        print("Non Diver")
    }
}

class Human {
    
    private var diveBehaviour: DiveBehaviour!
    private var swimBehaviour: SwimBehaviour!
    
    func performSwim() {
        swimBehaviour.swim()
    }
    
    func performDive() {
        diveBehaviour.dive()
    }

    func setSwimBehaviour(sb: SwimBehaviour) {
        self.swimBehaviour = sb
    }

    func diveBehaviour(db: DiveBehaviour) {
        self.diveBehaviour = db
    }
    
    func run() {}
    
    init(swimBehaviour: SwimBehaviour, diveBehaviour: DiveBehaviour) {
        self.swimBehaviour = swimBehaviour
        self.diveBehaviour = diveBehaviour
    }
}

let human = Human(swimBehaviour: ProfessionalSwimmer(), diveBehaviour: ProfessionalDiver())
human.performSwim()
human.performDive()


//Паттерн Стратег позволяет не создавать много разных классов для перезаписывания методов родительского класса, а создать протоколы в данном случае SwimBehaviour и DiveBehaviour, которые будут описывать все возможные ситуации реализаций методов родительского класса. А новые классы создавать уже с методами протокольных классов, которые делают то, что нужно в конкретном экземпляре класса. То есть методы класса Human будут динамически выполнять разные задачи.
// Мы можем не плодить подклассы, а определять поведение с помощью свойств DiveBehaviour! и SwimBehaviour! под свои нужды.
