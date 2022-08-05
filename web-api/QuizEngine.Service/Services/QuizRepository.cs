using Microsoft.EntityFrameworkCore;
using QuizEngine.Core.Models;
using QuizEngine.Repo.Data;
using QuizEngine.Repo.GenericRepository.Service;
using QuizEngine.Service.Interfaces;

namespace QuizEngine.Service.Services;

public class QuizRepository : ServiceRepositoryBase<Quiz>, IQuizRepository
{
    public QuizRepository(RepositoryContext repositoryContext) : base(repositoryContext)
    {
    }
    public async Task<IEnumerable<Quiz>> GetAll(string userId, bool trackChanges)
       => await FindByConditionAsync(c => c.UserId == userId, trackChanges);

    public async Task<Quiz?> GetByPublishId(string publishId, bool trackChanges)
        => await FindByConditionAsync(c => c.PubslishedId == publishId && c.IsPubslished == true, trackChanges).Result.SingleOrDefaultAsync();

}
