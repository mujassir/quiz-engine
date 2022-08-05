export default class Answer {
  id: number;
  statement: string;
  isCorrect: boolean;
  questionId?: number;
  //
  userSelection?: boolean | undefined;
  constructor() {
    this.userSelection = false;
  }
}
