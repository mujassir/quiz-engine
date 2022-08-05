using QuizEngine.Core.Models;

namespace QuizEngine.Service.Interfaces;

public interface IQuizRepository : IRepository<Quiz>
{
    Task<IEnumerable<Quiz>> GetAll(string userId,bool trackChanges);

    Task<Quiz?> GetByPublishId(string publishId, bool trackChanges);


}
