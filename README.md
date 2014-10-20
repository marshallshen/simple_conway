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

## Light weight testing
A simple JSONP integration can be found in the following [example](example/test_conway.html).
You can view and test it via web browser

## Run specs
Inside the project directory, run
```
rspec spec
```
Note that default option excludes [performance test of API](spec/api_spec.rb#L28-L33) and [performance test of algorithm](spec/simple_conway_spec.rb#L27-L36), to run performance test:
```
rspec --tag performance spec
```

