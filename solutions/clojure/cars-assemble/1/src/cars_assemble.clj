(ns cars-assemble)

(def base-production 221.0)

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (let [rate (* speed base-production)]
    (cond 
      (zero? speed) 0.0
      (<= 1 speed 4) rate
      (<= 5 speed 8) (* rate 0.9)
      (= speed 9) (* rate 0.8)
      (= speed 10) (* rate 0.77))))

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (int (/ (production-rate speed) 60)))
