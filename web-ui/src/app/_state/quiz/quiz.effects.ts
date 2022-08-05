import { Injectable } from '@angular/core';
import { Actions, createEffect, ofType } from '@ngrx/effects';
import { Store } from '@ngrx/store';
import { HttpClient } from '@angular/common/http';
import {
  catchError,
  exhaustMap,
  map,
  of,
  switchMap,
  withLatestFrom,
} from 'rxjs';
import * as EntityActions from './quiz.actions';
import { QuizState } from './quiz.state';
import { API } from '../../_config/config';
import * as EntitySelectors from './quiz.selectors';
import { environment } from 'src/environments/environment';

const BASE_URL = environment.API_BASE_URL;

@Injectable()
export class QuizEffects {
  constructor(
    private actions$: Actions,
    private store$: Store<QuizState>,
    private http: HttpClient
  ) {}

  fetchRecords$ = createEffect(() =>
    this.actions$.pipe(
      ofType(EntityActions.fetchRecords),
      withLatestFrom(this.store$.select(EntitySelectors.getState)),
      switchMap(([, state]) => {
        return this.http.get(BASE_URL + API.Quiz).pipe(
          map((response: any) =>
            EntityActions.storeRecords({
              data: response,
            })
          ),
          catchError((error) => of(EntityActions.onError({ error })))
        );
      })
    )
  );

  saveNew$ = createEffect(() =>
    this.actions$.pipe(
      ofType(EntityActions.saveNew),
      exhaustMap((action) =>
        this.http.post(BASE_URL + API.Quiz, action.data).pipe(
          map((response: any) => {
            return EntityActions.addNew({ data: response });
          }),
          catchError((error) => of(EntityActions.onError({ error })))
        )
      )
    )
  );

  updateOnApi$ = createEffect(() =>
    this.actions$.pipe(
      ofType(EntityActions.updateOnApi),
      exhaustMap((action) =>
        this.http
          .put(
            BASE_URL + API.Quiz + '/' + action.updatedData.id,
            action.updatedData.changes
          )
          .pipe(
            map((quiz: any) =>
              EntityActions.update({
                updatedData: { id: quiz.id, changes: quiz },
              })
            ),
            catchError((error) => of(EntityActions.onError({ error })))
          )
      )
    )
  );

  delete$ = createEffect(() =>
    this.actions$.pipe(
      ofType(EntityActions.deleteFromApi),
      exhaustMap((action) =>
        this.http.delete(BASE_URL + API.Quiz + '/' + action.id).pipe(
          map(() => EntityActions.deleteRecord({ id: action.id })),
          catchError((error) => of(EntityActions.onError({ error })))
        )
      )
    )
  );

  fetchRecordById$ = createEffect(() =>
    this.actions$.pipe(
      ofType(EntityActions.fetchRecordById),
      exhaustMap((action) =>
        this.http.get(BASE_URL + API.Quiz + '/' + action.id).pipe(
          map((quiz: any) => EntityActions.setFormState({ data: quiz })),
          catchError((error) => of(EntityActions.onError({ error })))
        )
      )
    )
  );
}
