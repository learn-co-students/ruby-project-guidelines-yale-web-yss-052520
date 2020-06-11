Welcome to ToDo.it
    created by: Enrique Valencia Yale '23
                Justin James Yale '21

We built a functional CRUD CLI to-do list app, with features somewhat specific to Yale students, but nothing that could not be modified to a wider audience.  The application relies heavily upon the Ruby active record gem, as well as its built-in functions and ability to migrate in data-tables.


There are six classes:

Task.rb
Team_to_do.rb
team_user.rb
Team.rb
To_do.rb
User.rb

The bulk of the application is operated from the run file, with support from an app/models folder, and several migrations from db/migrate.

The task table is composed of a name column(string), a category column(string), a due date (datetime), and an assigned date(datetime).  A To-Do is composed of a user_id, a task_id, a boolean of whether the To-Do is complete or not, and a priority level column specifying an integer from 1 - 5.  A user is composed of a name(string), a username(string), a password(string), a college(at Yale, we have residential colleges; string), and an age(integer).

The to-list includes the ability to log-in with a username and password, masking passwords, and double-entry surety upon password creation.  Once your password has been confirmed as a new or returning user, you will be led to the menu board.  

At the menu board, you can choose between:

View_priority_to_dos
	Leads to => priority to_dos
		Ability to select a To-Do or return to a menu is seen on this screen.  Once you select a To-Do (note: this process is the same for all to_dos marked incomplete), you will have the ability to edit that To-Do, in which case it will be deleted and you build a new To-Do, you can mark that To-Do complete, or you can deleted, after which you will be led to the other completed To-Dos for possible deletion as well (assuming you’re in the deleting spirit).  From that screen, which is described below, you will be able to return to the menu.

View_all_to_dos
	Leads to => all_to_dos
		Same functionality as priority to-dos, except To-Dos with all priority levels will be displayed.

New_to_do
	Leads to => allows you to choose between task categories for making a task that will lead to a To-Do, or make a new category.
		If you choose an existing category, you will have the opportunity to see task names within that category.  If there is a match, go ahead and select it.  At this point, you will have a chance to look at the due date, if that matches to, you’ll be led to instructions to finish making the to-do, where you’ll input a priority level for the to-do, and you’ll be all set.

	If you make a new category, you’ll give that new task a name, and a due date. Note: all assigned dates are automatically set to today’s date.  From there, you’ll be able to finish off making that To-Do with a priority level.

Old_to_dos
	Leads to => view_old_to_dos, Delete_old_to_dos
View_old_to_dos allows you to look at and select all to_dos that have been marked complete, and mark them incomplete, or delete them.  You will of course be prompted whether you want to mark a previously completed to-do as incomplete again, as all To-Do are automatically initialized to incomplete.  
For delete_old_to_dos, this is a catch-all function to delete all to_dos marked as complete.  It’s a reasonable observation to not see value in hanging on completed To-Dos.

-Teams-
Intro: Teams is a space in which a user can create to_dos that can be seen and interacted with by other teammates. The menu schematic for teams is as follows:

Teams
    My_teams
        Team1 (team you have joined or created)
            View_team_to_dos
                (here you can select a to_do that has been created for the team)
                (once claimed, the to_do populates in “view_claimed_to_dos)
            View_claimed_to_dos
                (shows claimed to_dos)
                (you can: mark_complete, or unclaim)
            Create_team_to_do
                (create to_do with name and due_date)
            back
        Team2 etc..
    Join_team
        (prompts to select from a list of created teams and asks for password to join)
    Create_team
        (prompts to create team with unique name, and password)
    back_to_menu

Conclusion: Once a to_do is created for the team you are currently in, all other users in that team can claim that to_do. Also, once a user claims and marks that to_do complete, other teammates will see the status of that particular to_do change to “complete” in their “view_team_to_dos” page.

Log_out
	Self-explanatory: it logs out the current user and sends them back to the welcome section.  

Install Instructions

In terms of install instructions, simply run ‘bundle install’ to install all necessary gems to run the application.
To run the app type 'ruby bin/run.rb'  


