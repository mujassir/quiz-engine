import { Injectable } from '@angular/core';
import { select, Store } from '@ngrx/store';
import Quiz from '../../_models/quiz';
import { TokenStorageService } from '../../services/token-storage.service';
import * as EntityActions from './quiz.actions';
import * as EntitySelectors from './quiz.selectors';

@Injectable()
export class QuizFacade {
  records$ = this.store.pipe(select(EntitySelectors.getAllRecords));
  formState$ = this.store.pipe(select(EntitySelectors.formState));

  constructor(
    private readonly store: Store,
    private tokenService: TokenStorageService
  ) {
    // initialize store

    this.store.dispatch(EntityActions.fetchRecords());
  }

  resetFormState() {
    this.store.dispatch(EntityActions.resetFormState());
  }

  setFormState(obj: Quiz) {
    this.store.dispatch(EntityActions.setFormState({ data: obj }));
  }

  fetchRecordById(id: number) {
    this.store.dispatch(EntityActions.fetchRecordById({ id: id }));
  }

  addNew() {
    const obj: Quiz = {
      id: 0,
      title: '',
    };
    this.store.dispatch(
      EntityActions.addNew({
        data: obj,
      })
    );
    this.store.dispatch(
      EntityActions.setFormState({
        data: obj,
      })
    );
    return obj;
  }
  cancelNew() {
    this.store.dispatch(
      EntityActions.deleteRecord({
        id: 0,
      })
    );
  }

  saveChanges(obj: Quiz) {
    if (obj.id == undefined || obj.id == 0) {
      obj = { ...obj, userId: this.tokenService.getUser().id };
      this.store.dispatch(EntityActions.saveNew({ data: obj }));
      this.store.dispatch(EntityActions.deleteRecord({ id: 0 }));
    } else {
      this.store.dispatch(
        EntityActions.updateOnApi({
          updatedData: { id: obj.id, changes: obj },
        })
      );
    }
  }
  publish(obj: Quiz) {
    obj = { ...obj, isPubslished: true };
    this.store.dispatch(
      EntityActions.updateOnApi({
        updatedData: { id: obj.id, changes: obj },
      })
    );
  }

  deleteRecord(id: number) {
    this.store.dispatch(EntityActions.deleteFromApi({ id: id }));
  }
}
