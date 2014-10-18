# SimpleConway
## Dependency
Ruby ~> 2.0.0
Bundler ~> 1.7.0

## Project setup
Given you have compatible version of Ruby and Bundler, run
```
bundle install
```
To install all dependencies

## Remote test
A light weight web service is up on Heroku, you can try curl:
```
curl -H 'Accept: application/json' -X POST -d "M=5&N=5&liveCells=[[2,1],[2,2],[2,3]]" http://simple-conway.herokuapp.com/next_generation
```

## Local test
Inside the project directory, run
```
ruby app.rb
```
After server has started, you can try the following simple curl to get
next generation, for example:
```
curl -H 'Accept: application/json' -X POST -d "M=5&N=5&liveCells=[[2,1],[2,2],[2,3]]" http://localhost:4567/next_generation
```

## Run specs
Inside the project directory, run
```
rspec spec
```




