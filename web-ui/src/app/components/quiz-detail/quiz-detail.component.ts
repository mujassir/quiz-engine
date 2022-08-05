import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { FormGroupState } from 'ngrx-forms';
import Answer from '../../_models/answer';
import Question from '../../_models/question';
import Quiz from '../../_models/quiz';
import { QuestionFacade } from '../../_state/question/question.facade';

@Component({
  selector: 'app-quiz-detail',
  templateUrl: './quiz-detail.component.html',
  styleUrls: ['./quiz-detail.component.css'],
})
export class QuizDetailComponent implements OnInit {
  questionFormState: FormGroupState<Question>;
  quiz: Quiz;
  questions: Question[];
  queryParam_quizId = '';
  loadedByQueryParam = false;
  selectedQuestionId = 0;
  answerStatement = '';

  constructor(
    private route: ActivatedRoute,
    public questionService: QuestionFacade
  ) {}
  ngOnInit(): void {
    this.questionService.formState$.subscribe((state) => {
      console.log('State: ', state);
      this.questionFormState = state;
      this.selectedQuestionId = state.value.id;
      if (this.selectedQuestionId == undefined) this.selectedQuestionId = 0;
    });
    this.questionService.quiz$.subscribe((q) => {
      this.quiz = q;
    });

    // check query params
    this.route.queryParams.subscribe((params) => {
      this.queryParam_quizId = params['quizId'];
      var quizId = parseInt(this.queryParam_quizId);
      if (quizId > 0) {
        this.questionService.setQuizId(quizId);
        this.loadedByQueryParam = true;
        // this.questionService.fetchRecordByQuizId(quizId);
      }
    });
  }
  save() {
    let question: Question = this.questionFormState.value;
    if (question != undefined && question.statement.length <= 0) {
      alert('Question statement required');
    } else {
      if (question.hasMultipleAnswers == false) {
        // var answers = Object.assign([], question.answers);
        var answers = JSON.parse(
          JSON.stringify(question.answers)
        ) as typeof question.answers;
        for (let index = 0; index < answers.length; index++) {
          const element = answers[index];
          answers[index] = {
            ...element,
            isCorrect: question.correctAnswer == index + '',
          };
        }
        question = { ...question, answers: answers };
      }
      var qId = question.id == -1 ? 0 : question.id;
      question = { ...question, id: qId, quizId: this.quiz.id };
      this.questionService.saveChanges(question);
      this.selectedQuestionId = 0;
      this.questionService.resetFormState();
    }
  }
  cancel() {
    this.selectedQuestionId = 0;
    this.questionService.resetFormState();
  }
  delete(id: number) {
    if (confirm('Are you sure you want to delete the Quiz?'))
      this.questionService.deleteRecord(id);
  }

  addNew() {
    this.questionService.setFormState({
      quizId: this.quiz.id,
      id: -1,
      statement: '',
      hasMultipleAnswers: false,
      answers: [],
      correctAnswer: '',
    });
  }
  question_Click(question: Question) {
    this.questionService.fetchRecordById(question.id);
    this.answerStatement = '';
    // this.questionService.setFormState(question);
  }
  addAnswer() {
    if (this.answerStatement != undefined && this.answerStatement.length > 0) {
      let question: Question = this.questionFormState.value;
      var answers = Object.assign([], question.answers);
      answers.push({
        id: 0,
        isCorrect: false,
        statement: this.answerStatement,
        questionId: question.id,
      });
      question = {
        ...question,
        answers: answers,
      };
      this.questionService.setFormState(question);
      this.answerStatement = '';
    }
  }

  deleteAnswer(answer: Answer) {
    let question: Question = this.questionFormState.value;
    var answers = Object.assign([], question.answers);

    const index = answers.indexOf(answer);
    if (index > -1) {
      answers.splice(index, 1);
    }

    question = {
      ...question,
      answers: answers,
    };
    this.questionService.setFormState(question);
  }
  backToQuizList(){
    this.questionService.resetFormState();
    // this.selectedQuestionId = 0;

  }
}
