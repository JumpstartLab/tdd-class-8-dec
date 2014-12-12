require 'faker'  # => true

Faker.methods(false)  # => []
Faker.class           # => Module

# What can Faker fake out?
Faker.constants  # => [:Config, :Base, :Address, :Code, :Company, :Finance, :Internet, :Lorem, :Name, :Team, :PhoneNumber, :Business, :Commerce, :VERSION, :Number, :Bitcoin, :Avatar, :Date, :Time, :Hacker, :App]

# Name sounds useful, what can it do?
Faker::Name.methods(false)  # => [:name, :first_name, :last_name, :prefix, :suffix, :title]

# Lets try a few!
Faker::Name.instance_methods(false)  # => []
Faker::Name.name                     # => "Mrs. Margot Runolfsdottir"
Faker::Name.first_name               # => "Wilmer"

# What about Dates?
Faker::Date.methods(false)  # => [:between, :forward, :backward, :birthday]

# Between looks interesting, it probably takes arguments, what are they?
Faker::Date.method(:between).parameters  # => [[:req, :from], [:req, :to]]

# What does :req mean? Lets try different argument types and see what they do (some of these don't work on 1.9.3)
lambda { |a, b=1, *c, d, e:, f:1, **g, &h| }.parameters  # => [[:req, :a], [:opt, :b], [:rest, :c], [:req, :d], [:keyreq, :e], [:key, :f], [:keyrest, :g], [:block, :h]]

# :req means the argument is required, so looks like it takes two dates
# lets see if it includes the ends of is explicitly between those dates
100.times.map { Faker::Date.between(Date.today-1, Date.today+1) }.uniq.sort.map { |d| d.strftime '%Y-%m-%d' }  # => ["2014-12-11", "2014-12-12", "2014-12-13"]

# What else looks interesting?
Faker.constants.each { |name| printf "%-15s - %p\n", name, Faker.const_get(name).methods(false) }  # => [:Config, :Base, :Address, :Code, :Company, :Finance, :Internet, :Lorem, :Name, :Team, :PhoneNumber, :Business, :Commerce, :VERSION, :Number, :Bitcoin, :Avatar, :Date, :Time, :Hacker, :App]


# >> Config          - [:locale=, :locale]
# >> Base            - [:numerify, :letterify, :bothify, :regexify, :fetch, :parse, :translate, :flexible, :method_missing, :rand_in_range]
# >> Address         - [:city, :street_name, :street_address, :secondary_address, :building_number, :zip_code, :time_zone, :zip, :postcode, :street_suffix, :city_suffix, :city_prefix, :state_abbr, :state, :country, :country_code, :latitude, :longitude]
# >> Code            - [:isbn, :ean, :rut]
# >> Company         - [:name, :suffix, :catch_phrase, :bs, :ein, :duns_number, :logo]
# >> Finance         - [:credit_card]
# >> Internet        - [:email, :free_email, :safe_email, :user_name, :password, :domain_name, :fix_umlauts, :domain_word, :domain_suffix, :mac_address, :ip_v4_address, :ip_v6_address, :url, :slug]
# >> Lorem           - [:word, :words, :character, :characters, :sentence, :sentences, :paragraph, :paragraphs]
# >> Name            - [:name, :first_name, :last_name, :prefix, :suffix, :title]
# >> Team            - [:name, :creature, :state]
# >> PhoneNumber     - [:phone_number, :cell_phone, :area_code, :exchange_code, :subscriber_number, :extension]
# >> Business        - [:credit_card_number, :credit_card_expiry_date, :credit_card_type]
# >> Commerce        - [:color, :department, :product_name, :price]
# >> VERSION         - []
# >> Number          - [:number, :decimal, :digit, :hexadecimal, :between, :positive, :negative]
# >> Bitcoin         - [:address, :base58]
# >> Avatar          - [:image]
# >> Date            - [:between, :forward, :backward, :birthday]
# >> Time            - [:between, :forward, :backward]
# >> Hacker          - [:say_something_smart, :abbreviation, :adjective, :noun, :verb, :ingverb, :phrases]
# >> App             - [:name, :version, :author]
