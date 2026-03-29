export class Clock {
  constructor(h, m = 0) {
    const {hour, minute} = calcTime(h, m);

    this.minute = minute;
    this.hour = hour;
  }

  toString() {
    const hh = `${this.hour}`.padStart(2, '0');
    const mm = `${this.minute}`.padStart(2, '0');

    return `${hh}:${mm}`;
  }

  plus(m) {
    const {hour, minute} = calcTime(this.hour, this.minute + m);

    this.minute = minute;
    this.hour = hour;

    return this;
  }

  minus(m) {
    const {hour, minute} = calcTime(this.hour, this.minute - m);

    this.minute = minute;
    this.hour = hour;

    return this;
  }

  equals(clock) {
    return this.toString() === clock.toString();
  }
}

const calcTime = (h, m) => {
  const { minute, hourAdjust } = processMinutes(m);
  const { hour } = processHours(h, hourAdjust);

  return {
    hour,
    minute
  }
}

const processMinutes = minutes => {
  let h = Math.floor(minutes / 60) % 24;
  let m = minutes % 60;

  if (m < 0) {
    m = 60 + m;
  }

  return {
    minute: m,
    hourAdjust: h,
  };
}

const processHours = (hours, adjust = 0) => {
  let h = (hours + adjust) % 24;

  if (h < 0) {
    h = 24 + h;
  }

  return {
    hour: h
  }
}