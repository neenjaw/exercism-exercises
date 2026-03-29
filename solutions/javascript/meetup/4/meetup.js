const lastDateOfMonth = (year, month) => (new Date(year, month+1, 0)).getDate()

const makeRange = (start, end) => [...Array(end - start + 1).keys()].map(v => v + start)

const getDateRange = (year, month, descriptor) => {
  const lastDate = lastDateOfMonth(year, month)

  if (descriptor === "last") {
    return makeRange(lastDate - 6, lastDate)
  } else if (descriptor === "teenth") {
    return makeRange(13, 19)
  } else if (descriptor === "1st") {
    return makeRange(1, 7)
  } else if (descriptor === "2nd") {
    return makeRange(8, 14)
  } else if (descriptor === "3rd") {
    return makeRange(15, 21)
  } else if (descriptor === "4th") {
    return makeRange(22, 28)
  } else if (descriptor === "5th") {
    if (lastDate < 29) return []
    return makeRange(29, lastDate)
  }
}

const days = "Sunday Monday Tuesday Wednesday Thursday Friday Saturday".split(" ")
const convertDayToIndex = day => days.findIndex(e => e === day)

export const meetupDay = (year, month, dayOfTheWeek, descriptor) => {
  const dateRange = getDateRange(year, month, descriptor)
  const matchingDay = convertDayToIndex(dayOfTheWeek)

  const meetup = dateRange
    .map(date => new Date(year, month, date))
    .find(date => date.getDay() === matchingDay)

  if (meetup) return meetup

  throw new Error("meetup doesn't exist")
}