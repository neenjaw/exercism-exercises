(ns sublist)

(defn sublist? [a b]
  (loop [needle a haystack b]
    (cond 
      (< (count haystack) (count needle)) false
      (= (take (count needle) haystack) needle) true
      :else (recur needle (drop 1 haystack)))))

(defn classify [a b]
  (let [length-a (count a)
        length-b (count b)]
    (cond
      (and (= length-a length-b) (= a b)) :equal
      (and (< length-a length-b) (sublist? a b)) :sublist
      (and (< length-b length-a) (sublist? b a)) :superlist
      :else :unequal)))