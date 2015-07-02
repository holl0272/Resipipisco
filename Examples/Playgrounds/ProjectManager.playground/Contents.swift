import Foundation

/*
Projects
    title
    description
    deadline (date)
    priority (number)
    has one User (creator)
    has many Users (assignees)
    has many Tasks
Users
Tasks
    has one User (assignee)
*/

class User {
    var name: String
    
    var projectsCreated: [Project] = []
    var assignedProjects: [Project] = []
    var tasksAssigned: [Task] = []
    
    init(name: String) {
        self.name = name
    }
}

class Task {
    var title: String
    var priority: Int?
    
    var assignee: User?
    var project: Project?
    
    init(title:String) {
        self.title = title
    }
    
    func assignUser(user:User) {
        // Add this user to the assignee property.
        self.assignee = user
        
        // Add this task to the user's assigned tasks.
        user.tasksAssigned.append(self)
    }
}

class Project {
    var title: String
    var description: String?
    var priority: Int?
    
    var assignees: [User] = []
    var creator: User
    var tasks: [Task] = []
    
    init(title:String, creator:User) {
        self.title = title
        self.creator = creator
    }
    
    func assignUser(user:User) {
        // Add the user to the list of assignees in the project
        self.assignees.append(user)
        
        // Add the project to the list of projects for the user
        user.assignedProjects.append(self)
    }
    
    func createTask(title:String) -> Task {
        let task = Task(title: title)
        
        // Ensure the task "knows" to what project it's a part of.
        task.project = self
        // The project should add the task.
        self.tasks.append(task)
        
        return task
    }
}

let myself = User(name: "Toshi")
let final = Project(title: "My Final Project", creator: myself)

final.createTask("Wireframe the app")
final.createTask("Write my object spec")
final.createTask("Write the object model in Swift")

// Toshi assigns all the Tasks in the Project to himself
for task in final.tasks {
    task.assignUser(myself)
}

final.tasks.count
myself.tasksAssigned.count







