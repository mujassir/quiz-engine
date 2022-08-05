using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using QuizEngine.Core.Dtos;
using QuizEngine.Core.Models;
using QuizEngine.Service.Filters.ActionFilters;
using QuizEngine.Service.Interfaces;

namespace QuizEngine.Controllers;


[Route("api/auth")]
[ApiController]
[AllowAnonymous]
public class AuthController : BaseApiController
{
    public AuthController(IRepositoryManager repository, ILoggerManager logger, IMapper mapper) : base(repository, logger, mapper)
    {
    }

    [HttpPost("register")]
    [ServiceFilter(typeof(ValidationFilterAttribute))]
    public async Task<IActionResult> RegisterUser([FromBody] UserRegistrationDto userRegistration)
    {

        var userResult = await _repository.UserAuthentication.RegisterUserAsync(userRegistration);
        return !userResult.Succeeded ? new BadRequestObjectResult(userResult) : StatusCode(201);
    }

    [HttpPost("login")]
    [ServiceFilter(typeof(ValidationFilterAttribute))]
    public async Task<IActionResult> Authenticate([FromBody] UserLoginDto user)
    {
        var userInfo = await _repository.UserAuthentication.ValidateUserAsync(user);

        return userInfo == null
            ? Unauthorized()
            : Ok(new
            {
                User = userInfo,
                AccessToken = await _repository.UserAuthentication.CreateTokenAsync()
            });
    }

}
