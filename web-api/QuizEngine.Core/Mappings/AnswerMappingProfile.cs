using AutoMapper;
using QuizEngine.Core.Dtos;
using QuizEngine.Core.Models;

namespace QuizEngine.Core.Mappings;
public class AnswerMappingProfile : Profile
{
    public AnswerMappingProfile()
    {
        CreateMap<Answer, AnswerDto>().ReverseMap();

        CreateMap<AnswerCreationDto, Answer>();

        CreateMap<AnswerAddUpdateDto, Answer>().ReverseMap();

        CreateMap<AnswerUpdateDto, Answer>().ReverseMap();
    }
}
