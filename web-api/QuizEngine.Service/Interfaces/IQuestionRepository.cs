using QuizEngine.Core.Models;

namespace QuizEngine.Service.Interfaces;

public interface IQuestionRepository : IRepository<Question>
{
    Task<IEnumerable<Question>> GetAll(int quizId,bool trackChanges);
    Task<int> GetCount(int quizId);

    Task<Question?> GetNextQuestion(int quizId,int skip);

}
