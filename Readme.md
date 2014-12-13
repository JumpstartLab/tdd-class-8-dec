TDD 8 Dec 2014
==============

With [Josh Cheek](github.com/JoshCheek/).

Monday
------

### Morning

* Get settled in, make sure everything is installed and working (Ruby, Rails, RSpec, SeeingIsBelieving, internet)
* Figure out what we need to accomplish for the class to be a success
* Really get to know Ruby by exploring the [Object Model](https://github.com/JumpstartLab/tdd-class-8-dec/blob/master/8-dec-object-model.rb)

### Afternoon

* Finish Object Model
* Intro to [RSpec](https://github.com/JumpstartLab/tdd-class-8-dec/tree/master/8-dec-playing-with-rspec)



Tuesday
-------

### Morning

* Process discussion
  * [Discussion](http://tutorials.jumpstartlab.com/topics/testing/testing_fundamentals.html)
  * Also discuss test scope: Integration vs Unit
  * Also mention BDD: Acceptance testing (we'll use this in Event Reporter)
  * My TDD Process
    1. Identifies test pain - this is why it is called TDD, even though it's the tip of the iceberg
      * bad dependencies
        * slow tests e.g. inclusion of expensive dependency at too low of a level (file/database access, API calls)
        * difficult / approaching impossible to set up due to assumptions and dependency cycles (e.g. AR callbacks)
        * nondeterministic failures (time, randomness, external state)
      * bad tests
        * testing the same thing in multiple places b/c (too high level) (break it out into its own unit, unit test the shit out of it, have 1 integration test for each place)
        * tests break when refactoring (too low level)
      * other identifiers:
        low cohesion (ie 10 methods, 5 deal with A, 5 deal with B. You see this on Rails models a lot. it implies there are 2 objects/functions that should be extracted out of this model)
    2. Identify what is causing the pain
      * Almost always problematic dependencies
      * draw diagrams if you need to
      * look for things you don't control (3rd parties)
      * difficult integrations (external services)
      * volatile knowledge (file formats, locations of services)
    3. remove pain
      * This almost always means "find a way to push the problem up the callstack"
      * There are patterns to accomplish this, once you've identified the problem
* Discuss how testing and process can be used problems that they actually experience (complex search form / query building / permissions) [results are here](https://github.com/JumpstartLab/tdd-class-8-dec/blob/master/9-dec-search-organization.rb)

### Afternoon

* Questions
  * figure out what profiling stuff we can use
    * http://tutorials.jumpstartlab.com/topics/performance/queries.html   | how to optimize
    * http://tutorials.jumpstartlab.com/topics/performance/measuring.html | finding places to optimize
    * https://github.com/flyerhzm/bullet                                  | bullet - identify N+1 queries
  * These are all fine, as long as they are packaged as a gem. Phantom has a gem to package it!
  * figure out how significant it is to bring in Phantom
  * Can we get a "whitewashed" test from the word document? (then can try turning that into a spec)
  * Why did they want to learn mocking? (Third party APIs)
* Go make sure we hit everything we wanted for simple RSpec
* `s_arb` (might need to have language set to Ruby) Seeing is Believing snippet
* [Simplecov](http://tutorials.jumpstartlab.com/topics/internal_testing/code_coverage.html)
* More RSpec
* Complex search form
  * Explore the [domain from this morning](https://github.com/JumpstartLab/tdd-class-8-dec/blob/master/9-dec-search-organization.rb) by making up our own project based on it.
  * Purpose: Bring RSpec into a Rails environment
  * Try applying these ideas to a real-world situation.
  * Begin planning
    * Define set of criteria, identify most important ones.
    * BDD High-level thought ([acceptance tests with Capybara and Phantom](http://tutorials.jumpstartlab.com/topics/capybara/capybara_and_phantom.html))
    * New Rails App on 3.2.x



Wednesday
---------

### Morning

I'll have a doctor's appointment, so Jorge will work with you this morning.

Pick up where we left off on defining manage-my-inventory.com

* Setup
  * Add [RSpec for Rails](https://github.com/rspec/rspec-rails)
  * Add [SimpleCov](https://github.com/colszowka/simplecov/)
  * Move [the schema](https://github.com/JumpstartLab/tdd-class-8-dec/blob/master/9-dec-manage_my_inventory_dot_com/model_sandbox.rb) into a migration
  * Move each model into its own file
* Implementing the test
  * Turn the language in the acceptance tests into feature tests
    (integration level, this is where your big wins come in on your app, the code coverage number should jump significantly with a small number of these)
  * We can implementing them using the [Capybara API](https://github.com/jnicklas/capybara#using-capybara-with-rspec)
  * Use that to get a "tracer bullet" of functionality through the app
  * Write the feature test with [Capybara + Phantom](http://tutorials.jumpstartlab.com/topics/capybara/capybara_and_phantom.html)
* Begin implementing the code to make that test pass
  * Routes / controllers, querying the model, rendering the view
* Add more requirements
  * See where this leads to testing low-level things via high-level tests.
    Instead, we want to extract these into objects.
    It might wind up following
    [the discussion we had yesterday morning](https://github.com/JumpstartLab/tdd-class-8-dec/blob/master/9-dec-search-organization.rb)
  * Analyze where to extract that into an object
  * Do the extraction (We can put these into a dir in app, e.g. app/interactors or app/use_cases or whatever you want, really -- Rails will pick it up just because it's in that directory)
  * Add tests that focus more on this module of code, and drive the behaviour from these tests.
  * Once we have it working, go try it out in the browser and see it work to make the accomplishment concrete!

### Afternoon

* I found a way to [identify all invocations of the legacy route](https://github.com/JumpstartLab/tdd-class-8-dec/blob/c7966100424bb179064ac05ab395c2f1c0d3e9f7/9-dec-manage_my_inventory_dot_com/config/routes.rb#L57-60), we can take a look at that.
* Coverage in gitignore
* Legacy Code thing
* Turn our feature into a test
* Continuing with the information from yesterday
* Put on one of your repos so you can push back and forth
* We're looking at:
  * How to use Capybara to traverse traverse our site for our specs
  * How the high-level test covers a wide breadth of components, but without much depth
  * How that gives us the confidence that everything still works,
    but is ill-suited for focused tests on individual components.
  * How we can then extract objects out of this high-level workflow as they become apparent,
    and then use more focused unit tests on those objects to make sure we believe they work correctly.
  * That the tests allow us to do refactorings without worrying that we broke the code.
  * That when tests become difficult, we find the problematic dependency and find a way to push it back up to the caller (which is probably the controller in this case)


Thursday
--------

### Morning

* Continuing with yesterday's work
* Extract the `login_as` helper into a module, and include it in the RSpec configuration
* Fix the tests that authentication broke using an RSpec `before` filter
* Finish current story

### Afternoon

* To Add
  * Phantom
  * Add CI
* Get into the workflow
  * Move to one of your repos
  * Pick two new features to work on, I'll pair with you.
  * We'll discuss the day-to-day changes to your routine
  * Work on each of these independently
  * Work independently and try this stuff - I can also pair for periods at a time
* Refactorings
  * Extract Search into its own resource
  * extract the presenter (pick a name together)
  * extract helper methods
  * extract support code from spec helper


Friday
------

### Morning

* Integrate permissions
* Watch CI
* Faker - How I learn about a library I don't know
  * SeeingIsBelieving
    * I usually find docs by going to `rubygems.org/gems/<gemname>` and clicking the link to "Homepage" or "Source Code"
    * But lets do something more discoverable, lets explore with SiB
    * Does faker have class level methods? `Faker.methods(false)`
    * Should we instantiate it, then? `Faker.class`
    * So it must be a namespace. What does it contain, then? `Faker.constants`
    * Interesting, what can we do with them? `Faker::Name.instance_methods(false)`
    * Hmmm, must be a namespace for methods, then `Faker::Name.methods(false)`
    * Sweet, lets try calling one: `Faker::Name.first_name`
    * What about Date? `Faker::Date.methods(false)`
    * Between sounds cool, but probably needs some arguments, what are they? `Faker::Date.method(:between).parameters`
    * What does that `:req` mean? `lambda { |a, b=1, *c, d, e:, f:1, **g, &h| }.parameters`
    * Interesting, so it means "required"
    * Does it include the boundaries? `100.times.map { Faker::Date.between(Date.today-1, Date.today+1) }.uniq.sort.map { |d| d.strftime '%Y-%m-%d' }`
    * Lets find all the things we could do with it: `Faker.constants.each { |name| printf "%-15s - %p\n", name, Faker.const_get(name).methods(false) }`
    * Try a few out :)
  * Pry
    * How about jumping into pry and looking at some of these methods? `show-source Faker::Name.name`
    * Huh, what's it delegating to? `show-source Faker::Name.parse`
    * *sigh* metaprogramming. Lets take a moment to notice how hard this makes it to understand what's going on.
    * Not sure where to look next, maybe `translte` since it's first.
      * Notice how annoying it is to sit outside the object, we'd have to type `show-source Faker::Name.translate`
      * Lets get closer, we can change our context (`self`) using cd: `cd Faker::Name`
      * Amusingly, the object pry shows us as being in is a person's name, not the class, and it changes every line.
      * Any idea why? :)
    * It's looking at a locale (internationalization), lets see what it is `Faker::Config.locale`
    * So now, we have `I18n.translate(*(args.push(opts)))`
      * I can trace that back up and figure out what the args are, but that's a skill that takes a while to develop, what can we do in the meantime?
      * How about adding a pry in that method? If we edit it with the `-p` flag, it won't persist to the file system, and will only affect the running pry
      * edit -p translate

        ```ruby
        def translate(*args)
          opts = args.last.is_a?(Hash) ? args.pop : {}
          opts[:locale] ||= Faker::Config.locale
          opts[:raise] = true
          binding.pry # <------------------------- we add this
          I18n.translate(*(args.push(opts)))
        rescue I18n::MissingTranslationData
          # Super-simple fallback -- fallback to en if the
          # translation was missing.  If the translation isn't
          # in en either, then it will raise again.
          I18n.translate(*(args.push(opts.merge(:locale => :en))))
        end
        ```
      * Verify with `show-source translate`
      * Hmm, it's going crazy on us... oh yeah, remember that "name" thing? We'll just ignore it for now.
      * Lets call a few methods to see what args we get
        * `name`, `args`
        * `first_name`, `args`
      * I18n.translate('faker.name.first_name', locale: :en, raise: true)
      * A big list of first names.
      * Oh, we lost our spot, lets see it again `whereami`
      * Now, we probably know from Rails that I18n pulls from a YAML file, lets get out of here and go take a look at it
      * `exit!` This uses `Kernel#exit!`, which will quit the entire process without invoking callbacks. Convenient for "just get me out of here"
    * Locating the source
      * Where might that code be? In the Faker gem, probably, but where is that?
      * `gem which faker` note the file (Also note that in a Bundler project, the one that Rubygems tells you might not match the one you load, in that case you can do `bundle exec gem which faker`)
      * Lets go there, you can copy/paste the dir, or do something like `cd "$(gem which faker | xargs dirname)"` (I use this concept so often I made it a script https://github.com/JoshCheek/dotfiles/blob/eace0511ebe1351e7d6fca900eec7cfa6b884ed3/bash_profile#L70-89)
      * `ls -l` Ahh, there's a locales dir, sounds like internationalization
      * `ls -l locales` Interesting, they have English, but also specific overrides by things like state.
      * lets check out the locales `cat locales/en.yml` erm... a bit much, lets parse it `ruby -r yaml -r pp -e 'pp YAML.load(File.read "locales/en.yml")'`
      * Still a bit much. What keys do we have? `pp YAML.load(File.read "locales/en.yml")["en"].keys`
      * Oh, a "faker" key, that sounds a lot like what we gave to `I18n` earlier: `faker.name.first_name`
        
        ```sh
        $ ruby -r yaml -r pp -e 'pp YAML.load(File.read "locales/en.yml").keys'
        $ ruby -r yaml -r pp -e 'pp YAML.load(File.read "locales/en.yml")["en"].keys'
        $ ruby -r yaml -r pp -e 'pp YAML.load(File.read "locales/en.yml")["en"]["faker"].keys'
        $ ruby -r yaml -r pp -e 'pp YAML.load(File.read "locales/en.yml")["en"]["faker"]["name"].keys'
        $ ruby -r yaml -r pp -e 'pp YAML.load(File.read "locales/en.yml")["en"]["faker"]["name"]["first_name"].keys
        # whoops, that's an array
        $ ruby -r yaml -r pp -e 'pp YAML.load(File.read "locales/en.yml")["en"]["faker"]["name"]["first_name"].take(5)'
        ```
      * Cool, so now we see where the data is, how it gets populated, and since it uses `I18n`,
        there's a pretty decent chance that we can override it from our Rails app's `config/locales/en.yml`
        (I haven't tried this, it just seems likely)
* Continue with work on the different pieces and exploring 
* One more feature
  * Specific tests on the presenter
  * How about one that uses the Permissions in the presenter?
* Q: More focused discussion of mocking and stubbing this afternoon?
  * Mocking/stubbing
  * Performance
  * manage_my_inventory.com

### Afternoon

* RSpec Mocks
* Recap
  * RSpec
  * Object Model
  * Discussion of TDD, its strengths and weaknesses, the forms it takes, how to use the pain of tests to improve design
  * SeeingIsBelieving
    * `s_arb`
  * Pry
  * SimpleCov
  * Writing an acceptance test, placing ourselves in the mind of a user and considering their needs, how our feature is going to address them, and then thinking through an interaction with it, using specifics
  * Bringing RSpec into Rails
    * Model tests
    * Controller tests
    * Feature tests (Capybara)
  * Implement the Acceptance test using Capybara
  * Add Phantom
  * Introduce ActiveModel so we can use a presenter, which will allow us to interact with the logic (e.g. for testing) independent of the view
  * Refactoring the code once we got it passing (extracting objects to their own files), using the tests to make sure we don't break it.
  * Identify legacy routes (get :controller/:method) using the `:condition` key, so that we can begin implementing them and ultimately remove it.
  * Add Travis CI so that we can be sure the build is passing on more than just our computer
  * Develop the Permission logic independently, identify test pain, improve design to ease it
    * Identify the test pain (requiring Rails is slow, needing to create a record is slow)
    * Improve the design (pull the knowledge of Merchant up to the caller, so it is just pure Ruby. Tests become simpler, implementation becomes simpler and more flexible)
    * Do longer depend on Rails, so this is very fast and very light
    * Could pull that information from something other than a merchant
    * Merchant could ask "how would my service change if I moved to Florida or upgraded my tier?"
    * More extensible - e.g. could present a form with all the info in it, and run the results through to tell a person what permissions they have
  * Learn about Faker and see how I go about exploring a new library
* Plan for quick gains
  * Integration tests
  * See progress in SimpleCov
  * Focus in on units as they become apparent (rather than doing all tests at the integration level of abstraction)
  * How to debug these kind of tests - pry
  * If people become frustrated by the failures - focus on:
    * this isn't changing the fragility of the code, it's changing when we identify the problem
    * ie when we run the test right after working on the feature, vs in front of a client 2 months later