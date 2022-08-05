import { createEntityAdapter, EntityAdapter, EntityState } from '@ngrx/entity';
import { FormGroupState } from 'ngrx-forms';
import Question from 'src/app/_models/question';
import Quiz from 'src/app/_models/quiz';

export type QuestionState = IQuestionState<Question>


export const questionAdapter: EntityAdapter<Question> =
  createEntityAdapter<Question>();


  // Extending Entity state with custom attributes

interface IQuestionState<T> extends EntityState<T> {
  quiz: Quiz,
  questionIndex: number;
  formState : FormGroupState<T>
}
