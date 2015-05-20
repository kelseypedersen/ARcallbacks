require 'active_record'

`rm bicycles.db`

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database =>  'bicycles.db'
)

ActiveRecord::Migration.create_table :bicycles do |t|
  t.string :brand
  t.string :model
end

ActiveRecord::Migrator.up 'nothing'


# ---

class Bicycle < ActiveRecord::Base

  after_initialize :do_after_initialize
  after_find :do_after_find
  after_touch :do_after_touch
  before_validation :do_before_validation
  after_validation :do_after_validation
  before_save :do_before_save
  # around_save :do_around_save
  after_save :do_after_save
  before_create :do_before_create
  # around_create :do_around_create
  after_create :do_after_create
  before_update :do_before_update
  around_update :do_around_update
  after_update :do_after_update
  before_destroy :do_before_destroy
  around_destroy :do_around_destroy
  after_destroy :do_after_destroy
  # after_commit :do_after_commit
  # after_rollback :do_after_rollback


  def do_after_initialize
    puts "do_after_initialize"
    true
  end

  def do_after_find
    puts "do_after_find"
    true
  end

  def do_after_touch
    puts "do_after_touch"
    true
  end

  def do_before_validation
    puts "do_before_validation"
    true
  end

  def do_after_validation
    puts "do_after_validation"
    true
  end

  def do_before_save
    puts "do_before_save"
    true
  end

  def do_around_save
    puts "do_around_save"
    true
  end

  def do_after_save
    puts "do_after_save"
    true
  end

  def do_before_create
    puts "do_before_create"
    true
  end

  def do_around_create
    puts "do_around_create"
    true
  end

  def do_after_create
    puts "do_after_create"
    true
  end

  def do_before_update
    puts "do_before_update"
    true
  end

  def do_around_update
    puts "do_around_update"
    true
  end

  def do_after_update
    puts "do_after_update"
    true
  end

  def do_before_destroy
    puts "do_before_destroy"
    true
  end

  def do_around_destroy
    puts "do_around_destroy"
    true
  end

  def do_after_destroy
    puts "do_after_destroy"
    true
  end

  def do_after_commit
    puts "do_after_commit"
    true
  end

  def do_after_rollback
    puts "do_after_rollback"
    true
  end
end

# ---
# playing with the diff AR methods here, yo

p b = Bicycle.new(brand: 'schwinn', model: 'the red one')
p b.save
p "*********"
p Bicycle.create(brand: 'huffy', model: 'the green one')
p "*********"
p b.update(model: 'the yellow one')
p "*********"
p Bicycle.commit
p "*********"
p b.destroy
# p Bicycle.all
