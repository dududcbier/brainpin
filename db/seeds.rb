User.create!([
  {name: "Harry Potter", password: "senha", phone: "12345678", cpf: "12345678910", email: "hp@email.com", avatar_id: nil},
  {name: "Dumbledore", password: "senha", phone: "12345678", cpf: "12345672910", email: "d@email.com", avatar_id: nil}
])

Registrant.create!([
  {user_id: 2}
])

Student.create!([
  {interest: "Math", school_year: 8, birth_date: "2018-06-30", user_id: 1}
])

Teacher.create!([
  {office: "1234", registrant_id: 1}
])

Learnable.create!([
  {name: "Math"},
  {name: "Biology"},
  {name: "Algebra"},
  {name: "Statistics"},
  {name: "Genetics"},
  {name: "Linear Equations"},
  {name: "Quadratic Equations"},
  {name: "Probability"},
  {name: "DNA"}
])

Course.create!([
  {learnable_id: 1},
  {learnable_id: 2}
])

Topic.create!([
  {course_id: 1, learnable_id: 3},
  {course_id: 1, learnable_id: 4},
  {course_id: 2, learnable_id: 5}
])

Subtopic.create!([
  {topic_id: 1, learnable_id: 6},
  {topic_id: 1, learnable_id: 7},
  {topic_id: 2, learnable_id: 8},
  {topic_id: 3, learnable_id: 9}
])

Material.create!([
  {teacher_id: 1, subtopic_id: 1, description: "Quadratic Formula", url: "https://en.wikipedia.org/wiki/Quadratic_equation", file: nil, rating: nil}
])
mongo_questions = MongoQuestion.create!([
  {topics: ["1"], difficulty: 1, points: 10, text: "Solve for x: x + 2 = 4", 
    right_answer: RightAnswer.new(text: "x = 2"),
    wrong_answers: [ 
      WrongAnswer.new(text: "x = 6", plausibility: 5),
      WrongAnswer.new(text: "x = 3", plausibility: 0),
      WrongAnswer.new(text: "x = 4", plausibility: 0),
      WrongAnswer.new(text: "x = 8", plausibility: 1)
    ]
  },
  {topics: ["1"], difficulty: 1, points: 10, text: "Solve for x: 8x + 2 = 6", 
    right_answer: RightAnswer.new(text: "x = 1/2"),
    wrong_answers: [ 
      WrongAnswer.new(text: "x = 1/4", plausibility: 0),
      WrongAnswer.new(text: "x = 1", plausibility: 2),
      WrongAnswer.new(text: "x = 6/8", plausibility: 1),
      WrongAnswer.new(text: "x = 1/3", plausibility: 0)
    ]
  },
  {topics: ["1"], difficulty: 1, points: 10, text: "Solve for x: 4x + 20 = 0", 
    right_answer: RightAnswer.new(text: "x = -5"),
    wrong_answers: [ 
      WrongAnswer.new(text: "x = 5", plausibility: 5),
      WrongAnswer.new(text: "x = 80", plausibility: 2),
      WrongAnswer.new(text: "x = -80", plausibility: 2),
      WrongAnswer.new(text: "x = 10", plausibility: 0)
    ]
  },
  {topics: ["1"], difficulty: 1, points: 10, text: "Solve for x: x + 2 = 4 + 2x", 
    right_answer: RightAnswer.new(text: "x = -2"),
    wrong_answers: [ 
      WrongAnswer.new(text: "x = 2", plausibility: 2),
      WrongAnswer.new(text: "x = 0", plausibility: 0),
      WrongAnswer.new(text: "x = 4", plausibility: 0),
      WrongAnswer.new(text: "x = 1/2", plausibility: 0)
    ]
  },
  {topics: ["1"], difficulty: 1, points: 10, text: "Solve for x: 10x = 20", 
    right_answer: RightAnswer.new(text: "x = 2"),
    wrong_answers: [ 
      WrongAnswer.new(text: "x = 0", plausibility: 0),
      WrongAnswer.new(text: "x = 4", plausibility: 0),
      WrongAnswer.new(text: "x = 10", plausibility: 0),
      WrongAnswer.new(text: "x = 1/2", plausibility: 2)
    ]
  },
  {topics: ["1"], difficulty: 1, points: 10, text: "Solve for x: 2(x + 2) = 8", 
    right_answer: RightAnswer.new(text: "x = 2"),
    wrong_answers: [ 
      WrongAnswer.new(text: "x = 6", plausibility: 5),
      WrongAnswer.new(text: "x = 3", plausibility: 0),
      WrongAnswer.new(text: "x = 4", plausibility: 0),
      WrongAnswer.new(text: "x = 8", plausibility: 1)
    ]
  },
  {topics: ["1"], difficulty: 1, points: 10, text: "Solve for x: 5(x + 2) − 4(x + 1) = 7", 
    right_answer: RightAnswer.new(text: "x = 1"),
    wrong_answers: [ 
      WrongAnswer.new(text: "x = 2", plausibility: 0),
      WrongAnswer.new(text: "x = 3", plausibility: 0),
      WrongAnswer.new(text: "x = 4", plausibility: 0),
      WrongAnswer.new(text: "x = 0", plausibility: 0)
    ]
  },
  {topics: ["1", "2"], difficulty: 3, points: 20, text: "Solve the system below: y = x^2 + 1, y = x + 1", 
    right_answer: RightAnswer.new(text: "x = 0, y = 1"),
    wrong_answers: [ 
      WrongAnswer.new(text: "x = 0, y = -1", plausibility: 1),
      WrongAnswer.new(text: "x = 1, y = 0", plausibility: 1),
      WrongAnswer.new(text: "x = -1, y = 0", plausibility: 1),
      WrongAnswer.new(text: "x = 0, y = 0", plausibility: 0)
    ]
  },
  {topics: ["1", "2"], difficulty: 3, points: 20, text: "Solve the system below: y = x^2 + 4, y = 4x", 
    right_answer: RightAnswer.new(text: "x = 2, y = 8"),
    wrong_answers: [ 
      WrongAnswer.new(text: "x = -2, y = 8", plausibility: 1),
      WrongAnswer.new(text: "x = 2, y = -8", plausibility: 1),
      WrongAnswer.new(text: "x = -2, y = -8", plausibility: 1),
      WrongAnswer.new(text: "No solution", plausibility: 0)
    ]
  },
  {topics: ["1", "2"], difficulty: 3, points: 20, text: "Solve the system below: y = x^2, y = x + 2", 
    right_answer: RightAnswer.new(text: "x = 2, y = 4 or x = -1, y = 1"),
    wrong_answers: [ 
      WrongAnswer.new(text: "x = 2, y = 4 or x = 1, y = -1", plausibility: 1),
      WrongAnswer.new(text: "x = -2, y = 4 or x = 1, y = 1", plausibility: 1),
      WrongAnswer.new(text: "x = 2, y = -4 or x = -1, y = 1", plausibility: 1),
      WrongAnswer.new(text: "No solution", plausibility: 0)
    ]
  }
])

mongo_questions.each do |q|
  Question.create!(registrant_id: 1, mongo_id: q.id.to_s)
end

