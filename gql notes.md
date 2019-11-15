mutation{
  createUser(
  name: "New GQL Teacher"
  email: "new@gmail.com"
  isTeacher: false,
  password: "secret"
  ){
    email
    id
    isTeacher
    name
  }
}

query {
  user(id: #{id}) {
    id
    name
    email
    isTeacher
  }
}