

User.destroy_all
Task.destroy_all
ToDo.destroy_all
enrique = User.create(name: "Enrique Valencia", college: "Trumbull", age: 19)
justin = User.create(name: "Justin James", college: "Davenport", age: 21)


task_1 = Task.create(name: "Math_p_set_11", type: "Math", due_date: Date.new(2020,6,19), assigned_date: Date.new(2020,6,8))

to_do1= ToDo.create(user_id: enrique.id, task_id: task_1.id, complete?: false, priority_level: 3)