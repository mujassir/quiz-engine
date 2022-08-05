import { createFeatureSelector, createSelector } from '@ngrx/store';
import { StoreKey } from '../../_config/config';
import { quizAdapter, QuizState } from './quiz.state';

export const getState = createFeatureSelector<QuizState>(
  StoreKey.Quiz
);

export const { selectIds, selectEntities, selectAll, selectTotal } =
  quizAdapter.getSelectors();


export const getAllRecords = createSelector(getState, selectAll);

export const formState = createSelector(
  getState,
  (state: QuizState) => state.formState
);


