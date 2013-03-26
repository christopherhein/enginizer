module <%= namespace.camel_case %>
  def self.table_name_prefix
    '<%= namespace %>_'
  end
end