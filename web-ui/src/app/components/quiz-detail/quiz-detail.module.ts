import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';

import * as quesitonStore from '../../_state/question/question.reducer';
import { NgrxFormsModule } from 'ngrx-forms';
import { RouterModule } from '@angular/router';
import { StoreModule } from '@ngrx/store';
import { EffectsModule } from '@ngrx/effects';
import { StoreKey } from 'src/app/_config/config';
import { CommonModule } from '@angular/common';
import { authInterceptorProviders } from 'src/app/_helpers/auth.interceptor';
import { QuestionFacade } from 'src/app/_state/question/question.facade';
import { QuizDetailComponent } from './quiz-detail.component';
import { QuestionEffects } from 'src/app/_state/question/question.effects';

@NgModule({
  declarations: [
    QuizDetailComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    NgrxFormsModule,
    HttpClientModule,
    RouterModule.forChild([
      { path: '', component: QuizDetailComponent },
      { path: '*', component: QuizDetailComponent },
    ]),
    StoreModule.forFeature(StoreKey.Question, quesitonStore.reducer),
    EffectsModule.forRoot([QuestionEffects]),
  ],
  providers: [authInterceptorProviders, QuestionFacade],
  bootstrap: [QuizDetailComponent],
})
export class QuizDetailModule {}
