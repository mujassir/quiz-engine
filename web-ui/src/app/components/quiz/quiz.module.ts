import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';

import * as quizStore from '../../_state/quiz/quiz.reducer';
import { NgrxFormsModule } from 'ngrx-forms';
import { QuizComponent } from './quiz.component';
import { RouterModule } from '@angular/router';
import { StoreModule } from '@ngrx/store';
import { EffectsModule } from '@ngrx/effects';
import { StoreKey } from '../../_config/config';
import { CommonModule } from '@angular/common';
import { authInterceptorProviders } from '../..//_helpers/auth.interceptor';
import { QuizEffects } from '../../_state/quiz/quiz.effects';
import { QuizFacade } from '../../_state/quiz/quiz.facade';

@NgModule({
  declarations: [
    QuizComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    NgrxFormsModule,
    HttpClientModule,
    RouterModule.forChild([
      { path: '', component: QuizComponent },
      { path: '*', component: QuizComponent },
    ]),
    StoreModule.forFeature(StoreKey.Quiz, quizStore.reducer),
    EffectsModule.forRoot([QuizEffects]),
  ],
  providers: [authInterceptorProviders, QuizFacade],
  bootstrap: [QuizComponent],
})
export class QuizModule {}
