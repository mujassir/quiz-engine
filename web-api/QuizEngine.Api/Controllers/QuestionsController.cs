using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using QuizEngine.Core.Dtos;
using QuizEngine.Core.Models;
using QuizEngine.Service.Filters.ActionFilters;
using QuizEngine.Service.Interfaces;

namespace QuizEngine.Controllers;


[Route("api/questions")]
[ApiController]
public class QuestionsController : BaseApiController
{
    public QuestionsController(IRepositoryManager repository, ILoggerManager logger, IMapper mapper) : base(repository, logger, mapper)
    {
    }

    [HttpPost]
    //[ServiceFilter(typeof(ValidationFilterAttribute))]
    public async Task<IActionResult> Create([FromBody] QuestionCreationDto input)
    {
        var record = _mapper.Map<Question>(input);
        await _repository.Question.Create(record);
        await _repository.SaveAsync();
        if (input.Answers != null && input.Answers.Any())
        {
            foreach (var item in input.Answers)
            {
                item.Id = 0;
                item.QuestionId = record.Id;
            }
            var answers = _mapper.Map<IEnumerable<Answer>>(input.Answers).ToArray();
            await _repository.Answer.Create(answers);
        }
        await _repository.SaveAsync();
        return CreatedAtRoute(new { id = record.Id }, record);
    }


    [HttpGet]
    //[ResponseCache(CacheProfileName = "30SecondsCaching")]
    public async Task<IActionResult> GetAll()
    {
        try
        {
            var list = await _repository.Question.GetAll(trackChanges: false);
            var listDto = _mapper.Map<IEnumerable<QuestionDto>>(list);
            return Ok(listDto);
        }
        catch (Exception ex)
        {
            _logger.LogError($"Something went wrong in the {nameof(GetAll)} action {ex}");
            return StatusCode(500, "Internal server error");
        }
    }


    [HttpGet("{id}")]
    public async Task<IActionResult> GetById(int id)
    {
        var record = await _repository.Question.GetById(id, trackChanges: false);
        if (record is null)
        {
            _logger.LogInfo($"Record with id: {id} doesn't exist in the database.");
            return NotFound();
        }
        else
        {
            var recordDto = _mapper.Map<QuestionDto>(record);
            var answers = await _repository.Answer.GetAll(id, false);
            if (answers != null && answers.Count() > 0) recordDto.Answers = _mapper.Map<IEnumerable<AnswerDto>>(answers);
            return Ok(recordDto);
        }
    }


    [HttpPut("{id}")]
    [ServiceFilter(typeof(ValidationFilterAttribute))]
    //[ServiceFilter(typeof(ValidateTeacherExists))]
    public async Task<IActionResult> Update(int id, [FromBody] QuestionUpdateDto input)
    {
        var record = await _repository.Question.GetById(id, trackChanges: true);
        if (record is null)
        {
            _logger.LogInfo($"Record with id: {id} doesn't exist in the database.");
            return NotFound();
        }
        else
        {
            _mapper.Map(input, record);
            await _repository.Answer.DeleteByQuestionId(id);
            await _repository.SaveAsync();
            if (input.Answers != null && input.Answers.Any())
            {
                foreach (var item in input.Answers)
                {
                    item.Id = 0;
                    item.QuestionId = record.Id;
                }
                var answers = _mapper.Map<IEnumerable<Answer>>(input.Answers).ToArray();
                await _repository.Answer.Create(answers);
                await _repository.SaveAsync();

            }

            return Ok(record);
        }


    }

    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteById(int id)
    {
        await _repository.Question.DeleteById(id);
        await _repository.SaveAsync();
        return Ok(id);
    }
}
