using System.ComponentModel.DataAnnotations;
namespace QuizEngine.Core.Dtos;
public class UserInfoDto
{
    public string Id { get; init; }
    public string? FirstName { get; init; }
    public string? LastName { get; init; }

    public string? UserName { get; init; }

    public string? Email { get; init; }
    public string? PhoneNumber { get; init; }
}
