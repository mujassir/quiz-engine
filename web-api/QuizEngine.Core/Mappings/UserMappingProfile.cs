using AutoMapper;
using QuizEngine.Core.Dtos;
using QuizEngine.Core.Models;

namespace QuizEngine.Core.Mappings;
public class UserMappingProfile : Profile
{
    public UserMappingProfile()
    {
        CreateMap<UserRegistrationDto, User>();
        CreateMap<User, UserInfoDto>();
    }
}
