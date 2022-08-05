import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';
import { TokenStorageService } from './services/token-storage.service';

const PUBLIC_ROUTES = [
  'login',
  'register'
];

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {
  constructor(private tokenStorageService: TokenStorageService, private router: Router){}
  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {
      if(PUBLIC_ROUTES.indexOf (route.routeConfig?.path+"") >-1){
        return true;
      }
      else{
        const isLoggedIn = !!this.tokenStorageService.getToken();
        if(!isLoggedIn)  this.router.navigate(['/login']);
        return isLoggedIn;
      }

  }

}
