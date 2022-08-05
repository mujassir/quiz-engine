import { createReducer, on } from '@ngrx/store';
import { createFormGroupState, onNgrxForms } from 'ngrx-forms';
import { StoreKey } from 'src/app/_config/config';
import Quiz from 'src/app/_models/quiz';
import { quizAdapter, QuizState } from './quiz.state';
import * as EntityActions from './quiz.actions';

const STORE_KEY = StoreKey.Quiz;

export const initialState: QuizState = quizAdapter.getInitialState({
  formState: createFormGroupState(STORE_KEY, <Quiz>{}),
});

export const reducer = createReducer(
  initialState,
  onNgrxForms(),

  // NFS Queue Reducers


  on(EntityActions.resetFormState, (state, action) => {
    return {
      ...state,
      formState: createFormGroupState(STORE_KEY, <Quiz>{}),
    };
  }),
  on(EntityActions.setFormState, (state, action) => {
    return {
      ...state,
      formState: createFormGroupState(STORE_KEY, action.data),
    };
  }),
  on(EntityActions.storeRecords, (state, action) => {
    return {
      ...state,
      ...quizAdapter.setAll(action.data, state),
    };
  }),
  on(EntityActions.addNew, (state, action) => {
    return {
      ...state,
      ...quizAdapter.addOne(action.data, state),
    };
  }),

  on(EntityActions.update, (state, action) => {
    return {
      ...state,
      ...quizAdapter.updateOne(action.updatedData, state),
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
      ...quizAdapter.removeOne(action.id, state),
    };
  }),
  on(EntityActions.saveNewSuccess, (state, action) => {
    return {
      ...state,
      ...quizAdapter.addOne(
        action.data,
        quizAdapter.removeOne('0', state)
      ),
    };
  }),


);
