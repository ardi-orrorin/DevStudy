

actor BuildMessage {
    var message: String = ""
    let greeting  = "Hello"
    
    func setName(name: String) {
        self.message = "\(greeting) \(name)"
    }
    // 비격리 처리 nonisolated
    nonisolated func getGreeting() -> String {
        return self.greeting
    }
}
