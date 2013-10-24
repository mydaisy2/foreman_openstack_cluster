module ForemanOpenstackCluster
  class Cluster < ActiveRecord::Base
    include HostCommon

    #### Make a table-less model to avoid pointless migrations
    def self.columns
      @columns ||= [];
    end

    def self.column(name, sql_type = nil, default = nil, null = true)
      columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default,
                                                              sql_type.to_s, null)
    end

    # Override the save method to prevent exceptions.
    def save(validate = true)
      validate ? valid? : true
    end
    #### end Tableless

    #column :bar, :string
    #validates_presence_of :bar
    
    def model_name
      self.class.model_name
    end

  end
end