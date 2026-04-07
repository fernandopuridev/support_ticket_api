admin = User.create!(
  name: "Admin",
  email: "admin@email.com",
  password: "123456",
  role: :admin
)

user = User.create!(
  name: "João",
  email: "joao@email.com",
  password: "123456",
  role: :user
)