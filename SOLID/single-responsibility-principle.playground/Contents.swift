import Foundation

class Journal: CustomStringConvertible
{
    var entries = [String]()
    var count = 0
    
    func addEntry(_ text: String) -> Int {
        count += 1
        entries.append("\(count): \(text)")
        return count - 1
    }
    
    func removeEntry(_ index: Int) {
        entries.remove(at: index)
    }
    
    var description: String {
        return entries.joined(separator: "\n")
    }
    
    func save(_ filename:String, _ overwrite: Bool = false) {
        //save to file
    }
    
    //These methods are a violation of the Single Responsibility Principle
    //A class should only have a single reason to change
    func save(_ filename: String, overwrite: Bool = false) {
       //save to file
    }
    func load(_ filename: String) {}
    func load(_ url: URL) {}
}

//Created a new class that is responsible for Persistence of Journal Objects
//It's not the Journal classes responsibility to save Journal
class Persistence {
    func saveToFile(_ journal: Journal, _ filename: String, _ overwrite: Bool = false) {
        //Perform persistence here
    }
}

func main() {
    let j = Journal()
    let _ = j.addEntry("I cried today")
    let bug = j.addEntry("I ate a bug")
    print(j)
    
    //Instead of doing something along the lines of j.save() which doesn't adhere to the SRP
    //Let's try the following...
    let p = Persistence()
    let filename = "/mnt/c/fsfhdls"
    p.saveToFile(j, filename, false)
    
    j.removeEntry(bug)
    print("===")
    print(j)
}

main()
