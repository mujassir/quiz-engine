using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuizEngine.Core.Models
{
    public abstract class ModelBase
    {
        public int Id { get; set; }

    }
}
