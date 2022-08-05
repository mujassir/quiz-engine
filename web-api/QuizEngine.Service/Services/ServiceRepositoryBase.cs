using Microsoft.EntityFrameworkCore;
using QuizEngine.Core.Models;
using QuizEngine.Repo.Data;
using QuizEngine.Repo.GenericRepository.Service;
using QuizEngine.Service.Interfaces;

namespace QuizEngine.Service.Services;

public class ServiceRepositoryBase<T> : RepositoryBase<T>, IRepository<T> where T : ModelBase
{
    public ServiceRepositoryBase(RepositoryContext repositoryContext) : base(repositoryContext)
    {
    }
    public async Task Create(T input) => await CreateAsync(input);
    public async Task Create(T[] input) => await CreateAsync(input);

    public async Task<IEnumerable<T>> GetAll(bool trackChanges)
        => await FindAllAsync(trackChanges).Result.ToListAsync();
    public async Task<T?> GetById(int id, bool trackChanges)
        => await FindByConditionAsync(c => c.Id.Equals(id), trackChanges).Result.SingleOrDefaultAsync();
    public async Task DeleteById(int id)
        => await RemoveAsync(FindByConditionAsync(c => c.Id.Equals(id),false).Result.SingleOrDefault());
}
