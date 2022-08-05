using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using QuizEngine.Core.Dtos;
using QuizEngine.Core.Models;
using QuizEngine.Service.Filters.ActionFilters;
using QuizEngine.Service.Interfaces;
using System.Security.Claims;

namespace QuizEngine.Controllers;


[Route("api/quizzes")]
[ApiController]
public class QuizzesController : BaseApiController
{
    public QuizzesController(IRepositoryManager repository, ILoggerManager logger, IMapper mapper) : base(repository, logger, mapper)
    {
    }

    [HttpPost]
    [ServiceFilter(typeof(ValidationFilterAttribute))]
    public async Task<IActionResult> Create([FromBody] QuizCreationDto input)
    {
        var record = _mapper.Map<Quiz>(input);
        await _repository.Quiz.Create(record);
        await _repository.SaveAsync();
        //var response = _mapper.Map<QuizDto>(record);
        return CreatedAtRoute(new { id = record.Id }, record);
    }


    [HttpGet]
    //[ResponseCache(CacheProfileName = "30SecondsCaching")]
    public async Task<IActionResult> GetAll()
    {
        try
        {
            //ClaimTypes.Sid
            var userClaim = HttpContext.User.Claims.FirstOrDefault(p => p.Type == ClaimTypes.Sid);
            var userId = userClaim?.Value;
            var list = await _repository.Quiz.GetAll(userId, trackChanges: false);
            var listDto = _mapper.Map<IEnumerable<QuizDto>>(list);
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
        var record = await _repository.Quiz.GetById(id, trackChanges: false);
        if (record is null)
        {
            _logger.LogInfo($"Record with id: {id} doesn't exist in the database.");
            return NotFound();
        }
        else
        {
            var recordDto = _mapper.Map<QuizDto>(record);
            return Ok(recordDto);
        }
    }



    [HttpGet("{id}/questions")]
    [Authorize]
    //[ResponseCache(CacheProfileName = "30SecondsCaching")]
    public async Task<IActionResult> GetQuestions(int id)
    {
        try
        {
            var list = await _repository.Question.GetAll(id, trackChanges: false);
            var listDto = _mapper.Map<IEnumerable<QuestionDto>>(list);
            return Ok(listDto);
        }
        catch (Exception ex)
        {
            _logger.LogError($"Something went wrong in the {nameof(GetAll)} action {ex}");
            return StatusCode(500, "Internal server error");
        }
    }


    [HttpPut("{id}")]
    [ServiceFilter(typeof(ValidationFilterAttribute))]
    //[ServiceFilter(typeof(ValidateTeacherExists))]
    public async Task<IActionResult> Update(int id, [FromBody] QuizUpdateDto input)
    {
        var record = await _repository.Quiz.GetById(id, trackChanges: true);
        if (record is null)
        {
            _logger.LogInfo($"Record with id: {id} doesn't exist in the database.");
            return NotFound();
        }
        else
        {
            if ((record.IsPubslished.HasValue == false || record.IsPubslished.Value == false)
                && input.IsPubslished == true)
            {
                input.PublishedDate = DateTime.Now;
                var random = new Random();
                const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
                input.PubslishedId = new string(Enumerable.Repeat(chars, 6).Select(s => s[random.Next(s.Length)]).ToArray());

            }
            _mapper.Map(input, record);
            await _repository.SaveAsync();
            return Ok(record);
        }


    }

    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteById(int id)
    {
        await _repository.Quiz.DeleteById(id);
        await _repository.SaveAsync();
        return Ok(id);
    }



    #region Anonymous Methods

    [HttpGet("published/{publishId}")]
    [AllowAnonymous]
    public async Task<IActionResult> GetByPublishId(string publishId)
    {
        var record = await _repository.Quiz.GetByPublishId(publishId, trackChanges: false);
        if (record is null)
        {
            _logger.LogInfo($"Record with publishId: {publishId} doesn't exist in the database.");
            return NotFound();
        }
        else
        {
            var recordDto = _mapper.Map<QuizDto>(record);
            recordDto.NoOfQuestions = await _repository.Question.GetCount(record.Id);
            return Ok(recordDto);
        }
    }

    [HttpGet("published/{publishId}/question/{questionIndex}")]
    [AllowAnonymous]
    public async Task<IActionResult> GetQuestionByPublishId(string publishId, int questionIndex)
    {
        var quiz = await _repository.Quiz.GetByPublishId(publishId, trackChanges: false);
        if (quiz is null)
        {
            _logger.LogInfo($"Record with publishId: {publishId} doesn't exist in the database.");
            return NotFound();
        }
        else
        {
            var question = await _repository.Question.GetNextQuestion(quiz.Id, questionIndex);
            var answers = await _repository.Answer.GetAll(question.Id, false);
            var questionDto = _mapper.Map<QuestionDto>(question);
            if (answers != null && answers.Count() > 0) questionDto.Answers = _mapper.Map<IEnumerable<AnswerDto>>(answers);
            return Ok(questionDto);
        }
    }

    #endregion
}
