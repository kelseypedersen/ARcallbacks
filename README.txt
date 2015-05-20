- A file created by Sherif.
- Shows the order of callbacks associated with Active Record

__________________________________________________________
b = Bicycle.new(brand: 'schwinn', model: 'the red one')
__________________________________________________________

-- create_table(:bicycles)
   -> 0.0053s
do_after_initialize
#<Bicycle id: nil, brand: "schwinn", model: "the red one">

__________________________________________________________
b = Bicycle.new(brand: 'schwinn', model: 'the red one')
b.save
__________________________________________________________

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

__________________________________________________________
Bicycle.create(brand: 'huffy', model: 'the green one')
__________________________________________________________

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

__________________________________________________________
b.update(model: 'the yellow one')
__________________________________________________________

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

__________________________________________________________
b.destroy
__________________________________________________________

-- create_table(:bicycles)
   -> 0.0052s
do_after_initialize
do_before_validation
do_after_validation
do_before_save
do_before_create
do_after_create
do_after_save
"#<Bicycle id: 1, brand: "huffy", model: "the green one">"
do_before_destroy
do_around_destroy
do_after_destroy
nil
