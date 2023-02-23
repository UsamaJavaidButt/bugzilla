5.times do |bug|
    Bug.create!(
        title: "Bug Title #{bug}",
        description: "my great services",
        deadline: "2 days"
    )
end

puts "5 bugs listed"

5.times do |project|
    Project.create!(
        title: "Project Title #{project}",
        bug: "New Bug"
    )
end

puts "5 projects listed"