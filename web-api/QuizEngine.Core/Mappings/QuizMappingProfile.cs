using AutoMapper;
using QuizEngine.Core.Dtos;
using QuizEngine.Core.Models;

namespace QuizEngine.Core.Mappings;
public class QuizMappingProfile : Profile
{
    public QuizMappingProfile()
    {
        CreateMap<Quiz, QuizDto>();

        CreateMap<QuizCreationDto, Quiz>();

        CreateMap<QuizUpdateDto, Quiz>().ReverseMap();
    }
}
