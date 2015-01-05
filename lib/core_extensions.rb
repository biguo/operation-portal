module CoreExtensions
  def require_core_ext
    Dir["#{Rails.root}/lib/core/*.rb"].each do |f|
      require_dependency f
    end
  end
end
Object.instance_eval { include CoreExtensions } 
