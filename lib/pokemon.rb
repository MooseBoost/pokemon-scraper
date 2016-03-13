class Pokemon
  attr_reader :id, :name, :type, :db
  
  def initialize(id, name, type, db)
    @id = id;
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    db.execute(
      "INSERT INTO 
        pokemon (name, type) 
      VALUES
        ('#{name}', '#{type}');"
      )
  end
  
  def self.find(id, db)
    found_array = db.execute(
      "SELECT 
        id, name, type
      FROM 
        pokemon
      WHERE 
        id = #{id};"
    )
                
    found_array.first            
  end
  
end
