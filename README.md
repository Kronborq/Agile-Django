# mt

For sharing of files for Myteam bachlor project

We want to educate ourselves on the habits of agile development, gaining experience with the different elements of the agile system development life cycle. Primarily focusing on how “spikes” are handled. Spikes are issues that must be dealt with, and they can come in many shapes, fx. a technology issue or a sub project. However it can be difficult to estimate the size of a spike, and a spike could in itself be the considerations on how to handle a difficult task.
We will work on implementing changes to an existing system using agile principles and thereby getting some experience-based knowledge on how spikes are best dealt with in an agile project. During this process we will also be educating ourselves in SQL, the Django framework and web development, which are the tools we will be using during the project. 
We assume that out of our tasks, the database migration will most likely be the biggest task, and thus will probably also be our biggest spike in development.
Although knowing exactly which tasks will becomes spikes, and the size of these is a dangerous assumption to make ahead of time.


## Setting up local test environment
#### Installing Python and packages
`sudo apt-get install python3`

`sudo apt-get install python3-pip`

`sudo apt-get install libpq-dev`<br><br>

#### Installing and setting up Postgresql
`sudo apt-get install postgresql-contrib`

`sudo apt-get install postgresql`<br><br>  



*Skift bruger til postgres*

`sudo passwd postgres`

`su - postgres`<br>

`createuser -P -s -e django` #vigtigt at password til denne bruger også er django

`createdb djangodb`<br><br>

#### Installing Django
`pip3 install Django` <br> <br>


#### If there is problems during your first installation, try the following
*naviger ind i django projekt mappen (mt/djangosite)*

`cd mt/djangosite`<br> <br>

*tøm migrations folderen (mt/djangosite/migrations), med undtagelse af \_\_pycache\_\_-folderen og \_\_init\_\_.py *

`python3 manage.py makemigrations djangoapp`

`python3 manage.py migrate --fake-initial`
