# Quiz Engine

Web based quiz application using Angular, ASP.NET Core Web API &amp; Entity Framework Core


## Database Migration 

- Open Package Manager Console
- Select Project QuizEngine.Repo

Run following commands on Package Manager Console

- `Add-Migration IdentityMigration`
- `Update-Database`



## Flow for User Registration and User Login

For JWT – Token based Authentication with Web API, we’re gonna call 2 endpoints:
- POST `api/auth/register` for User Registration
- POST `api/auth/login` for User Login
