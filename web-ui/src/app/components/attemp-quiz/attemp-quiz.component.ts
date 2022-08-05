import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { FormGroupState } from 'ngrx-forms';
import { Observable, Subject } from 'rxjs';
import Answer from '../../_models/answer';
import Question from '../../_models/question';
import Quiz from '../../_models/quiz';
import { QuestionFacade } from '../../_state/question/question.facade';

@Component({
  selector: 'app-attemp-quiz',
  templateUrl: './attemp-quiz.component.html',
  styleUrls: ['./attemp-quiz.component.css'],
})
export class AttemptQuizComponent implements OnInit {
  questionFormState: FormGroupState<Question>;
  // answersList = new  Subject<Answer[]>();
  answersList: Answer[];
  quiz: Quiz;
  questions: Question[];
  queryParam_quizPublishId = '';
  loadedByQueryParam = false;
  selectedQuestionId = 0;
  answerStatement = '';
  questionIndex = 0;
  quizPoints = 0;
  contentVisible = 'before-quiz-start';
  constructor(
    private route: ActivatedRoute,
    public facade: QuestionFacade
  ) {}
  ngOnInit(): void {
    this.facade.formState$.subscribe((state) => {
      console.log('State: ', state);
      this.questionFormState = state;
      this.answersList = state.value.answers;
      this.selectedQuestionId = state.value.id;
      if (this.selectedQuestionId == undefined) this.selectedQuestionId = 0;
    });
    this.facade.quiz$.subscribe((q) => {
      this.quiz = q;
    });

    // check query params
    this.route.queryParams.subscribe((params) => {
      this.queryParam_quizPublishId = params['publishId'];
      this.facade.setQuizPublishId(this.queryParam_quizPublishId);
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
      this.facade.saveChanges(question);
      this.selectedQuestionId = 0;
      this.facade.resetFormState();
    }
  }
  cancel() {
    this.selectedQuestionId = 0;
    this.facade.resetFormState();
  }
  delete(id: number) {
    if (confirm('Are you sure you want to delete the Quiz?'))
      this.facade.deleteRecord(id);
  }

  addNew() {
    this.facade.setFormState({
      quizId: this.quiz.id,
      id: -1,
      statement: '',
      hasMultipleAnswers: false,
      answers: [],
      correctAnswer: '',
    });
  }
  question_Click(question: Question) {
    this.facade.fetchRecordById(question.id);
    this.answerStatement = '';
    // this.facade.setFormState(question);
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
      this.facade.setFormState(question);
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
    this.facade.setFormState(question);
  }

  startQuiz() {
    this.quizPoints = 0;
    this.questionIndex = 0;
    this.contentVisible = 'quiz-started';
    this.facade.setQuestionIndex(
      this.quiz.pubslishedId + '',
      this.questionIndex
    );
  }

  nextQuestion() {
    // increase question index
    var selectionCount = this.answersList.filter(p=>p.userSelection == true).length;
    if(selectionCount == 0){
      alert('You must have to select an answer to navigate to the next question');
    }
    else{
    this.calculatePoints();
    this.questionIndex++;
    this.facade.setQuestionIndex(
      this.quiz.pubslishedId + '',
      this.questionIndex
    );
    }
  }

  calculatePoints() {
    var qAnswers = this.questionFormState.value.answers;

    var correctionStatus = true;
    for (let index = 0; index < qAnswers.length; index++) {
      const element = qAnswers[index];

      var selectionAnswer = this.answersList.filter(
        (p) => p.id == element.id
      )[0];

      var isUserSelected = selectionAnswer.userSelection;
      if (isUserSelected == undefined) isUserSelected = false;

      if (isUserSelected != element.isCorrect) {
        correctionStatus = false;
      }
    }

    if (correctionStatus == true) this.quizPoints++;
  }

  anserItem_Click(answer: Answer) {
    var answers = JSON.parse(
      JSON.stringify(this.answersList)
    ) as typeof this.answersList;
    for (let index = 0; index < answers.length; index++) {
      const element = answers[index];
      if (this.questionFormState.value.hasMultipleAnswers) {
        if (element.id == answer.id) {
          answers[index] = {
            ...element,
            userSelection: !element.userSelection,
          };
        }
      } else {
        answers[index] = { ...element, userSelection: element.id == answer.id };
      }
    }
    this.answersList = answers;
  }

  finishQuiz() {
    this.calculatePoints();
    this.contentVisible = 'quiz-finished';
  }
}
