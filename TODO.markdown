TODO
====

* Proof-of-concept documentation processor to extract and nicely
  format examples and rdoc style comments
* Setup and teardown of tests

Way over there
--------------

* Use mature test frameworks (rspec, shoulda, ...) to run the tests,
  InlineExamples acting as a wrapper
* Write plugin/fork to add InlineExamples capability to rdoc
* Separate runtime and development-time requirements, some kind of
  "stub" inline_examples which gets loaded upon require unless you are
  inteded to run the tests and specifically request the full
  development-time version