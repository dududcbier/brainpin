# README
  
BrainPin is an application built for middle school students, where they can find questions and quality material to help them study.

### Dependencies
  
* Ruby 2.5.1
* Rails 5.2
* Docker Compose
  
### Running BrainPin
  
To run BrainPin, simply run the following command on the brainpin directory:
  
```bash
$ docker-compose up
$ docker-compose run web rake db:create
$ docker-compose run web rake db:migrate
$ docker-compose run web rake db:seed
```

You can then access localhost:3000 on your browser to run our example database queries.
