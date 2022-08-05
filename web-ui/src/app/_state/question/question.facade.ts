import { Injectable } from '@angular/core';
import { select, Store } from '@ngrx/store';
import Question from 'src/app/_models/question';
import * as EntityActions from './question.actions';
import * as EntitySelectors from './question.selectors';

@Injectable()
export class QuestionFacade {
  quiz$ = this.store.pipe(select(EntitySelectors.quiz));
  records$ = this.store.pipe(select(EntitySelectors.getAllRecords));
  formState$ = this.store.pipe(select(EntitySelectors.formState));

  constructor(private readonly store: Store) {
    // initialize store
  }

  resetFormState() {
    this.store.dispatch(EntityActions.resetFormState());
  }

  setFormState(obj: Question) {
    this.store.dispatch(EntityActions.setFormState({ data: obj }));
  }
  setQuizId(quizId: number) {
    this.store.dispatch(EntityActions.setQuizId({ quizId: quizId }));
    this.store.dispatch(EntityActions.fetchRecordsByQuizId({ quizId: quizId }));
  }

  setQuizPublishId(quizPublishId: string) {
    this.store.dispatch(
      EntityActions.setQuizPublishId({ quizPublishId: quizPublishId })
    );
    // this.store.dispatch(EntityActions.fetchRecordsByQuizPublishId({ quizPublishId: quizPublishId }));
  }

  fetchRecordById(id: number) {
    this.store.dispatch(EntityActions.fetchRecordById({ id: id }));
  }

  setQuestionIndex(quizPublishId: string, questionIndex: number) {
    this.store.dispatch(
      EntityActions.setQuestionIndex({
        quizPublishId: quizPublishId,
        questionIndex: questionIndex,
      })
    );
  }

  addNew() {
    const obj: Question = {
      id: 0,
      statement: '',
      hasMultipleAnswers: false,
      answers: [],
      correctAnswer: '',
    };
    this.store.dispatch(
      EntityActions.addNew({
        data: obj,
      })
    );
    this.store.dispatch(
      EntityActions.setFormState({
        data: obj,
      })
    );
    return obj;
  }
  cancelNew() {
    this.store.dispatch(
      EntityActions.deleteRecord({
        id: 0,
      })
    );
  }

  saveChanges(obj: Question) {
    if (obj.id == undefined || obj.id == 0) {
      this.store.dispatch(EntityActions.saveNew({ data: obj }));
      this.store.dispatch(EntityActions.deleteRecord({ id: 0 }));
    } else {
      this.store.dispatch(
        EntityActions.updateOnApi({
          updatedData: { id: obj.id, changes: obj },
        })
      );
    }
  }

  deleteRecord(id: number) {
    this.store.dispatch(EntityActions.deleteFromApi({ id: id }));
  }
}
