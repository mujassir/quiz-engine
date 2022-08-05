import { Component, OnInit } from '@angular/core';
import { FormGroupState } from 'ngrx-forms';
import Quiz from 'src/app/_models/quiz';
import { QuizFacade } from 'src/app/_state/quiz/quiz.facade';

@Component({
  selector: 'app-quiz',
  templateUrl: './quiz.component.html',
  styleUrls: ['./quiz.component.css'],
})
export class QuizComponent implements OnInit {
  title = 'web-ui';
  modalVisibility = false;
  state: QuizFacade;
  formState: FormGroupState<Quiz>;
  selectedQuizId = 0;
  constructor(private facade: QuizFacade) {
    this.state = facade;
    this.state.formState$.subscribe((p) => (this.formState = p));
  }
  ngOnInit(): void {}
  save() {
    const quiz: Quiz = this.formState.value;
    if (quiz != undefined && quiz.title.length <= 0) {
      alert('Quiz title required');
    } else {
      this.facade.saveChanges(quiz);
      this.selectedQuizId = 0;
      this.facade.resetFormState();
    }
  }
  cancel() {
    debugger
    this.selectedQuizId = 0;
    this.facade.resetFormState();
    this.facade.cancelNew();
  }
  delete(id: number) {
    if (confirm('Are you sure you want to delete the Quiz?'))
      this.facade.deleteRecord(id);
  }
  publish(quiz:Quiz){
    if (confirm('Are you sure you want to publish the Quiz? After publishing you will not be able to edit title and add questions.')){
      this.facade.publish(quiz);
      this.selectedQuizId = 0;
      this.facade.resetFormState();
    }
  }
  edit(quiz:Quiz){
    this.selectedQuizId = quiz.id;
    this.facade.setFormState(quiz);
  }
  allowEdit(quiz:Quiz){
    return quiz.id == 0 || quiz.id == this.selectedQuizId;
  }
}
