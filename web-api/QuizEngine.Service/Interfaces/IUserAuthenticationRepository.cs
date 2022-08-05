using Microsoft.AspNetCore.Identity;
using QuizEngine.Core.Dtos;
using QuizEngine.Core.Models;

namespace QuizEngine.Service.Interfaces;

public interface IUserAuthenticationRepository
{
    Task<IdentityResult> RegisterUserAsync(UserRegistrationDto userForRegistration);
    Task<UserInfoDto?> ValidateUserAsync(UserLoginDto loginDto); 
    Task<string> CreateTokenAsync(); 
}

