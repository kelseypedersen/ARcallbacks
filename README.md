- A file created by Sherif.
- Shows the order of callbacks associated with Active Record

******************************************************
b = Bicycle.new(brand: 'schwinn', model: 'the red one')
******************************************************
-- create_table(:bicycles)
   -> 0.0053s
do_after_initialize
#<Bicycle id: nil, brand: "schwinn", model: "the red one">

******************************************************
b = Bicycle.new(brand: 'schwinn', model: 'the red one')
p b.save
******************************************************

-- create_table(:bicycles)
   -> 0.0059s
do_after_initialize
#<Bicycle id: nil, brand: "schwinn", model: "the red one">
do_before_validation
do_after_validation
do_before_save
do_before_create
do_after_create
do_after_save
true

******************************************************
p Bicycle.create(brand: 'huffy', model: 'the green one')
******************************************************

-- create_table(:bicycles)
   -> 0.0062s
do_after_initialize
do_before_validation
do_after_validation
do_before_save
do_before_create
do_after_create
do_after_save
#<Bicycle id: 1, brand: "huffy", model: "the green one">

******************************************************
p b.update(model: 'the yellow one')
******************************************************

-- create_table(:bicycles)
   -> 0.0075s
do_before_validation
do_after_validation
do_before_save
do_before_update
do_around_update
do_after_update
do_after_save
true

******************************************************
p b.destroy
******************************************************
-- create_table(:bicycles)
   -> 0.0052s
do_after_initialize
do_before_validation
do_after_validation
do_before_save
do_before_create
do_after_create
do_after_save
#<Bicycle id: 1, brand: "huffy", model: "the green one">
do_before_destroy
do_around_destroy
do_after_destroy
nil

# p Bicycle.all
