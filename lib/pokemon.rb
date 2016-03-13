class Pokemon
  attr_reader :id, :name, :type, :db
  
  def initialize(id, name, type, db)
    @id = id;
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO 
        pokemon (name, type) 
      VALUES
        ('#{name}', '#{type}');
    SQL
    
    db.execute(sql)
  end
  
  def self.find(id, db)
    sql = <<-SQL
      SELECT 
        id, name, type
      FROM 
        pokemon
      WHERE 
        id = #{id};
    SQL
    
    db.execute(sql).first
  end
  
end
