# require_all 'app/models'

User.destroy_all
Task.destroy_all
ToDo.destroy_all

enrique = User.create(name: "Enrique Valencia", college: "Trumbull", age: 19)
justin = User.create(name: "Justin James", college: "Davenport", age: 21)

# we could think about raising an error if assigned date is after due date
 task_1 = Task.create(name: "Math_p_set_11", category: "Math", due_date: Date.new(2020,6,19), assigned_date: Date.new(2020,6,8))
 task_2 = Task.create(name: "Econ_p_set_11", category: "Economics", due_date: Date.new(2020,6,17), assigned_date: Date.new(2020,6,1))
 task_3 = Task.create(name: "Presentation_prep", category: "French", due_date: Date.new(2020,6,10), assigned_date: Date.new(2020,6,5))
 task_4 = Task.create(name: "Work_on_thesis", category: "EP&E", due_date: Date.new(2020,6,9), assigned_date: Date.new(2020,6,3))

to_do1 = ToDo.create(user_id: enrique.id, task_id: task_1.id, complete?: false, priority_level: 3)
to_do2 = ToDo.create(user_id: justin.id, task_id: task_2.id, complete?: true, priority_level: 5)
to_do3 = ToDo.create(user_id: justin.id, task_id: task_3.id, complete?: false, priority_level: 4)
to_do4 = ToDo.create(user_id: justin.id, task_id: task_4.id, complete?: false,  priority_level: 2)