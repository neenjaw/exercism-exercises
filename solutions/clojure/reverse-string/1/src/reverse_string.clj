(ns reverse-string)

(defn reverse-string [s]
  (clojure.string/join ""
    (loop [str_coll (clojure.string/split s #"")
         acc      []]
    (if (empty? str_coll)
      acc
      (recur (rest str_coll) (cons (first str_coll) acc)))))
)