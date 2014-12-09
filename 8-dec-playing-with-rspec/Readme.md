RSpec
=====

Core of RSpec.

Directory structure
-------------------

* [x] spec
* [x] `<something>_spec.rb`
* [x] lib
* [x]`$LOAD_PATH`


Spec anatomy
------------

- [x] Define a suite `RSpec.describe 'Class or concept being tested' do ...end`
- [x] Nested describes `describe('subcategory') { ... }`
- [x] Define a test
  * `it "does something"`
  * can replace`it` with `specify`, `example`
- [x] assertions:
  * `expect(actual_object).to eq expected_object`
  * `expect(actual_object).to_not eq other_object`
  * `expect(a).to eq b` means `a == b`
  * `expect(a).to match b` means `a =~ b`
  * `expect(a).to include be` means `a.include?(b)`
- [x] `pending`
- [ ] `spec_helper`
- [ ] `let` blocks
- [ ] helper methods

Flags
-----

* [x] `--color` or `-c`
* [x] `--format documentation` or `-f d`
* [x] `--fail_fast` stops testing after the first failure
* [ ] `--tag tagname`
