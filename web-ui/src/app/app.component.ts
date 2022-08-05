import { Component } from '@angular/core';
import User from './_models/user';
import { TokenStorageService } from './services/token-storage.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
})
export class AppComponent {
  private roles: string[] = [];
  isLoggedIn = false;
  showAdminBoard = false;
  showModeratorBoard = false;
  username?: string;

  constructor(private tokenStorageService: TokenStorageService) {}

  ngOnInit(): void {

    this.tokenStorageService.logout.subscribe((p) => (this.isLoggedIn = false));
    this.tokenStorageService.loggedIn.subscribe((user: User) => {
      this.isLoggedIn = true;
      this.username = (user.firstName + ' ' + user.lastName).trim();
      if (this.username.length == 0) this.username = user.email;
    });

    this.isLoggedIn = !!this.tokenStorageService.getToken();

    if (this.isLoggedIn) {
      const user = this.tokenStorageService.getUser();
      console.log('user: ', user);
      this.roles = user.roles;

      this.username = user.firstName + ' ' + user.lastName;
    }

  }

  logout(): void {
    this.isLoggedIn = false;
    this.tokenStorageService.signOut();
    window.location.reload();
  }
}
