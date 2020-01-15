# CSV Fulfillment Processor
This application is authored in Ruby. Please visit the [official Rubylang homepage](https://www.ruby-lang.org/en/) for installation instructions specific to your development environment

## Installation

### Dependencies

Install dependencies via Ruby library manager [Bundler](https://bundler.io/)

```bundle install``

### Execution

Invoke the program by running the following command in your terminal: `ruby main.rb`

### Test Suite

Invoke the test suite via the following command: `bundle exec rspec`

## Notes

My work in this exercise is specific to the minimum business logic requirements provided. The program architecture is designed to handle a typical e-commerce domain logic problem while the implementation is specific to the business logic. As the company continues R&D releasing new flavors variants, perhaps even expand beyond the chocolate industry, and develops more complicated promotional rules, I would abstract and refactor existing classes and functional procedures to envelope a broader e-commerce solution; start with the minimum viable product, and refactor as requirements expand

A few test specs were left without implementation due to time constraints. Description and context are provided where implementation is lacking.

### Assumptions

In lieu of further detailed documentation provided, these are some assumptions I made about the program guidelines and general use cases:

* Input data is normalized and valid. With subsequent iteration, and more time, I would add services to normalize and sanitize input data, and handle any invalid data accordingly
* Object abstraction and encapsulation generally unnecessary at this stage relative to business logic. As requirements develop, objects, services, and policies such as `Product`, `PromotionRule`, `PromotionRuleset`, `PromotionPolicy`, `PromotionCalculator`, etc. could be implemented in subsequent refactoring