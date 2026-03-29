const lastDateOfMonth = (year, month) => (new Date(year, month+1, 0)).getDate()

const makeRange = (start, end) => [...Array(end - start + 1).keys()].map(v => v + start)

const makeLastRange   = (lastDate) => makeRange(lastDate - 6, lastDate)
const makeTeenthRange = () => makeRange(13, 19)
const make1stRange    = () => makeRange(1, 7)
const make2ndRange    = () => makeRange(8, 14)
const make3rdRange    = () => makeRange(15, 21)
const make4thRange    = () => makeRange(22, 28)
const make5thRange    = (lastDate) => (lastDate < 29) ? [] : makeRange(29, lastDate)

const dateRangeMap = new Map([
  ["last",   makeLastRange],
  ["teenth", makeTeenthRange],
  ["1st",    make1stRange],
  ["2nd",    make2ndRange],
  ["3rd",    make3rdRange],
  ["4th",    make4thRange],
  ["5th",    make5thRange],
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