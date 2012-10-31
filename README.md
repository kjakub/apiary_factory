api-factory
===========
wrapper around virtualmaster dictionaries to swing with factory girl

Sprint no.1
  - create project on github
    - ok
  - commit this raw notes
    - ok
  - please investigate about possible duplicite project
    - nothing found  
  - refactor following notes as code :) 
  - imlement in all Dictionary at least method member_attributes_not_saved [:not_saved]
  - Dynamically build default Factories from all available dictionaries in submodule
  - FactoryGirl.create(:service_invoice_item)
  - first attribute is dictionary class name not collection or member name
  - make Dictionary class configurable for further refactoring
  - make dynamically created factories names map configurable
  - DOCUMENT ALL CONFIGRATION POSSIBILITIES
  - develop as gem ApiaryFactory
  - include in spec_helpers


Refactor dictionaries: (inspiration) 
- Each Dictionary will inherit from Dictionary module (not namespaced)
- implement DRY helper methods and functionality directly into Dictionaries module 
- move Dictionaries module into Apiary namespace
- test apiary compiler backward compatibility
- member attributes
- collection of member attributes
- dynamically create json outputs
  -collection_of_not_saved => JSON 
  -member_not_saved
  eg dictionary ApiaryFactory(Customer, :member_withot_money)

Apiary blueprint parser implementation (integration tests drying)
- add sematics for setup and teardown blocks in apiary specification
- make this semantics Human readable (possible use of Cucumber-like step definitions)
- rake apiary:test
- test load apiary json data from apib via parser
  - perform setup
  - run test
  - expect data from apiary DSL
    -match http status
    -match headers
    -match JSON (all keys and values not string match)



HOW TO TEST THIS WHOLE SHIT????


