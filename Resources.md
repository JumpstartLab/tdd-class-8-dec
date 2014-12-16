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
  * Learning Ruby
    * Learn the basics with Ruby Kickstart (my material, the RSpec files are out of date, but I'm ~70% through updating them): [Material](https://github.com/JoshCheek/ruby-kickstart) and [videos](https://vimeo.com/channels/844657)
    * [Eloquent Ruby](http://www.amazon.com/Eloquent-Ruby-Addison-Wesley-Professional/dp/0321584104) -- recommended by Jeff
* Gems
  * [RSpec](https://www.relishapp.com/rspec/) - Testing library
  * [Faker](https://github.com/stympy/faker) - Generate fake data (names, addresses, phone numbers, etc)
  * [FactoryGirl](https://github.com/thoughtbot/factory_girl/wiki) - Easily build resources
  * Presenters
    * [Talk by Jeff](http://confreaks.com/videos/2526-lsrc2011-blow-up-your-views) this isn't exactly the one I learned from, it's a slight variant he calls a "decorator". It addresses the same problem in a similar way, but it's an object which wraps another object and adds functionality, where presenters use composition instead. I like the "view-model" name, if people at your work are resistant "why do I need more objects?" maybe use this name, then it's like "it's not new, it's just a model... to help the view"
    * [Talk by Justin Gordon at RailsConf](https://www.youtube.com/watch?v=bHpVdOzrvkE) Start at 13:10, ignore all advocation of concerns (just delete them), disregard anything DHH says about design (think about how coupled Rails is), he mentions polymorphism to remove if statements... if you have the same if statement over and over, then you probably have two objects (Ben Orenstein has a great talk)
      * 13:10 he discusses Draper (Jeff's draper gem)
      * 15:35 he discusses Presenters
      * 18:50 Service Objects. If you nee to share code, move the shared code into its own object and call it from the two consumers. Also, he talks about validations. If your validations require knowledge about the context in which they are being validated, just accept that they can't ever be right, and trying to have them do this will lead to a lot of pain. I spent days trying to work with the "Rails way" on this one, it's not worth it. Just make an object, init it with the model and any context it needs, and have it set errors onto the model. Took like an hour to write what I needed. Code was a bit longer, but w/e, it was explicit, easy to write, easy to read, sufficiently easy to test, and dramatically easier to get correct (if any of this got difficult, I'd probably have it return the errors rather than setting them, and caller would do the setting)
  * [Capybara](https://github.com/jnicklas/capybara) - Interface to traverse web pages and assert about content, structure, etc.
* Tools
  * [iTerm2](http://iterm2.com/downloads.html)
  * [ag](https://github.com/ggreer/the_silver_searcher) -- search lots of files fast (with regexes)
  * In general, there's a list of tools I use frequently in my [debugging lecture notes](http://tutorials.jumpstartlab.com/topics/debugging/debugging.html#tools).
  * [2dir](https://github.com/JoshCheek/dotfiles/blob/eace0511ebe1351e7d6fca900eec7cfa6b884ed3/bash_profile#L70-89) take me to the directory printed by the last command.
  * [Phantom](http://phantomjs.org/) Headless (doesn't pop up a GUI) web browser that Capybara can use to navigate our site. Because it's a real browser, it runs JavaScript.
* Performance
  * [How to Optimize](http://tutorials.jumpstartlab.com/topics/performance/queries.html)
  * [Finding places to optimize](http://tutorials.jumpstartlab.com/topics/performance/measuring.html)
  * [https://github.com/flyerhzm/bullet](bullet) identify N+1 queries
* Other
  * [Working Effectively with Legacy Code](http://www.amazon.com/Working-Effectively-Legacy-Michael-Feathers/dp/0131177052)
  * [My bash_profile](https://github.com/JoshCheek/dotfiles/blob/master/bash_profile) Prompt info is towards the bottom.
  * [Encryption and such](https://www.youtube.com/watch?v=vgTtHV04xRI)
  * [Git Immersion](http://gitimmersion.com/) my favourite git tutorial
  * [Git Flowchart](http://justinhileman.info/article/git-pretty/full/) What to do in different situations in git
