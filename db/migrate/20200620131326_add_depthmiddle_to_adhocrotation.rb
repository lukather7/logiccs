class AddDepthmiddleToAdhocrotation < ActiveRecord::Migration
  def change
    
    remove_column :adhocrotations,   :tire1depth
    remove_column :adhocrotations,   :tire2depth
    remove_column :adhocrotations,   :tire3depth
    remove_column :adhocrotations,   :tire4depth
    remove_column :adhocrotations,   :tire5depth
    remove_column :adhocrotations,   :tire6depth
    remove_column :adhocrotations,   :tire7depth
    remove_column :adhocrotations,   :tire8depth
    remove_column :adhocrotations,   :tire9depth
    remove_column :adhocrotations,   :tire10depth
    remove_column :adhocrotations,   :tire11depth
    remove_column :adhocrotations,   :tire12depth
    remove_column :adhocrotations,   :tire13depth
    
    add_column :adhocrotations, :tire1depthmiddle, :integer
    add_column :adhocrotations, :tire2depthmiddle, :integer
    add_column :adhocrotations, :tire3depthmiddle, :integer
    add_column :adhocrotations, :tire4depthmiddle, :integer
    add_column :adhocrotations, :tire5depthmiddle, :integer
    add_column :adhocrotations, :tire6depthmiddle, :integer
    add_column :adhocrotations, :tire7depthmiddle, :integer
    add_column :adhocrotations, :tire8depthmiddle, :integer
    add_column :adhocrotations, :tire9depthmiddle, :integer
    add_column :adhocrotations, :tire10depthmiddle, :integer
    add_column :adhocrotations, :tire11depthmiddle, :integer
    add_column :adhocrotations, :tire12depthmiddle, :integer
    add_column :adhocrotations, :tire13depthmiddle, :integer
    
    add_column :adhocrotations, :tire1depthside, :integer
    add_column :adhocrotations, :tire2depthside, :integer
    add_column :adhocrotations, :tire3depthside, :integer
    add_column :adhocrotations, :tire4depthside, :integer
    add_column :adhocrotations, :tire5depthside, :integer
    add_column :adhocrotations, :tire6depthside, :integer
    add_column :adhocrotations, :tire7depthside, :integer
    add_column :adhocrotations, :tire8depthside, :integer
    add_column :adhocrotations, :tire9depthside, :integer
    add_column :adhocrotations, :tire10depthside, :integer
    add_column :adhocrotations, :tire11depthside, :integer
    add_column :adhocrotations, :tire12depthside, :integer
    add_column :adhocrotations, :tire13depthside, :integer
  end
end
    
