# Reading List

Reading List is a Ruby CLI app for organizing reading lists.

## Installation

Run [bin/run.rb](bin/run.rb) to install.

```bash
ruby bin/run.rb
```

## Usage

When you install, the main menu provides an option to create a new list or view all existing lists.

```zsh
Hi! Welcome to your reading lists!
----------------------------------------------------------------------------------------------------
Main Menu (Use ↑/↓ arrow keys, press Enter to select)
‣ View Lists
  Create New List
  Exit Program
```
Use ↑/↓ arrow keys, press Enter to select to take a look inside an individual list.

```zsh
My Lists
----------------------------------------------------------------------------------------------------
Select list: 
  2020 Reading List
‣ Arthur's June Reading List
  Recommended By Friends
```

Inside a list, you have an option to sort, add/view/edit books, and delete list.
```zsh
+-------------------------------+---------------+------+-------+-------+
|                      Arthur's June Reading List                      |
|                             read for fun                             |
+-------------------------------+---------------+------+-------+-------+
| Title                         | Author        | Year | Genre | Read? |
+-------------------------------+---------------+------+-------+-------+
| Unbearable Lightness of Being | Milan Kundera |      |       | false |
| How To Do Nothing             | Jenny Odell   |      |       | true  |
+-------------------------------+---------------+------+-------+-------+
What do you want to do? (Use ↑/↓ arrow keys, press Enter to select)
‣ Sort list
  Add a new book
  View/edit a book record
  Back to my lists
  Delete this list
  Back to main menu
```
You can sort by Title, Author, Year, Genre, Read/Unread.

```zsh
+-------------------------------+---------------+------+-------+-------+
|                      Arthur's June Reading List                      |
|                             read for fun                             |
+-------------------------------+---------------+------+-------+-------+
| Title                         | Author        | Year | Genre | Read? |
+-------------------------------+---------------+------+-------+-------+
| Unbearable Lightness of Being | Milan Kundera |      |       | false |
| How To Do Nothing             | Jenny Odell   |      |       | true  |
+-------------------------------+---------------+------+-------+-------+
What do you want to do? Sort list
Sort by: (Use ↑/↓ arrow keys, press Enter to select)
‣ Title
  Author
  Year
  Genre
  Read/Unread
```

The View/Edit Book page shows a simple Google Books search of the title.

```zsh
View/Edit Book
----------------------------------------------------------------------------------------------------
+-------------------+-------------+------+-------+-------+-------+------+
| Title             | Author      | Year | Genre | Read? | Notes | Link |
+-------------------+-------------+------+-------+-------+-------+------+
| How To Do Nothing | Jenny Odell |      |       | true  |       |      |
+-------------------+-------------+------+-------+-------+-------+------+
Google Books Search
----------------------------------------------------------------------------------------------------
Title: How To Do Nothing
Author: Jenny Odell
Publish date: 2019
Page Count: 256
Publisher: 
Genre: ART
----------------------------------------------------------------------------------------------------
Options (Use ↑/↓ and ←/→ arrow keys, press Enter to select)
‣ Title
  Author
  Year
  Genre
  Notes
  Link
```


## Contributing
Contributors are welcome. For suggestions, please open an issue first to discuss what you would like to add/change.


## License
[LICENSE.md](/LICENSE.md)