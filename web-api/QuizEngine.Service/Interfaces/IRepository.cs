using QuizEngine.Core.Models;

namespace QuizEngine.Service.Interfaces;

public interface IRepository<T> where T : class
{
    Task Create(T input);
    Task Create(T[] input);
    Task<IEnumerable<T>> GetAll(bool trackChanges);
    Task<T?> GetById(int id, bool trackChanges);
    Task DeleteById(int id);
}
