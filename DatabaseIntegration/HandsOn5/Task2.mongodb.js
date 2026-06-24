use("college_nosql");


db.feedback.find({ rating: 5 }).pretty();


db.feedback.find({
    course_code: "CS101",
    tags: "challenging"
}).pretty();


db.feedback.find(
    {},
    {
        student_id: 1,
        course_code: 1,
        rating: 1,
        _id: 0
    }
).pretty();


db.feedback.updateMany(
    { rating: { $lt: 3 } },
    { $set: { needs_review: true } }
);


db.feedback.find({ needs_review: true }).pretty();


db.feedback.updateMany(
    { needs_review: true },
    { $push: { tags: "reviewed" } }
);


db.feedback.find({ needs_review: true }).pretty();


db.feedback.deleteMany({
    semester: "2021-EVEN"
});


db.feedback.find({
    semester: "2021-EVEN"
}).pretty();
