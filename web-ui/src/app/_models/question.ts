import Answer from "./answer";

export default class Question {
  id: number;
  statement: string;
  hasMultipleAnswers: boolean;
  correctAnswer: string;
  quizId?: number;
  answers: Answer[];
}
