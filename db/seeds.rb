[
  {
    name: 'Bob',
    email: 'bob@example.com',
    password: 'givemeatoken'
  }
].each do |user|
  User.create(
    user.merge(
      password_confirmation: user[:password]
    )
  )
end
