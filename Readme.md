# TDD Class, 8 Dec 2014

## Monday

### Morning

* Make sure computers are set up and working (Ruby, Rails, RSpec)
* A bit about me
* A bit about you
  * Stephanie Ortiz, and Michael Roth
* Identify course goals and possibilities
  * Where you're at (familiarity with)
    * Programming
    * Ruby (here is a list of topics, we can cover any you want)
    * Rails
    * TDD
  * What you want to get out of it
    * What would make this a success?
    * Tools
      * guessing RSpec in Rails
      * We can really incorporate anything you want
  * Anything specifically you want to know?
* High level TDD discussion
  * http://tutorials.jumpstartlab.com/topics/testing/testing_fundamentals.html
  * Also discuss testing scopes: Integration vs Unit
  * Also discuss BDD: Acceptance testing
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

* Either
  * Red/Green/Refactor + Ruby familiarity with Minitest - http://tutorials.jumpstartlab.com/topics/testing/intro-to-tdd.html
  * If interested, can do some code retreat exercises - https://github.com/turingschool/code_retreat
  * If that all sounds boring, Event Reporter - http://tutorials.jumpstartlab.com/projects/event_reporter.html

### Lunch

- [ ] Fix up editor so I can run this in SiB
- [ ] Pare down RSpec to just most relevant parts (make this a gist)


### Afternoon

* Overview of relevant RSpec syntax
  - In editor via cheatsheet
* What does testing look like for Rails applications?
  * Cucumber / RSpec feature tests
    - purpose
    - scope
  * Testing models
    - associations (integration)
    - validations (occasionally integration)
  * Testing controllers
    - when to do this
  * Scopes of testing acceptance vs unit and outside-in vs inside-out

### After work

- [ ] Meet up with Jeff at 4ish to discuss the day and determine the trajectory for the rest of the week
- * Consolidate my notes from other repos
  - [ ] code/jsl/tdd-class
  - [ ] this file
- [ ] Update binary to point to new repo


## Tuesday

Maybe the morning working on http://tutorials.jumpstartlab.com/projects/event_reporter.html and talking about designing objects, how to deal with dependency injection or mocking/stubbing?

## Wednesday

## Thursday

## Friday
