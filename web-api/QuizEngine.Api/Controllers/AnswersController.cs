using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using QuizEngine.Core.Dtos;
using QuizEngine.Core.Models;
using QuizEngine.Service.Filters.ActionFilters;
using QuizEngine.Service.Interfaces;

namespace QuizEngine.Controllers;

/// <summary>
/// Answers API Controller
/// </summary>
[Route("api/answers")]
[ApiController]
public class AnswersController : BaseApiController
{
    public AnswersController(IRepositoryManager repository, ILoggerManager logger, IMapper mapper) : base(repository, logger, mapper)
    {
    }

    /// <summary>
    /// Creates new answer record
    /// </summary>
    /// <param name="input">input parameter to be created</param>
    /// <returns>Returns the newly created record with the record (Id)</returns>
    [HttpPost]
    [ServiceFilter(typeof(ValidationFilterAttribute))]
    public async Task<IActionResult> Create([FromBody] AnswerCreationDto input)
    {
        var record = _mapper.Map<Answer>(input);
        await _repository.Answer.Create(record);
        await _repository.SaveAsync();
        return CreatedAtRoute(new { id = record.Id }, record);
    }


    [HttpGet("{questionId}")]
    //[ResponseCache(CacheProfileName = "30SecondsCaching")]
    public async Task<IActionResult> GetAll(int questionId)
    {
        try
        {
            var list = await _repository.Answer.GetAll(trackChanges: false);
            var listDto = _mapper.Map<IEnumerable<AnswerDto>>(list);
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
        var record = await _repository.Answer.GetById(id, trackChanges: false);
        if (record is null)
        {
            _logger.LogInfo($"Record with id: {id} doesn't exist in the database.");
            return NotFound();
        }
        else
        {
            var recordDto = _mapper.Map<AnswerDto>(record);
            return Ok(recordDto);
        }
    }


    [HttpPut("{id}")]
    [ServiceFilter(typeof(ValidationFilterAttribute))]
    //[ServiceFilter(typeof(ValidateTeacherExists))]
    public async Task<IActionResult> Update(int id, [FromBody] AnswerUpdateDto input)
    {
        var record = await _repository.Answer.GetById(id, trackChanges: true);
        if (record is null)
        {
            _logger.LogInfo($"Record with id: {id} doesn't exist in the database.");
            return NotFound();
        }
        else
        {
            _mapper.Map(input, record);
            await _repository.SaveAsync();
            return NoContent();
        }


    }
}
