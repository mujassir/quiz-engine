using AutoMapper;
using QuizEngine.Core.Dtos;
using QuizEngine.Core.Models;

namespace QuizEngine.Core.Mappings;
public class QuestionMappingProfile : Profile
{
    public QuestionMappingProfile()
    {
        CreateMap<Question, QuestionDto>();

        CreateMap<QuestionCreationDto, Question>();

        CreateMap<QuestionUpdateDto, Question>().ReverseMap();
    }
}
