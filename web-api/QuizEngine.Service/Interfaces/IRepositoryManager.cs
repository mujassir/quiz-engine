namespace QuizEngine.Service.Interfaces;

public interface IRepositoryManager
{
    IQuizRepository Quiz { get; }
    IQuestionRepository Question { get; }
    IAnswerRepository Answer { get; }
    IUserAuthenticationRepository UserAuthentication { get; }
    Task SaveAsync();
}
