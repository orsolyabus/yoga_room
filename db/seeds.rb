User.delete_all

5.times do
  name = Faker::Dota.hero
  t = Teacher.create name: name
end

5.times do
  name = Faker::OnePiece.character
  s = Student.create name: name
end