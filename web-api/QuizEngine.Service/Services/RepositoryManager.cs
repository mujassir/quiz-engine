using AutoMapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using QuizEngine.Core.Models;
using QuizEngine.Repo.Data;
using QuizEngine.Service.Interfaces;

namespace QuizEngine.Service.Services;

public class RepositoryManager : IRepositoryManager
{
    private RepositoryContext _repositoryContext;

    private IQuizRepository _quizRepository;
    private IQuestionRepository _questionRepository;
    private IAnswerRepository _answerRepository;
    private IUserAuthenticationRepository _userAuthenticationRepository;
    private UserManager<User> _userManager;
    private IMapper _mapper;
    private IConfiguration _configuration;

    public RepositoryManager(RepositoryContext repositoryContext, UserManager<User> userManager, IMapper mapper, IConfiguration configuration)
    {
        _repositoryContext = repositoryContext;
        _userManager = userManager;
        _mapper = mapper;
        _configuration = configuration;
    }

    public IQuizRepository Quiz
    {
        get
        {
            if (_quizRepository is null)
                _quizRepository = new QuizRepository(_repositoryContext);
            return _quizRepository;
        }
    }
    public IQuestionRepository Question
    {
        get
        {
            if (_questionRepository is null)
                _questionRepository = new QuestionRepository(_repositoryContext);
            return _questionRepository;
        }
    }
    public IAnswerRepository Answer
    {
        get
        {
            if (_answerRepository is null)
                _answerRepository = new AnswerRepository(_repositoryContext);
            return _answerRepository;
        }
    }

    public IUserAuthenticationRepository UserAuthentication
    {
        get
        {
            if (_userAuthenticationRepository is null)
                _userAuthenticationRepository = new UserAuthenticationRepository(_userManager, _configuration, _mapper);
            return _userAuthenticationRepository;
        }
    }
    public Task SaveAsync() => _repositoryContext.SaveChangesAsync();
}
