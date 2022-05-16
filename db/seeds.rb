p 'Generating Users...'
user_1 = User.create!(first_name: 'James', last_name: 'Stamps',  email: 'james@gmail.com', password: 'password')
user_2 = User.create!(first_name: 'Kai', last_name: 'Jones',  email: 'kai@gmail.com', password: 'password')

p 'Generating Courses...'
course_1 = user_1.courses.create!(title: 'Course 1', subject: 'English', description: 'Course 1 description.')
course_2 = user_2.courses.create!(title: 'Course 2', subject: 'Computer Science', description: 'Course 2 description.')

p 'Generating Tests...'

test_1 = course_1.tests.create!(title: "Test 1, from Course 1", user_id: user_1.id)
test_2 = course_2.tests.create!(title: "Test 2, from Course 2", user_id: user_2.id)

p 'Generating Questions...'

questions_1 = test_1.questions.create!(header: "2 + 2 = __", options: ["4", "22", "8", "0"], answer: "4", question_type: "Multiple Choice")
questions_2 = test_2.questions.create!(header: "6 + 5 = __", options: ["65", "56", "11", "1"], answer: "11", question_type: "Multiple-Choice")
