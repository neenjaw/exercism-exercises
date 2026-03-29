const dayNumber = {
  Sunday: 0,
  Monday: 1,
  Tuesday: 2,
  Wednesday: 3,
  Thursday: 4,
  Friday: 5,
  Saturday: 6,
}

const ordinalToNumber = {
  '1st': 1,
  '2nd': 2,
  '3rd': 3,
  '4th': 4,
  '5th': 5,
}

export const meetupDay = (year, month, dayOfTheWeek, descriptor) => {
  const date = new Date(year, month);
  const meetupMonth = date.getMonth();
  const meetupDay = dayNumber[dayOfTheWeek];
  const isMatchFn = getMatchFn(year, meetupMonth, meetupDay, descriptor);

  let dayCount = 0;

  while (date.getMonth() == meetupMonth) {
    if (date.getDay() === meetupDay) dayCount++;

    if (isMatchFn(date.getDay(), date.getDate(), dayCount))
      return date;

    advanceDate(date);
  }

  throw new Error("meetup doesn't exist")
}

// getMatchFn
// Takes some parameters regarding the day being looked for, then returns a
// matching function to be able to determine when the meetup day is reached.
const getMatchFn = (year, month, meetupDay, descriptor) => {
  if (ordinalToNumber[descriptor]) {
    return matchOrdinalOccurance(descriptor, meetupDay);
  } else if (descriptor === 'teenth') {
    return matchTeenthOccuranc(meetupDay);
  } else if (descriptor === 'last') {
    return matchLastOccurance(year, month, meetupDay);
  }
}

// If the day being looked for is the 1st, 2nd, 3rd, 4th, 5th ___ of the month
function matchOrdinalOccurance(ord, meetupDay) {
  const nthDay = ordinalToNumber[ord];

  return (day, _date, dayCount) => {
    if (day === meetupDay && dayCount === nthDay)
      return true;
    return false;
  };
}

// If the meetupDay is supposed to be between the 13-19th of the month
function matchTeenthOccuranc(meetupDay) {
  return (day, date) => {
    if (day === meetupDay && date >= 13 && date <= 19)
      return true;
    return false;
  };
}

// If the meetupday is the last ___ of the month
function matchLastOccurance(year, month, meetupDay) {
  const lastDayOfMonth = (new Date(year, month + 1, 0)).getDate();
  const startOfLastWeek = lastDayOfMonth - 6;

  return (day, date) => {
    if (day === meetupDay && date >= startOfLastWeek)
      return true;
    return false;
  };
}

const advanceDate = (date, n = 1) => date.setDate(date.getDate() + n);
