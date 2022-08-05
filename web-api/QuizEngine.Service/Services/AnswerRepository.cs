using Microsoft.EntityFrameworkCore;
using QuizEngine.Core.Models;
using QuizEngine.Repo.Data;
using QuizEngine.Repo.GenericRepository.Service;
using QuizEngine.Service.Interfaces;

namespace QuizEngine.Service.Services;

public class AnswerRepository : ServiceRepositoryBase<Answer>, IAnswerRepository
{
    public AnswerRepository(RepositoryContext repositoryContext) : base(repositoryContext)
    {
    }

    public async Task<IEnumerable<Answer>> GetAll(int questionId, bool trackChanges)
       => await FindByConditionAsync(c => c.QuestionId.Equals(questionId), trackChanges);

    public async Task DeleteByQuestionId(int questionId)
        => await RemoveAsync(FindByConditionAsync(c => c.QuestionId.Equals(questionId), false).Result.ToArray());
}
