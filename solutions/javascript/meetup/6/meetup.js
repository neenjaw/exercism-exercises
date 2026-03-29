const lastDateOfMonth = (year, month) => (new Date(year, month+1, 0)).getDate()

const makeRange = (start, end) => [...Array(end - start + 1).keys()].map(v => v + start)

const dateRangeMap = new Map([
  ["last",   (lastDate) => makeRange(lastDate - 6, lastDate)],
  ["teenth", () => makeRange(13, 19)],
  ["1st",    () => makeRange(1, 7)],
  ["2nd",    () => makeRange(8, 14)],
  ["3rd",    () => makeRange(15, 21)],
  ["4th",    () => makeRange(22, 28)],
  ["5th",    (lastDate) => (lastDate < 29) ? [] : makeRange(29, lastDate)],
])

const getDateRange = (year, month, descriptor) => {
  const lastDate = lastDateOfMonth(year, month)
  return dateRangeMap.get(descriptor)(lastDate)
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