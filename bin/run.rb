require_relative '../config/environment'

enrique = User.new(name: "Enrique Valencia", college: "Trumbull", age: 19)
justin = User.new(name: "Justin James", college: "Davenport", age: 21)

date2= Date.new(2020,6,8)
task_1 = Task.new(name: "Math_p_set_11", type: "Math", due_date: Date.new(2020,6,19), assigned_date: date2)

to_do1= ToDo.new(user_id: enrique.id, task_id: task_1.id, complete?: false, priority_level: 3)



puts "HELLO WORLD"
