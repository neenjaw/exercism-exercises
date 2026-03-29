export class GradeSchool {
  constructor() {
    this.grades = new Map()
  }

  // return object of school roster using the grade method
  roster() {
    return Object.fromEntries(
            new Map(
              [...this.grades.keys()]
                .map(g => [`${g}`, this.grade(g)])))
  }

  // add a child child to a grade
  add(name, grade) {
    if (!this.grades.has(grade)) this.grades.set(grade, new Array())

    const students = this.grades.get(grade)
    students.push(name)
    students.sort()
  }

  // return the names of students in the grade.
  grade(grade) {
    if (!this.grades.has(grade)) return new Array();
    return [...this.grades.get(grade)]
  }
}
