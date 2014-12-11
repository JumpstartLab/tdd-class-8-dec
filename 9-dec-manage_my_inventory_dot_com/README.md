## Workflow for working on a feature

* make sure my git is clean
* tests pass
* pull master
* tests pass
* implement my feature
* tests pass
* merge again
* tests pass
* push


## Responsibilities

* Josh
  * get travis working
  * get phantom working
* Mike
  * work on permissions
  * app/service_objects/permissions.rb
  * spec_helper
* Stephanie
  * extract the presenter (pick a name together)
  * extract helper methods
  * extract support code from spec helper


## Features (for merchants)

* see all my items
* search for items within a price range
* not see other merchants' items unless they give me permission
* see quantity of a given item
* search by arbitrary item type
* can't see other merchants' items
* permission to access are determined by
  * tier (ie purchased this feature)
  * location (ie legally allowed to access this feature)

## Things we'd like to explore

* permissions based on tier and location
* more sophisticated searches (based on complex db structure)

```
Permissions:
  search_before_1990? # receive_date
    tier > 2
    location in (CO, WI, TX, CA)
  search_price_range?
    ["AL", "MI", "FL", "OK", "RI", "MD", "NJ", "WV"]
    tier > 1
  sell_expensive_items?
    ["OK", "ND", "ME", "AR", "MS"]
  can_search_by_color?
    true
  max_searches_per_day
    tier >= 3
```
