import { createAction, props } from '@ngrx/store';
import { Update } from '@ngrx/entity';
import Question from 'src/app/_models/question';
import Quiz from 'src/app/_models/quiz';

const ACTION_PREFIX = '[Question/API] ';

export const fetchRecords = createAction(ACTION_PREFIX + 'fetchRecords');

export const fetchRecordById = createAction(
  ACTION_PREFIX + 'fetchRecordById',
  props<{ id: number }>()
);

export const fetchRecordsByQuizId = createAction(
  ACTION_PREFIX + 'fetchRecordsByQuizId',
  props<{ quizId: number }>()
);

export const storeRecords = createAction(
  ACTION_PREFIX + 'storeRecords',
  props<{ data: Question[] }>()
);

export const resetFormState = createAction(ACTION_PREFIX + 'resetFormState');

export const setFormState = createAction(
  ACTION_PREFIX + 'setFormState',
  props<{ data: Question }>()
);
export const setQuestionIndex = createAction(
  ACTION_PREFIX + 'setQuestionIndex',
  props<{ quizPublishId: string; questionIndex: number }>()
);

export const setQuizId = createAction(
  ACTION_PREFIX + 'setQuizId',
  props<{ quizId: number }>()
);
export const setQuizPublishId = createAction(
  ACTION_PREFIX + 'setQuizPublishId',
  props<{ quizPublishId: string }>()
);
export const storeQuiz = createAction(
  ACTION_PREFIX + 'storeQuiz',
  props<{ quiz: Quiz }>()
);

export const addNew = createAction(
  ACTION_PREFIX + 'addNew',
  props<{ data: Question }>()
);
export const saveNew = createAction(
  ACTION_PREFIX + 'saveNew',
  props<{ data: Question }>()
);

export const saveNewSuccess = createAction(
  ACTION_PREFIX + 'saveNewSuccess',
  props<{ data: Question }>()
);

export const update = createAction(
  ACTION_PREFIX + 'update',
  props<{ updatedData: Update<Question> }>()
);
export const updateOnApi = createAction(
  ACTION_PREFIX + 'updateOnApi',
  props<{ updatedData: Update<Question> }>()
);

export const updateSuccess = createAction(ACTION_PREFIX + 'updateSuccess');

export const deleteRecord = createAction(
  ACTION_PREFIX + 'deleteRecord',
  props<{ id: number }>()
);
export const deleteFromApi = createAction(
  ACTION_PREFIX + 'deleteFromApi',
  props<{ id: number }>()
);

export const onError = createAction(ACTION_PREFIX + 'onError', props<any>());
