Resources
---------

* Ruby
  * Object Model
    * [Peter Cooper's lesson](https://www.youtube.com/watch?v=by5fFOBhtPQ) (very similar to what I teach my students) 
    * [My material](https://github.com/JoshCheek/ruby-object-model)
  * Load path / Namespacing / interpreting versions / general naming and file patterns.
    * [Gem patterns](http://guides.rubygems.org/patterns/) this is a really great read.
    * [Ruby Packaging Standard](http://chneukirchen.github.io/rps/) short and to the point about where different types of code go, how to name them.
      I don't think this is official, but it describes what the community is already doing.
    * [Semantic Versioning](http://semver.org/) describes how to interpret the numbers in a version,
      useful for getting a good high-level understanding of a gem or change at a glance (or communicating this information to users of your gems).
    * [Build a gem](http://guides.rubygems.org/make-your-own-gem/) applies the things from the above links, a good way to drive it home.
  * Feedback tools
    * [Pry](http://pryrepl.org/screencasts.html) can be used to get a REPL into a given environment, with powerful tools to jump between object contexts
      and display code without you having to go figure out where it is located.
    * [SeeingIsBelieving](https://github.com/JoshCheek/seeing_is_believing) is good for playing with specific ideas like "how does this thing work?",
      seeing intermediate values, and quickly iterating through a handful of different possibilities and changes.
    * `s_arb` is a snippet you can use from SeeingIsBelieving to get an `ActiveRecord::Base` environment, and then quickly change the migrations,
      the models, and play with the associations, queries, validations, and anything else ActiveRecord related.
* Tools
  * [iTerm2](http://iterm2.com/downloads.html)
  * In general, there's a list of tools I use frequently in my [debugging lecture notes](http://tutorials.jumpstartlab.com/topics/debugging/debugging.html#tools).
* For helping new devs on the team get up to speed
  * Learn the basics with Ruby Kickstart (my material, the RSpec files are out of date, but I'm ~70% through updating them): [Material](https://github.com/JoshCheek/ruby-kickstart) and [videos](https://vimeo.com/channels/844657)
  * [Eloquent Ruby](http://www.amazon.com/Eloquent-Ruby-Addison-Wesley-Professional/dp/0321584104) -- recommended by Jeff
* Software tools to get approved
  * Gems are fine
  * Phantom (note that there is a packaging of this as a gem)
  * Private Travis CI (b/c it's ultra-simple to work with, we don't need a Jenkins expert, don't need to host)