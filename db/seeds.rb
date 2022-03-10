# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'pry'
require 'faker'

puts "destroy all"
Block.destroy_all
Cohort.destroy_all
Course.destroy_all
Homework.destroy_all
Lecture.destroy_all
Note.destroy_all
Notebook.destroy_all
Task.destroy_all
User.destroy_all

puts "creating user 1"
user1 = User.create(
    f_name: 'alex',
    l_name: 'beci',
    email: 'alex@test.com',
    password: '1234',
    is_teacher: true
)

puts "create users"
3.times do 
    User.create(
        f_name: Faker::Name.first_name,
        l_name: Faker::Name.last_name,
        email: Faker::Internet.unique.email,
        password: "1234",
        is_teacher: false
    )
end

puts "creating courses"
5.times do
    Course.create(
        name: Faker::Educator.course_name,
        subject: Faker::Educator.subject,
        description: Faker::Hipster.sentence(word_count: 5),
        price: 9.99,
        teacher_id: user1.id
    )
end
# binding.pry

puts "creating tasks"
6.times do
    Task.create(
        heading: Faker::Lorem.sentence,
        description: Faker::Lorem.paragraph(sentence_count: 2),
        due_date: Faker::Date.between(from: Date.today, to: 30.days.from_now).to_s,
        is_complete: Faker::Boolean.boolean,
        user_id: user1.id
    )
end

puts "creating cohorts"
5.times do
    Cohort.create(
        student_id: User.all.sample.id,
        course_id: Course.all.sample.id
    )
end

puts "creating lectures"
3.times do
    Lecture.create(
        meeting_time: Faker::Date.between(from: Date.today, to: 30.days.from_now).to_s,
        meeting_link: "https://www.youtube.com/watch?v=vtPk5IUbdH0",
        meeting_name: Faker::TvShows::Seinfeld.business,
        meeting_description: Faker::Hipster.sentence(word_count: 5),
        cohort_id: Cohort.all.sample.id
    )
end

puts "creating notebooks"
2.times do
    Notebook.create(
        heading: Faker::TvShows::SiliconValley.company,
        description: Faker::Hipster.sentence(word_count: 5),
        user_id: user1.id
    )
end

puts "creating notes"
5.times do
    Note.create(
        title: Faker::TvShows::SiliconValley.app,
        description: Faker::TvShows::SiliconValley.motto,
        notebook_id: Notebook.all.sample.id
    )
end

puts "created all"
# binding.pry
0