/* eslint-disable no-unused-vars */
//
// 'Bob' responds to 5 cases:
//  - Bob answers 'Sure.' if you ask him a question.
//  - He answers 'Whoa, chill out!' if you yell at him.
//  - He retorts 'Calm down, I know what I'm doing!' if you yell a question at him.
//  - He says 'Fine. Be that way!' if you address him without actually saying anything.
//  - He answers 'Whatever.' to anything else.
//

const QUESTION_SAYING         = 'Sure.';
const YELLING_SAYING          = 'Whoa, chill out!';
const YELLING_QUESTION_SAYING = 'Calm down, I know what I\'m doing!';
const SILENT_SAYING           = 'Fine. Be that way!';
const DEFAULT_SAYING          = 'Whatever.';

const isSilence  = phrase => phrase === ''
const isQuestion = phrase => phrase.endsWith('?')
const isYell     = phrase => phrase === phrase.toUpperCase()
const hasLetters = phrase => phrase.toUpperCase() !== phrase.toLowerCase()

export const hey = (message) => {
  const normalMessage = message.trim()

  switch (true) {
    case hasLetters(normalMessage) && isYell(normalMessage) && isQuestion(normalMessage):
      return YELLING_QUESTION_SAYING;

    case hasLetters(normalMessage) && isYell(normalMessage):
      return YELLING_SAYING;

    case isQuestion(normalMessage):
      return QUESTION_SAYING;

    case isSilence(normalMessage):
      return SILENT_SAYING;

    default:
      return DEFAULT_SAYING;
  }
};


