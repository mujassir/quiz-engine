using Microsoft.EntityFrameworkCore;
using QuizEngine.Core.Models;
using QuizEngine.Repo.Data;
using QuizEngine.Repo.GenericRepository.Service;
using QuizEngine.Service.Interfaces;

namespace QuizEngine.Service.Services;

public class QuestionRepository : ServiceRepositoryBase<Question>, IQuestionRepository
{
    public QuestionRepository(RepositoryContext repositoryContext) : base(repositoryContext)
    {
    }

    public async Task<IEnumerable<Question>> GetAll(int quizId, bool trackChanges)
        => await FindByConditionAsync(c => c.QuizId.Equals(quizId), trackChanges);

    public async Task<int> GetCount(int quizId)
       => await FindByConditionAsync(c => c.QuizId.Equals(quizId), false).Result.CountAsync();

    public async Task<Question?> GetNextQuestion(int quizId, int skip)
        => await FindByConditionAsync(c => c.QuizId.Equals(quizId), false).Result.Skip(skip).FirstOrDefaultAsync();

}
