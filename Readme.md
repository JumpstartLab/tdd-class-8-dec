TDD 8 Dec 2014
==============

With [Josh Cheek](github.com/JoshCheek/).

Monday
------

### Morning

* Get settled in, make sure everything is installed and working (Ruby, Rails, RSpec, SeeingIsBelieving, internet)
* Figure out what we need to accomplish for the class to be a success
* Discuss how Ruby works (Object Model)

### Afternoon

* Finish Object Model
* Most common RSpec syntax



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
* [Event reporter](http://tutorials.jumpstartlab.com/projects/event_reporter.html)
  * Start this together, discuss approaches to testing we can take
  * Use this to get familiar with RSpec
  * Mocking/Stubbing (File system, in this case)
  * See how test pain causes us to change the design

### Afternoon

* questions
  * figure out what profiling stuff we can use
    * http://tutorials.jumpstartlab.com/topics/performance/queries.html   | how to optimize
    * http://tutorials.jumpstartlab.com/topics/performance/measuring.html | finding places to optimize
    * https://github.com/flyerhzm/bullet                                  | bullet - identify N+1 queries
  * figure out how significant it is to bring in Phantom
  * Can we get a "whitewashed" test from the word document? (then can try turning that into a spec)
  * Why did they want to learn mocking? (Third party APIs)
* `s_arb` Seeing is Believing snippet
* Contact Manager
  * Bring RSpec into a Rails environment
  * Simplecov



Wednesday
---------

### Morning

I'll have a doctor's appointment, so Jorge will work with you this morning.

* Continue Contact Manager

### Afternoon

* Integration testing with Capybara and Selenium (or Phantom)
* Look at how we can incorporate that into Contact Manager 



Thursday
--------

We'll work in a repository called [Storedom](https://github.com/turingschool-examples/storedom)

### Morning

* Acceptance testing conversation (find this tut)
Discuss how CI works, add our repo to Travis, see it running
do it together on first feature from https://github.com/turingschool/assessment_challenges/blob/master/storedom.markdown

Afternoon
  How does day to day process change with test suite
  work independently and try this stuff
  Profiling stuff if we have time
 
 
Friday
------

* Performancy stuff based on Tuesday's conversatino
* VCR?
* Patterns for developing Rails clients?
* More focused discussion of mocking and stubbing?
