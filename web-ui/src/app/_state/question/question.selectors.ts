import { createFeatureSelector, createSelector } from '@ngrx/store';
import { StoreKey } from 'src/app/_config/config';
import { questionAdapter, QuestionState } from './question.state';

export const getState = createFeatureSelector<QuestionState>(
  StoreKey.Question
);

export const { selectIds, selectEntities, selectAll, selectTotal } =
  questionAdapter.getSelectors();


export const getAllRecords = createSelector(getState, selectAll);

export const formState = createSelector(
  getState,
  (state: QuestionState) => state.formState
);

export const quiz = createSelector(
  getState,
  (state: QuestionState) => state.quiz
);

export const questionIndex = createSelector(
  getState,
  (state: QuestionState) => state.questionIndex
);

