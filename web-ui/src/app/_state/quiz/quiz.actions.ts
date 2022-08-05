import { createAction, props } from '@ngrx/store';
import { Update } from '@ngrx/entity';
import Quiz from '../../_models/quiz';

const ACTION_PREFIX = "[Quiz/API] ";

export const fetchRecords = createAction(
  ACTION_PREFIX + 'fetchRecords'
);

export const fetchRecordById= createAction(
  ACTION_PREFIX + 'fetchRecordById',
  props<{ id: number }>()
);

export const storeRecords = createAction(
  ACTION_PREFIX +  'storeRecords',
  props<{ data: Quiz[] }>()
);


export const resetFormState = createAction(
  ACTION_PREFIX + 'resetFormState'
);

export const setFormState = createAction(
  ACTION_PREFIX + 'setFormState',
  props<{ data: Quiz }>()
);

export const addNew = createAction(
  ACTION_PREFIX + 'addNew',
  props<{ data: Quiz }>()
);
export const saveNew = createAction(
  ACTION_PREFIX + 'saveNew',
  props<{ data: Quiz }>()
);

export const saveNewSuccess = createAction(
  ACTION_PREFIX + 'saveNewSuccess',
  props<{ data: Quiz }>()
);

export const update = createAction(
  ACTION_PREFIX + 'update',
  props<{ updatedData: Update<Quiz> }>()
);
export const updateOnApi = createAction(
  ACTION_PREFIX + 'updateOnApi',
  props<{ updatedData: Update<Quiz> }>()
);
export const updateSuccess = createAction(
  ACTION_PREFIX + 'updateSuccess'
);

export const deleteRecord = createAction(
  ACTION_PREFIX + 'deleteRecord',
  props<{ id: number }>()
);
export const deleteFromApi = createAction(
  ACTION_PREFIX + 'deleteFromApi',
  props<{ id: number }>()
);



export const onError = createAction(
  ACTION_PREFIX + 'onError',
  props<any>()
);

