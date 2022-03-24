# heimdall

ML Based Business Intelligence and Maintenance Platform.
- built with Django
- handles ETL processes, APIs, and DB
  
## Setup


> ### DB Setup
- Install Postgres
- Create database `heimdall`
```
create database heimdall
```

- Update local environment variables with new DB
```
DATABASE_URL=postgres://username:password@localhost:5432/heimdall
```


> ### virtual env set up

- create virtual env with python 3.8
```
mkvirtualenv heimdall --python=`which python3.8`
```

- install requirements
```
pip install -r requirements/local.txt
```

- copy binary file
```
cp manage.py <virtual_env_path/bin>
```

- create symlink with binary file
```
sudo ln -fs manage.py heimdall
```


> ### Dev server and Local 
Here  we use a custom binary file `heimdall` to run commands instead of `python manage.py`

- to use the local `.env` file, add the below line in the `postactivate` file in `env_name/bin` or simply do an export in the shell before ``runserver``

```
DJANGO_READ_DOT_ENV_FILE=True
```

- to spin development server
```
heimdall runserver
```

- start shell
```
heimdall shell
```


- to create migrations and migate DB
```
heimdall makemigrations

heimdall migrate
```

- create superuser
```
heimdall createsuperuser
```



