const allergens = {
  eggs: 1,
  peanuts: 2,
  shellfish: 4,
  strawberries: 8,
  tomatoes: 16,
  chocolate: 32,
  pollen: 64,
  cats: 128,
}

export class Allergies {
  constructor(score) {
    this.allergenList = [];

    for (let [key, value] of Object.entries(allergens)) {
      if ((value & score) === value) {
        this.allergenList.push(key)
      }
    }
  }

  list() {
    return [...this.allergenList]
  }

  allergicTo(allergen) {
    return (this.allergenList.indexOf(allergen)) !== -1
  }
}
