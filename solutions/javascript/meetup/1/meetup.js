const dayNumber = {
  Sunday: 0,
  Monday: 1,
  Tuesday: 2,
  Wednesday: 3,
  Thursday: 4,
  Friday: 5,
  Saturday: 6,
}

const ordinalNumber = {
  '1st': 1,
  '2nd': 2,
  '3rd': 3,
  '4th': 4,
  '5th': 5,
}

export const meetupDay = (year, month, dayOfTheWeek, ord) => {
  const date = new Date(year, month);
  const meetupMonth = date.getMonth();
  const meetupDay = dayNumber[dayOfTheWeek];
  const matchFn = getMatchFn(year, meetupMonth, meetupDay, ord);

  let dayCount = 0;
  let meetupFound = false;

  while (!meetupFound && date.getMonth() == meetupMonth) {
    if (date.getDay() === meetupDay) dayCount++;

    if (matchFn(date.getDay(), date.getDate(), dayCount)) meetupFound = true;

    if (!meetupFound) {
      addToDate(date, 1);
    }
  }

  if (!meetupFound) {
    throw new Error("meetup doesn't exist")
  }

  return date;
}

// getMatchFn
// Takes some parameters regarding the day being looked for, then returns a
// matching function to be able to determine when the meetup day is reached.
const getMatchFn = (year, month, meetupDay, ord) => {
  if (ordinalNumber[ord]) {
    // If the day being looked for is the 1st, 2nd, 3rd, 4th, 5th ___ of the month
    const nthDay = ordinalNumber[ord]

    return (day, date, dayCount) => {
      if (day === meetupDay && dayCount === nthDay) return true

      return false;
    }
  } else if (ord === 'teenth') {
    // If the meetupDay is supposed to be between the 13-19th of the month
    const teenth = [13,14,15,16,17,18,19];

    return (day, date, dayCount) => {
      if (day === meetupDay && teenth.indexOf(date) !== -1) return true;

      return false;
    }
  } else if (ord === 'last') {
    // If the meetupday is the last ___ of the month
    const lastDayOfMonth = (new Date(year, month+1, 0)).getDate();
    const startOfLastWeek = lastDayOfMonth - 6;

    return (day, date, dayCount) => {
      if (day === meetupDay && date >= startOfLastWeek) return true;

      return false;
    }
  }
}

const addToDate = (date, n) => date.setDate(date.getDate() + n);
