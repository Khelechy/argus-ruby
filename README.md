# ARGUS Ruby Client 

This is the official Ruby library for the [ARGUS Engine](https://github.com/Khelechy/argus), this library helps Ruby developers and applications seamlessly integrate to the ARGUS Engine, authentication and event listening.

### Install via Gem

```sh
    gem install argus-ruby
```

### Usage -

```ruby

   require 'argus'
```

Have a class to define the fucntion to be called when you receive an Argus Event

```ruby
    class Testsub
        def on_event(argus_event)
            puts "#{argus_event.Action}"
            puts "#{argus_event.ActionDescription}"
            puts "#{argus_event.Name}"
            puts "#{argus_event.Timestamp}"
        end
    end
```

Finally use argus like so,

```ruby
    subscriber = Testsub.new

    argus = Argus.new("testuser", "testpassword") # Optionally you can pass the host and port, and auth credentials inclusive.

    argus.subscribe(subscriber, :on_event)
    argus.connect
```
