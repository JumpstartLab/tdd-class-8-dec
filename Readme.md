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

We'll work in a repository called [Storedom](https://github.com/turingschool-examples/storedom)

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

* Performance stuff based on Tuesday's conversation
* VCR?
* Patterns for developing Rails clients?
* More focused discussion of mocking and stubbing?
* Recap