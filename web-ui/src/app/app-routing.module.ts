import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { RegisterComponent } from './components/register/register.component';
import { LoginComponent } from './components/login/login.component';
import { ProfileComponent } from './components/profile/profile.component';
import { AuthGuard } from './auth.guard';

const routes: Routes = [
  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegisterComponent },
  { path: 'profile', component: ProfileComponent, canActivate: [AuthGuard] },
  {
    path: 'quiz',
    loadChildren: () =>
      import('./components/quiz/quiz.module').then((m) => m.QuizModule),
    canActivate: [AuthGuard],
  },
  {
    path: 'quiz-detail',
    loadChildren: () =>
      import('./components/quiz-detail/quiz-detail.module').then(
        (m) => m.QuizDetailModule
      ),
    canActivate: [AuthGuard],
  },
  {
    path: 'attempt-quiz',
    loadChildren: () =>
      import('./components/attemp-quiz/attemp-quiz.module').then(
        (m) => m.AttemptQuizModule
      ),
  },
  { path: '', redirectTo: 'quiz', pathMatch: 'full' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
