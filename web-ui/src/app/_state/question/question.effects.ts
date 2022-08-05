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
import * as EntityActions from './question.actions';
import * as EntitySelectors from './question.selectors';
import { environment } from 'src/environments/environment';
import { QuestionState } from './question.state';
import { API } from 'src/app/_config/config';

const BASE_URL = environment.API_BASE_URL;

@Injectable()
export class QuestionEffects {
  constructor(
    private actions$: Actions,
    private store$: Store<QuestionState>,
    private http: HttpClient
  ) {}

  fetchRecords$ = createEffect(() =>
    this.actions$.pipe(
      ofType(EntityActions.fetchRecords),
      withLatestFrom(this.store$.select(EntitySelectors.getState)),
      switchMap(([, state]) => {
        return this.http
          .get(BASE_URL + API.Question + '/' + state.quiz.id)
          .pipe(
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

  fetchRecordsByQuizId$ = createEffect(() =>
    this.actions$.pipe(
      ofType(EntityActions.fetchRecordsByQuizId),
      withLatestFrom(this.store$.select(EntitySelectors.getState)),
      switchMap(([action, state]) => {
        return this.http
          .get(BASE_URL + API.Quiz + '/' + action.quizId + '/questions')
          .pipe(
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
        this.http.post(BASE_URL + API.Question, action.data).pipe(
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
            BASE_URL + API.Question + '/' + action.updatedData.id,
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
        this.http.delete(BASE_URL + API.Question + '/' + action.id).pipe(
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
        this.http.get(BASE_URL + API.Question + '/' + action.id).pipe(
          map((question: any) =>
            EntityActions.setFormState({ data: question })
          ),
          catchError((error) => of(EntityActions.onError({ error })))
        )
      )
    )
  );

  fetchQuizById$ = createEffect(() =>
    this.actions$.pipe(
      ofType(EntityActions.setQuizId),
      exhaustMap((action) =>
        this.http.get(BASE_URL + API.Quiz + '/' + action.quizId).pipe(
          map((quiz: any) => EntityActions.storeQuiz({ quiz: quiz })),
          catchError((error) => of(EntityActions.onError({ error })))
        )
      )
    )
  );
  fetchQuizByPublishId$ = createEffect(() =>
    this.actions$.pipe(
      ofType(EntityActions.setQuizPublishId),
      exhaustMap((action) =>
        this.http
          .get(BASE_URL + API.Quiz + '/published/' + action.quizPublishId)
          .pipe(
            map((quiz: any) => EntityActions.storeQuiz({ quiz: quiz })),
            catchError((error) => of(EntityActions.onError({ error })))
          )
      )
    )
  );
  fetchNextQuestion$ = createEffect(() =>
    this.actions$.pipe(
      ofType(EntityActions.setQuestionIndex),
      exhaustMap((action) =>
        this.http
          .get(
            BASE_URL +
              API.Quiz +
              '/published/' +
              action.quizPublishId +
              '/question/' +
              action.questionIndex
          )
          .pipe(
            map((question: any) =>
              EntityActions.setFormState({ data: question })
            ),
            catchError((error) => of(EntityActions.onError({ error })))
          )
      )
    )
  );
}
