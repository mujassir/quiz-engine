import { createEntityAdapter, EntityAdapter, EntityState } from '@ngrx/entity';
import Quiz from '../../_models/quiz';
import { FormGroupState } from 'ngrx-forms';

export type QuizState = IQuizState<Quiz>


export const quizAdapter: EntityAdapter<Quiz> =
  createEntityAdapter<Quiz>();


  // Extending Entity state with custom attributes

interface IQuizState<T> extends EntityState<T> {
  formState : FormGroupState<T>
}
