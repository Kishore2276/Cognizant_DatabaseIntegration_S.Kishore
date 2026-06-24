use("college_nosql");

db.createCollection("feedback");

db.feedback.insertMany([
{
  student_id: 1,
  course_code: "CS101",
  semester: "2022-ODD",
  rating: 5,
  comments: "Excellent teaching.",
  tags: ["challenging","well-structured"],
  submitted_at: new Date("2022-11-30T10:15:00Z"),
  attachments: [{filename:"notes.pdf",size_kb:240}]
},
{
  student_id: 2,
  course_code: "CS101",
  semester: "2022-ODD",
  rating: 4,
  comments: "Good examples.",
  tags: ["good-examples"],
  submitted_at: new Date("2022-11-28T09:00:00Z"),
  attachments: []
},
{
  student_id: 3,
  course_code: "CS101",
  semester: "2023-EVEN",
  rating: 3,
  comments: "Average course.",
  tags: ["moderate"],
  submitted_at: new Date("2023-04-10T11:00:00Z"),
  attachments: []
},
{
  student_id: 4,
  course_code: "CS102",
  semester: "2022-ODD",
  rating: 5,
  comments: "Very informative.",
  tags: ["excellent","practical"],
  submitted_at: new Date("2022-11-26T15:30:00Z"),
  attachments: []
},
{
  student_id: 5,
  course_code: "CS102",
  semester: "2023-EVEN",
  rating: 4,
  comments: "Useful content.",
  tags: ["well-structured"],
  submitted_at: new Date("2023-04-12T12:00:00Z"),
  attachments: []
},
{
  student_id: 6,
  course_code: "CS103",
  semester: "2022-ODD",
  rating: 2,
  comments: "Needs improvement.",
  tags: ["difficult"],
  submitted_at: new Date("2022-11-20T08:00:00Z"),
  attachments: []
},
{
  student_id: 7,
  course_code: "EC101",
  semester: "2022-ODD",
  rating: 1,
  comments: "Poor experience.",
  tags: ["hard"],
  submitted_at: new Date("2022-11-18T10:00:00Z"),
  attachments: []
},
{
  student_id: 8,
  course_code: "ME101",
  semester: "2023-EVEN",
  rating: 4,
  comments: "Interesting course.",
  tags: ["practical"],
  submitted_at: new Date("2023-04-15T14:00:00Z"),
  attachments: []
},
{
  student_id: 9,
  course_code: "CS103",
  semester: "2023-EVEN",
  rating: 5,
  comments: "Excellent explanations.",
  tags: ["excellent"],
  submitted_at: new Date("2023-04-18T16:00:00Z"),
  attachments: []
},
{
  student_id: 10,
  course_code: "CS101",
  semester: "2023-EVEN",
  rating: 4,
  comments: "Helpful instructor.",
  tags: ["good-examples","practical"],
  submitted_at: new Date("2023-04-20T10:00:00Z")
}
]);

db.feedback.countDocuments();

db.feedback.find().pretty()

db.feedback.find({
    course_code: "CS101"
}).pretty()

db.feedback.find({
    attachments: { $exists: false }
}).pretty()

