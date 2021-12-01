[
  {
    name: 'Bob',
    email: 'bob@example.com',
    password: 'givemeatoken'
  }
].each do |user|
  User.create!(user)
end
