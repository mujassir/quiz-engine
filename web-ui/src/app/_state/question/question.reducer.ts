import { createReducer, on } from '@ngrx/store';
import { createFormGroupState, onNgrxForms } from 'ngrx-forms';
import { StoreKey } from 'src/app/_config/config';
import Question from 'src/app/_models/question';
import Quiz from 'src/app/_models/quiz';
import * as EntityActions from './question.actions';
import { questionAdapter, QuestionState } from './question.state';

const STORE_KEY = StoreKey.Question;

export const initialState: QuestionState = questionAdapter.getInitialState({
  quiz: <Quiz>{},
  questionIndex: 0,
  formState: createFormGroupState(STORE_KEY, <Question>{}),
});

export const reducer = createReducer(
  initialState,
  onNgrxForms(),

  // NFS Queue Reducers

  on(EntityActions.resetFormState, (state, action) => {
    return {
      ...state,
      formState: createFormGroupState(STORE_KEY, <Question>{}),
    };
  }),
  on(EntityActions.setFormState, (state, action) => {
    var correctAnswer = '';
    if (
      action.data.hasMultipleAnswers == false &&
      action.data.answers != null &&
      action.data.answers.length > 0
    ) {
      for (let index = 0; index < action.data.answers.length; index++) {
        const element = action.data.answers[index];
        if (element.isCorrect) {
          correctAnswer = index + '';
          break;
        }
      }
    }
    var data = { ...action.data, correctAnswer: correctAnswer };
    return {
      ...state,
      formState: createFormGroupState(STORE_KEY, data),
    };
  }),
  on(EntityActions.storeQuiz, (state, action) => {
    return {
      ...state,
      quiz: action.quiz,
    };
  }),
  on(EntityActions.setQuestionIndex, (state, action) => {
    return {
      ...state,
      questionIndex: action.questionIndex,
    };
  }),
  on(EntityActions.storeRecords, (state, action) => {
    return {
      ...state,
      ...questionAdapter.setAll(action.data, state),
    };
  }),
  on(EntityActions.addNew, (state, action) => {
    return {
      ...state,
      ...questionAdapter.addOne(action.data, state),
    };
  }),

  on(EntityActions.update, (state, action) => {
    return {
      ...state,
      ...questionAdapter.updateOne(action.updatedData, state),
    };
  }),
  on(EntityActions.updateSuccess, (state, action) => {
    return {
      ...state,
      updateSuccess: true,
    };
  }),
  on(EntityActions.deleteRecord, (state, action) => {
    return {
      ...state,
      ...questionAdapter.removeOne(action.id, state),
    };
  }),
  on(EntityActions.saveNewSuccess, (state, action) => {
    return {
      ...state,
      ...questionAdapter.addOne(
        action.data,
        questionAdapter.removeOne('0', state)
      ),
    };
  })
);
