Column.seed(:title) do |c|
  c.title = 'First Name'
  c.from_clause = 'Person'
  c.select_clause = 'first_name'
end

Column.seed(:title) do |c|
  c.title = 'Last Name'
  c.from_clause = 'Person'
  c.select_clause = 'last_name'
end

Column.seed(:title) do |c|
  c.title = 'Street'
  c.from_clause = 'CurrentAddress'
  c.select_clause = 'address1'
  c.join_clause = "address_type = 'current'"
end

Column.seed(:title) do |c|
  c.title = 'City'
  c.from_clause = 'CurrentAddress'
  c.select_clause = 'city'
  c.join_clause = "address_type = 'current'"
end

Column.seed(:title) do |c|
  c.title = 'State'
  c.from_clause = 'CurrentAddress'
  c.select_clause = 'state'
  c.join_clause = "address_type = 'current'"
end

Column.seed(:title) do |c|
  c.title = 'Zip'
  c.from_clause = 'CurrentAddress'
  c.select_clause = 'zip'
  c.join_clause = "address_type = 'current'"
end

Column.seed(:title) do |c|
  c.title = 'Email'
  c.from_clause = 'CurrentAddress'
  c.select_clause = 'email'
  c.join_clause = "address_type = 'current'"
end

Column.seed(:title) do |c|
  c.title = 'Picture'
  c.from_clause = 'ProfilePicture'
  c.select_clause = "(CONCAT(ProfilePicture.id, '|', ProfilePicture.filename))"
  c.column_type = 'image'
end

Column.seed(:title) do |c|
  c.title = 'Website'
  c.from_clause = 'Person'
  c.select_clause = 'url'
  c.column_type = 'url'
end

Column.seed(:title) do |c|
  c.title = 'Campus'
  c.from_clause = 'Campus'
  c.select_clause = 'abbrv'
  c.source_model = 'CampusInvolvement'
  c.source_column = 'campus_id'
  c.foreign_key = 'id'
end

Column.seed(:title) do |c|
  c.title = 'School Year'
  c.from_clause = 'SchoolYear'
  c.select_clause = 'name'
  c.source_model = 'CampusInvolvement'
  c.source_column = 'school_year_id'
  c.foreign_key = 'id'
end

Column.seed(:title) do |c|
  c.title = 'Last Login'
  c.from_clause = 'User'
  c.select_clause = 'last_login'
  c.source_model = 'Person'
  c.source_column = 'user_id'
  c.foreign_key = 'id'
end

Column.seed(:title) do |c|
  c.title = 'On Pulse Since'
  c.from_clause = 'MinistryInvolvement'
  c.select_clause = 'start_date'
end
