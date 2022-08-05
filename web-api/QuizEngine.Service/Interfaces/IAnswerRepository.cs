using QuizEngine.Core.Models;

namespace QuizEngine.Service.Interfaces;

public interface IAnswerRepository : IRepository<Answer>
{
    Task<IEnumerable<Answer>> GetAll(int questionId, bool trackChanges);

    Task DeleteByQuestionId(int questionId);


}
